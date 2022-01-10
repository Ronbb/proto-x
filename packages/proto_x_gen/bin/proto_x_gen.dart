import 'dart:io';

import 'package:args/args.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:proto_x/proto_x.dart';
import 'package:proto_x_gen/generator/dart/dart.dart' as dart;

void main(List<String> arguments) async {
  final argParser = ArgParser();
  argParser.addFlag('help', abbr: 'h');

  argParser.addCommand('generate')
    ..addFlag('help', abbr: 'h')
    ..addOption('input', abbr: 'i', defaultsTo: '*.proto*')
    ..addOption('output', abbr: 'o', defaultsTo: 'generated')
    ..addOption('root', defaultsTo: '.')
    ..addOption('language', abbr: 'l');

  final results = argParser.parse(arguments);

  if (results['help']) {
    print(argParser.usage);
    print('Commands:');
    print(argParser.commands.keys);

    return;
  }

  final command = results.command;

  if (command != null && command.name == 'generate') {
    if (command['help']) {
      print(argParser.commands['generate']?.usage);
      return;
    }
    final files = command['input'];

    final fileGlob = Glob(files);
    final entities = fileGlob.listSync(root: command['root']);
    final pxFiles = entities
        .where(
          (entity) => entity.statSync().type == FileSystemEntityType.file,
        )
        .cast<File>();
    if (pxFiles.isEmpty) {
      print('no input');
      return;
    }
    final generator = dart.DartGenerator(
      source: pxFiles.map(
        (file) => SourceFile.fromString(
          file.readAsStringSync(),
          url: file.path,
        ),
      ),
      target: Directory.current.uri.resolve(command['output']),
    );
    await generator.generate();
  }

  print('finished');
}
