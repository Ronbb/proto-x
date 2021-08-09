import 'package:built_collection/built_collection.dart';
import 'package:proto_x/src/grammar/grammar.dart';
import 'package:proto_x/src/grammar/proto_x/proto_x.dart' as protox;
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

      final scanner = SpanScanner.within(file.span(0));

      final grammarSyntaxDeclaration = protox.SyntaxDeclaration();
      final contextSyntaxDeclaration =
          GrammarContext<syntaxes.SyntaxDeclaration>(
        scanner: scanner,
        syntax: syntaxes.SyntaxDeclaration.withDefault(),
      );
      expect(grammarSyntaxDeclaration.scan(contextSyntaxDeclaration), isTrue);
      expect(contextSyntaxDeclaration.syntax.value.string, equals('protox'));

      final grammarPackage = protox.Package();
      final contextPackage = GrammarContext<syntaxes.Package>(
        scanner: scanner,
        syntax: syntaxes.Package.withDefault(),
      );
      expect(grammarPackage.scan(contextPackage), isTrue);
      expect(contextPackage.syntax.name.path, equals(BuiltList(['main', 'A'])));
    });
  });
}
