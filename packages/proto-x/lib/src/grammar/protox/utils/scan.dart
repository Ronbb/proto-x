part of '../protox.dart';

extension ScanX on GrammarContext {
  syntaxes.SyntaxSpanBuilder? lastSpan() {
    final raw = scanner.lastSpan;
    if (raw != null) {
      final from = syntaxes.SyntaxPositionBuilder()
        ..column = scanner.lastSpan!.start.column
        ..line = scanner.lastSpan!.start.line;
      final to = syntaxes.SyntaxPositionBuilder()
        ..column = scanner.lastSpan!.end.column
        ..line = scanner.lastSpan!.end.line;
      final span = syntaxes.SyntaxSpanBuilder()
        ..from = from
        ..to = to;
      return span;
    }
  }

  syntaxes.KeywordBuilder? scanKeyword(syntaxes.KeywordType type) {
    if (scanner.scan(type.name)) {
      final keyword = syntaxes.KeywordBuilder()
        ..keywordType = type
        ..syntaxSpan = lastSpan();

      return keyword;
    }
  }

  syntaxes.SemicolonBuilder? scanSemicolon() {
    if (scanner.scan(r';')) {
      final semicolon = syntaxes.SemicolonBuilder()..syntaxSpan = lastSpan();
      return semicolon;
    }
  }

  syntaxes.EqualSignBuilder? scanEqualSign() {
    if (scanner.scan(r'=')) {
      final equalSign = syntaxes.EqualSignBuilder()..syntaxSpan = lastSpan();
      return equalSign;
    }
  }

  syntaxes.StringLiteralBuilder? scanStringLiteral() {
    if (scanner.scan(r'(?<=")([^"]|(?<=\\)")*(?=")')) {
      final stringLiteral = syntaxes.StringLiteralBuilder()
        ..syntaxSpan = lastSpan()
        ..string = scanner.lastMatch![1];
      return stringLiteral;
    }
  }

  bool scanSpace() {
    return scanner.scan(r'\s*');
  }
}
