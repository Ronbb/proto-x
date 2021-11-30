import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:json_rpc_2/json_rpc_2.dart' as rpc;
import 'package:stream_channel/stream_channel.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'interface.dart';

class ProtoLanguageServer implements LanguageServer {
  ProtoLanguageServer._(this.peer);

  final rpc.Peer peer;

  bool _isInitialized = false;

  static Iterable<List<T>> _chunks<T>(List<T> data, int chunkSize) sync* {
    if (data.length <= chunkSize) {
      yield data;
      return;
    }
    var low = 0;
    while (low < data.length) {
      if (data.length > low + chunkSize) {
        yield data.sublist(low, low + chunkSize);
      } else {
        yield data.sublist(low);
      }
      low += chunkSize;
    }
  }

  static void _serialize(String data, EventSink<List<int>> sink) {
    final message = utf8.encode(data);
    final header = 'Content-Length: ${message.length}\r\n\r\n';
    sink.add(ascii.encode(header));
    for (var chunk in _chunks(message, 1024)) {
      sink.add(chunk);
    }
  }

  static StreamChannel<String> _channel(
    Stream<List<int>> stream,
    StreamSink<List<int>> sink,
  ) {
    final parser = _Parser(stream);
    final outSink = StreamSinkTransformer.fromHandlers(
      handleData: _serialize,
      handleDone: (sink) {
        sink.close();
        parser.close();
      },
    ).bind(sink);
    return StreamChannel.withGuarantees(parser.stream, outSink);
  }

  static ProtoLanguageServer fromWebSocket(WebSocketChannel socket) {
    final peer = rpc.Peer(socket.cast<String>());
    return ProtoLanguageServer._(peer);
  }

  static Future<ProtoLanguageServer> fromSocket(Socket socket) async {
    final channel = _channel(socket, socket);
    final peer = rpc.Peer(channel);
    return ProtoLanguageServer._(peer);
  }

  static ProtoLanguageServer fromStdio() {
    final channel = _channel(stdin, stdout);
    final peer = rpc.Peer(channel);
    return ProtoLanguageServer._(peer);
  }

  Future<void> start() async {
    _register();
    peer.listen();
    await peer.done;
  }

  _registerRequest(String methodName, Function callback) {
    peer.registerMethod(methodName, (params) {
      if (!_isInitialized) {
        throw rpc.RpcException(-32003, 'The server has not been initialized');
      }
      return callback(params);
    });
  }

  _registerNotification(String methodName, Function callback) {
    peer.registerMethod(methodName, (params) {
      if (_isInitialized) return callback(params);
    });
  }

  TextDocumentItem _documentItem(params) {
    return TextDocumentItem.fromJson(params['textDocument'].value)!;
  }

  VersionedTextDocumentIdentifier _versionedDocument(params) {
    return VersionedTextDocumentIdentifier.fromJson(
      params['textDocument'].value,
    )!;
  }

  TextDocumentIdentifier _document(params) {
    return TextDocumentIdentifier.fromJson(params['textDocument'].value)!;
  }

  Range _range(params) {
    return Range.fromJson(params['range'].value)!;
  }

  Position _position(params) {
    return Position.fromJson(params['position'].value)!;
  }

  CodeActionContext _codeActionContext(params) {
    return CodeActionContext.fromJson(params['context'].value)!;
  }

  ReferenceContext _referenceContext(params) =>
      ReferenceContext.fromJson(params['context'].value)!;

  List<TextDocumentContentChangeEvent> _contentChanges(params) =>
      (params['contentChanges'].value as List)
          .map((change) => TextDocumentContentChangeEvent.fromJson(change))
          .toList()
          .cast();

  String _query(params) => params['query'].value as String;

  void _register() {
    // _lifecycleMethods
    peer
      ..registerMethod('initialize', (rpc.Parameters params) async {
        final serverCapabilities = await initialize(
          params['processId'].value ?? 0,
          params['rootUri'].value ?? '',
          ClientCapabilities.fromJson(params['capabilities'].value)!,
          params['trace'].value ?? 'off',
        );
        _isInitialized = true;
        return {'capabilities': serverCapabilities.toJson()};
      })
      ..registerMethod('initialized', (params) => initialized())
      ..registerMethod('shutdown', close)
      ..registerMethod('exit', exit);

    // _fileHandlingMethods
    _registerNotification('textDocument/didOpen', (params) {
      textDocumentDidOpen(_documentItem(params));
    });
    _registerNotification('textDocument/didChange', (params) {
      textDocumentDidChange(
        _versionedDocument(params),
        _contentChanges(params),
      );
    });
    _registerNotification('textDocument/didClose', (params) {
      textDocumentDidClose(_document(params));
    });

    // _notifications
    diagnostics.map((d) => d.toJson()).forEach(
      (diagnostics) {
        peer.sendNotification('textDocument/publishDiagnostics', diagnostics);
      },
    );
    workspaceEdits.map((e) => e.toJson()).forEach((edit) {
      peer.sendRequest('workspace/applyEdit', edit);
    });
    logMessages.map((e) => e.toJson()).forEach((message) {
      peer.sendNotification('window/logMessage', message);
    });
    showMessages.map((e) => e.toJson()).forEach(
      (message) {
        peer.sendNotification('window/showMessage', message);
      },
    );

    // _completionMethods
    _registerRequest('textDocument/completion', (params) {
      return textDocumentCompletion(_document(params), _position(params))
          .then((r) => r.toJson());
    });

    // _referenceMethods
    _registerRequest('textDocument/definition', (params) {
      return textDocumentDefinition(_document(params), _position(params))
          .then((r) => r.toJson());
    });
    _registerRequest('textDocument/hover', (params) {
      return textDocumentHover(_document(params), _position(params))
          .then((r) => r?.toJson());
    });
    _registerRequest('textDocument/references', (params) {
      return textDocumentReferences(
              _document(params), _position(params), _referenceContext(params))
          .then((r) => r.map((e) => e.toJson()).toList());
    });
    _registerRequest('textDocument/implementation', (params) {
      return textDocumentImplementation(_document(params), _position(params))
          .then((r) => r.map((e) => e.toJson()).toList());
    });
    _registerRequest('textDocument/documentHighlight', (params) {
      return textDocumentHighlight(_document(params), _position(params))
          .then((r) => r.map((e) => e.toJson()).toList());
    });
    _registerRequest('textDocument/documentSymbol', (params) {
      return textDocumentSymbols(_document(params))
          .then((r) => r.map((e) => e.toJson()).toList());
    });
    _registerRequest('workspace/symbol', (params) {
      return workspaceSymbol(_query(params))
          .then((r) => r.map((e) => e.toJson()).toList());
    });

    // _codeActionMethods
    _registerRequest('textDocument/codeAction', (params) {
      return textDocumentCodeAction(
        _document(params),
        _range(params),
        _codeActionContext(params),
      ).then((r) => r.map((e) => e.toJson()).toList());
    });
    _registerRequest('textDocument/codeLens', (params) {
      return textDocumentCodeLens(
        _document(params),
      ).then((r) => r.map((e) => e.toJson()).toList());
    });
    _registerRequest('textDocument/documentLink', (params) {
      return [];
    });
    _registerRequest('workspace/executeCommand', (params) {
      return workspaceExecuteCommand(
        params['command'].value,
        params['arguments']?.value,
      );
    });
    _registerRequest('textDocument/rename', (params) {
      return textDocumentRename(
        _document(params),
        _position(params),
        params['newName'].value,
      ).then((value) => value.toJson());
    });
  }

  @override
  Stream<Diagnostics> diagnostics = Stream<Diagnostics>.empty();

  @override
  void exit() {
    peer.close();
  }

  @override
  Future<ServerCapabilities> initialize(
    int clientPid,
    String rootUri,
    ClientCapabilities clientCapabilities,
    String trace,
  ) async {
    return ServerCapabilities((builder) {
      builder
        ..codeActionProvider = true
        ..codeLensProvider = (CodeLensOptionsBuilder()..resolveProvider = false)
        ..completionProvider
        ..definitionProvider = true
        ..documentFormattingProvider = false
        ..documentHighlightProvider = true
        ..documentLinkProvider
        ..documentOnTypeFormattingProvider =
            (DocumentOnTypeFormattingOptionsBuilder())
        ..documentRangeFormattingProvider = false
        ..documentSymbolProvider = true
        ..executeCommandProvider
        ..hoverProvider = true
        ..implementationProvider = true
        ..referencesProvider = true
        ..renameProvider = true
        ..signatureHelpProvider
        ..textDocumentSync = (TextDocumentSyncOptionsBuilder()
          ..openClose = true
          ..change = TextDocumentSyncKind.full
          ..save = (SaveOptionsBuilder()..includeText = true)
          ..willSave = true
          ..willSaveWaitUntil = true)
        ..workspaceSymbolProvider = true;
    });
  }

  @override
  void initialized() {
    _isInitialized = true;
  }

  @override
  Stream<ShowMessageParams> logMessages = Stream<ShowMessageParams>.empty();

  @override
  Future<void> get done => peer.done;

  @override
  void setupExtraMethods(rpc.Peer peer) {}

  @override
  Stream<ShowMessageParams> showMessages = Stream<ShowMessageParams>.empty();

  @override
  Future<void> close() {
    return peer.close();
  }

  @override
  Future<List> textDocumentCodeAction(
    TextDocumentIdentifier documentId,
    Range range,
    CodeActionContext context,
  ) async {
    return [];
  }

  @override
  Future<List> textDocumentCodeLens(
    TextDocumentIdentifier documentId,
  ) async {
    return [];
  }

  @override
  Future<CompletionList> textDocumentCompletion(
    TextDocumentIdentifier documentId,
    Position position,
  ) async {
    return CompletionList((builder) {
      builder.items.addAll([
        CompletionItem((builder) {
          builder
            ..label = 'message'
            ..kind = CompletionItemKind.classKind;
        }),
      ]);
    });
  }

  @override
  Future<Location> textDocumentDefinition(
    TextDocumentIdentifier documentId,
    Position position,
  ) async {
    return Location();
  }

  @override
  void textDocumentDidChange(
    VersionedTextDocumentIdentifier documentId,
    Iterable<TextDocumentContentChangeEvent> changes,
  ) {
    print(documentId);
    print(changes);
  }

  @override
  void textDocumentDidClose(TextDocumentIdentifier documentId) {}

  @override
  void textDocumentDidOpen(TextDocumentItem document) {
    print(document);
  }

  @override
  Future<List<DocumentHighlight>> textDocumentHighlight(
    TextDocumentIdentifier documentId,
    Position position,
  ) async {
    return [];
  }

  @override
  Future textDocumentHover(
    TextDocumentIdentifier documentId,
    Position position,
  ) async {}

  @override
  Future<List<Location>> textDocumentImplementation(
    TextDocumentIdentifier documentId,
    Position position,
  ) async {
    return [];
  }

  @override
  Future<List<Location>> textDocumentReferences(
    TextDocumentIdentifier documentId,
    Position position,
    ReferenceContext context,
  ) async {
    return [];
  }

  @override
  Future<WorkspaceEdit> textDocumentRename(
    TextDocumentIdentifier documentId,
    Position position,
    String newName,
  ) async {
    return WorkspaceEdit();
  }

  @override
  Future<List<SymbolInformation>> textDocumentSymbols(
    TextDocumentIdentifier documentId,
  ) async {
    return [];
  }

  @override
  Stream<ApplyWorkspaceEditParams> workspaceEdits = Stream.empty();

  @override
  Future<void> workspaceExecuteCommand(
    String command,
    Iterable arguments,
  ) async {}

  @override
  Future<List<SymbolInformation>> workspaceSymbol(String query) async {
    return [];
  }
}

class _Parser {
  final _streamCtl = StreamController<String>();
  Stream<String> get stream => _streamCtl.stream;

  final _buffer = <int>[];
  bool _headerMode = true;
  int _contentLength = -1;

  late StreamSubscription _subscription;

  _Parser(Stream<List<int>> stream) {
    _subscription =
        stream.expand((bytes) => bytes).listen(_handleByte, onDone: () {
      _streamCtl.close();
    });
  }

  Future<void> close() => _subscription.cancel();

  void _handleByte(int byte) {
    _buffer.add(byte);
    if (_headerMode && _headerComplete) {
      _contentLength = _parseContentLength();
      _buffer.clear();
      _headerMode = false;
    } else if (!_headerMode && _messageComplete) {
      _streamCtl.add(utf8.decode(_buffer));
      _buffer.clear();
      _headerMode = true;
    }
  }

  /// Whether the entire message is in [_buffer].
  bool get _messageComplete => _buffer.length >= _contentLength;

  /// Decodes [_buffer] into a String and looks for the 'Content-Length' header.
  int _parseContentLength() {
    final asString = ascii.decode(_buffer);
    final headers = asString.split('\r\n');
    final lengthHeader =
        headers.firstWhere((h) => h.startsWith('Content-Length'));
    final length = lengthHeader.split(':').last.trim();
    return int.parse(length);
  }

  /// Whether [_buffer] ends in '\r\n\r\n'.
  bool get _headerComplete {
    final l = _buffer.length;
    return l > 4 &&
        _buffer[l - 1] == 10 &&
        _buffer[l - 2] == 13 &&
        _buffer[l - 3] == 10 &&
        _buffer[l - 4] == 13;
  }
}
