import 'package:built_collection/built_collection.dart';
import 'package:proto_x/src/grammar/grammar.dart';
import 'package:proto_x/src/grammar/proto_x/proto_x.dart';
import 'package:proto_x/src/syntax/syntax.dart';
import 'package:source_span/source_span.dart';
import 'package:string_scanner/string_scanner.dart';
import 'package:test/test.dart';

const text =
    '''
syntax = "protox";

package main.A;

message BaseMessage {
  string message_id = 100;
}

message UserMessage uses BaseMessage {
  string user_name = 1;
  string text = 2;
}
''';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('scan with regex', () {
      SourceFile file = SourceFile.fromString(
        text,
        url: r'test.protox',
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

    test('proto x', () {
      final file = SourceFile.fromString(
        text,
        url: r'test.protox',
      );
      final scanner = SpanScanner.within(file.span(0));
      final grammar = ProtoXGrammar();
      final context = GrammarContext(
        scanner: scanner,
        syntax: ProtoX.withDefault(),
      );

      expect(grammar.scan(context), isTrue);
      expect(context.syntax.messages.length, equals(2));
      expect(context.syntax.packages.length, equals(1));
      expect(context.syntax.syntaxDeclarations.length, equals(1));
      expect(context.syntax.syntaxSpan.to.line, greaterThan(0));
    });

    test('grammar', () {
      SourceFile file = SourceFile.fromString(
        text,
        url: r'test.protox',
      );

      final scanner = SpanScanner.within(file.span(0));

      final grammarSyntaxDeclaration = SyntaxDeclarationGrammar();
      final contextSyntaxDeclaration = GrammarContext<SyntaxDeclaration>(
        scanner: scanner,
        syntax: SyntaxDeclaration.withDefault(),
      );
      expect(grammarSyntaxDeclaration.scan(contextSyntaxDeclaration), isTrue);
      expect(contextSyntaxDeclaration.syntax.value.string, equals('protox'));

      final grammarPackage = PackageGrammar();
      final contextPackage = GrammarContext<Package>(
        scanner: scanner,
        syntax: Package.withDefault(),
      );
      expect(grammarPackage.scan(contextPackage), isTrue);
      expect(contextPackage.syntax.name.path, equals(BuiltList(['main', 'A'])));

      final grammarMessage = MessageGrammar();
      final contextMessage = GrammarContext<Message>(
        scanner: scanner,
        syntax: Message.withDefault(),
      );
      expect(grammarMessage.scan(contextMessage), isTrue);
      expect(contextMessage.syntax.name.value, equals('UserMessage'));
      expect(contextMessage.syntax.fields.length, equals(2));
      expect(
        contextMessage.syntax.fields[0].fieldIndex.value,
        equals(1),
      );
      expect(
        contextMessage.syntax.fields[0].fieldName.value,
        equals('user_name'),
      );
      expect(
        contextMessage.syntax.fields[0].fieldType.value,
        equals('string'),
      );
      expect(
        contextMessage.syntax.fields[1].fieldIndex.value,
        equals(2),
      );
      expect(
        contextMessage.syntax.fields[1].fieldName.value,
        equals('text'),
      );
      expect(
        contextMessage.syntax.fields[1].fieldType.value,
        equals('string'),
      );
    });
  });
}
