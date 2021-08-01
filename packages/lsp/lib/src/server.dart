import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'interface.dart';

class LspServer implements LanguageServer {
  const LspServer._(this.server);

  final Server server;

  static LspServer fromWebSocket(WebSocketChannel socket) {
    final server = Server(socket.cast<String>());
    return LspServer._(server);
  }

  static LspServer fromStdio() {
    final channel = StreamChannel<String>(
      StreamTransformer<List<int>, String>.fromHandlers(
        handleData: (value, sink) {
          sink.add(utf8.decode(value));
        },
      ).bind(stdin),
      StreamSinkTransformer<String, List<int>>.fromHandlers(
        handleData: (value, sink) {
          sink.add(utf8.encode(value));
        },
      ).bind(stdout),
    );
    final server = Server(channel);
    return LspServer._(server);
  }

  @override
  // TODO: implement diagnostics
  Stream<Diagnostics> get diagnostics => throw UnimplementedError();

  @override
  void exit() {
    // TODO: implement exit
  }

  @override
  Future<ServerCapabilities> initialize(int clientPid, String rootUri, ClientCapabilities clientCapabilities, String trace) {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  void initialized() {
    // TODO: implement initialized
  }

  @override
  // TODO: implement logMessages
  Stream<ShowMessageParams> get logMessages => throw UnimplementedError();

  @override
  // TODO: implement onDone
  Future<void> get onDone => throw UnimplementedError();

  @override
  void setupExtraMethods(Server server) {
    // TODO: implement setupExtraMethods
  }

  @override
  // TODO: implement showMessages
  Stream<ShowMessageParams> get showMessages => throw UnimplementedError();

  @override
  Future<void> shutdown() {
    // TODO: implement shutdown
    throw UnimplementedError();
  }

  @override
  Future<List> textDocumentCodeAction(TextDocumentIdentifier documentId, Range range, CodeActionContext context) {
    // TODO: implement textDocumentCodeAction
    throw UnimplementedError();
  }

  @override
  Future<CompletionList> textDocumentCompletion(TextDocumentIdentifier documentId, Position position) {
    // TODO: implement textDocumentCompletion
    throw UnimplementedError();
  }

  @override
  Future<Location> textDocumentDefinition(TextDocumentIdentifier documentId, Position position) {
    // TODO: implement textDocumentDefinition
    throw UnimplementedError();
  }

  @override
  void textDocumentDidChange(VersionedTextDocumentIdentifier documentId, List<TextDocumentContentChangeEvent> changes) {
    // TODO: implement textDocumentDidChange
  }

  @override
  void textDocumentDidClose(TextDocumentIdentifier documentId) {
    // TODO: implement textDocumentDidClose
  }

  @override
  void textDocumentDidOpen(TextDocumentItem document) {
    // TODO: implement textDocumentDidOpen
  }

  @override
  Future<List<DocumentHighlight>> textDocumentHighlight(TextDocumentIdentifier documentId, Position position) {
    // TODO: implement textDocumentHighlight
    throw UnimplementedError();
  }

  @override
  Future textDocumentHover(TextDocumentIdentifier documentId, Position position) {
    // TODO: implement textDocumentHover
    throw UnimplementedError();
  }

  @override
  Future<List<Location>> textDocumentImplementation(TextDocumentIdentifier documentId, Position position) {
    // TODO: implement textDocumentImplementation
    throw UnimplementedError();
  }

  @override
  Future<List<Location>> textDocumentReferences(TextDocumentIdentifier documentId, Position position, ReferenceContext context) {
    // TODO: implement textDocumentReferences
    throw UnimplementedError();
  }

  @override
  Future<WorkspaceEdit> textDocumentRename(TextDocumentIdentifier documentId, Position position, String newName) {
    // TODO: implement textDocumentRename
    throw UnimplementedError();
  }

  @override
  Future<List<SymbolInformation>> textDocumentSymbols(TextDocumentIdentifier documentId) {
    // TODO: implement textDocumentSymbols
    throw UnimplementedError();
  }

  @override
  // TODO: implement workspaceEdits
  Stream<ApplyWorkspaceEditParams> get workspaceEdits => throw UnimplementedError();

  @override
  Future<void> workspaceExecuteCommand(String command, List arguments) {
    // TODO: implement workspaceExecuteCommand
    throw UnimplementedError();
  }

  @override
  Future<List<SymbolInformation>> workspaceSymbol(String query) {
    // TODO: implement workspaceSymbol
    throw UnimplementedError();
  }


}
