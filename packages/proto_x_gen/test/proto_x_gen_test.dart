import 'package:dart_style/dart_style.dart';
import 'package:proto_x_gen/generator/dart.dart' as dart;
import 'package:test/test.dart';

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
  });
}
