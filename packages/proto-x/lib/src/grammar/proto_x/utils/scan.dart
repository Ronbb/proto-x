part of '../proto_x.dart';

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
    if (scanner.scan(RegExp(r'='))) {
      final equalSign = syntaxes.EqualSignBuilder()..syntaxSpan = lastSpan();
      return equalSign;
    }
  }

  syntaxes.StringLiteralBuilder? scanStringLiteral({bool? unescape}) {
    // don't use lookahead or lookbehind here
    if (scanner.scan(RegExp(r'"([^"]|(?<=\\)")*"'))) {
      final matched = scanner.lastMatch![0];
      final trimmed = matched!.substring(1, matched.length - 1);
      final stringLiteral = syntaxes.StringLiteralBuilder()
        ..syntaxSpan = lastSpan()
        ..string = unescape == true ? utils.unescape(trimmed) : trimmed;
      return stringLiteral;
    }
  }

  syntaxes.PackageNameBuilder? scanPackageName() {
    if (scanner.scan(RegExp(r'[^\s;]+'))) {
      final packageName = syntaxes.PackageNameBuilder()
        ..syntaxSpan = lastSpan()
        ..path = ListBuilder(
          scanner.lastMatch![0]!.split('.'),
        );

      return packageName;
    }
  }

  bool scanSpace() {
    return scanner.scan(RegExp(r'\s*'));
  }
}
