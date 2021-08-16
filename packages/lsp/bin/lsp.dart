import 'dart:io';

import 'package:lsp/lsp.dart';

Future<void> main(List<String> args) async {
  if (args.isNotEmpty && args[0] == 'socket') {
    print('run in socket mode');
    final serverSocket = await ServerSocket.bind('127.0.0.1', 8077);
    serverSocket.listen((socket) async {
      final server = await ProtoLanguageServer.fromSocket(socket);
      await server.start();
    });
  } else {
    print('run in stdio mode');
    final ProtoLanguageServer server = ProtoLanguageServer.fromStdio();
    await server.start();
  }
}
