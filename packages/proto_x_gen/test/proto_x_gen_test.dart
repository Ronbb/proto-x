import 'dart:io';

import 'package:dart_style/dart_style.dart';
import 'package:proto_x/proto_x.dart';
import 'package:proto_x_gen/generator/dart.dart' as dart;
import 'package:test/test.dart';

const text = '''
syntax = "protox";

package main.A;

message UserMessage {
    string user_name = 1;
    string text = 2;
}
''';

void main() {
  group('dart generator basic', () {
    final formatter = DartFormatter();
    test('class', () async {
      final a = dart.Class(
        name: 'OtherClass',
        fields: [
          dart.Field(
            name: 'otherField',
            type: 'OtherField',
          )
        ],
      );
      final code = await a.code();
      print(formatter.format(code));

      expect(code, isNotEmpty);
    });

    test('dart generator', () async {
      final generator = dart.DartGenerator(
        source: SourceFile.fromString(text),
        target: Directory.systemTemp.uri.resolve('proto_x_generated'),
      );
      final directory = await generator.generate();

      print('root: ${directory.entity.path}');

      expect(directory.files, isNotEmpty);

      final file = directory.files.first;

      final result = await file.entity.readAsString();

      expect(result, isNotEmpty);
    });
  });
}
