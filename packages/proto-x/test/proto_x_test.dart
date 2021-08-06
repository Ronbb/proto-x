import 'package:proto_x/src/grammar/grammar.dart';
import 'package:proto_x/src/grammar/protox/protox.dart' as protox;
import 'package:proto_x/src/syntax/syntax.dart' as syntaxes;
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

    test('scan', () {
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

    test('grammar syntax', () {
      SourceFile file = SourceFile.fromString(
        text,
        url: r'C:\Project\tmp\test.protox',
      );

      final grammar = protox.SyntaxDeclaration();
      final context = GrammarContext<syntaxes.SyntaxDeclaration>(
        scanner: SpanScanner.within(file.span(0)),
        syntax: syntaxes.SyntaxDeclaration((builder) {
          final syntaxPosition = syntaxes.SyntaxPosition((builder) {
            builder
              ..column = 0
              ..line = 0;
          });

          final syntaxSpan = syntaxes.SyntaxSpan((builder) {
            builder
              ..from = syntaxPosition.toBuilder()
              ..to = syntaxPosition.toBuilder();
          });

          builder.equalSign.syntaxSpan = syntaxSpan.toBuilder();

          builder.keyword
            ..keywordType = syntaxes.KeywordType.syntax
            ..syntaxSpan = syntaxSpan.toBuilder();

          builder.semicolon.syntaxSpan = syntaxSpan.toBuilder();
          builder.syntaxSpan = syntaxSpan.toBuilder();
          builder.value
            ..syntaxSpan = syntaxSpan.toBuilder()
            ..string = '';
        }),
      );
      expect(grammar.scan(context), isTrue);
      expect(context.syntax.value.string, equals('protox'));
    });
  });
}
