import 'package:source_span/source_span.dart';
import 'package:string_scanner/string_scanner.dart';
import 'package:test/test.dart';

const text =
    '''
   syntax = "protox";

package main.A;

message UserMessage {
    string Username = 1;
    string Text = 2;
}
''';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      SourceFile file = SourceFile.fromString(
        text,
        url: r'C:\Project\tmp\test.protox',
      );
      SpanScanner scanner = SpanScanner.within(file.span(0));

      scanner.scan(RegExp(r'\s*'));

      expect(scanner.scan(RegExp(r'syntax\s*=\s*"(\w+)";')), isTrue);
      expect(scanner.lastMatch![1] == "protox", isTrue);
      print(scanner.lastSpan);

      scanner.scan(RegExp(r'\s*'));

      expect(scanner.scan(RegExp(r'package\s*([\w\.]+);')), isTrue);
      expect(scanner.lastMatch![1] == "main.A", isTrue);
      print(scanner.lastSpan);
    });
  });
}
