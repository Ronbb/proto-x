import 'dart:io';

import 'package:dart_style/dart_style.dart';
import 'package:proto_x/proto_x.dart';
import 'package:proto_x_gen/generator/dart/dart.dart' as dart;
import 'package:test/test.dart';

const text = '''
syntax = "protox";

package main.a;

message BaseMessage {
  string id = 100;
}

message UserMessage uses BaseMessage {
  string user_name = 1;
  string text = 2;
}

message UserGroup {
  UserMessage user = 1;
}
''';

void main() {
  group('dart generator basic', () {
    final formatter = DartFormatter();
    test('class', () async {
      final a = dart.Class(
        name: dart.TypeName('OtherClass'),
        fields: [
          dart.Field(
            name: dart.VariableName('otherField'),
            type: dart.TypeName('OtherField'),
          )
        ],
      );
      final code = a.code();
      print(formatter.format(code));

      expect(code, isNotEmpty);
    });

    test('dart generator', () async {
      final generator = dart.DartGenerator(
        source: [SourceFile.fromString(text)],
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
