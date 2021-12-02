part of '../proto_x.dart';

extension ScanX on GrammarContext {
  syntaxes.SyntaxSpanBuilder? lastSpan() {
    final raw = scanner.lastSpan;
    if (raw != null) {
      final from = syntaxes.SyntaxPosition.withDefault().toBuilder()
        ..column = scanner.lastSpan!.start.column
        ..line = scanner.lastSpan!.start.line;
      final to = syntaxes.SyntaxPosition.withDefault().toBuilder()
        ..column = scanner.lastSpan!.end.column
        ..line = scanner.lastSpan!.end.line;
      final span = syntaxes.SyntaxSpan.withDefault().toBuilder()
        ..from = from
        ..to = to;
      return span;
    }
  }

  syntaxes.KeywordBuilder? scanKeyword(syntaxes.KeywordType type) {
    if (scanner.scan(type.name)) {
      final keyword = syntaxes.Keyword.withDefault().toBuilder()
        ..keywordType = type
        ..syntaxSpan = lastSpan();

      return keyword;
    }
  }

  syntaxes.SemicolonBuilder? scanSemicolon() {
    if (scanner.scan(r';')) {
      final semicolon = syntaxes.Semicolon.withDefault().toBuilder()
        ..syntaxSpan = lastSpan();
      return semicolon;
    }
  }

  syntaxes.EqualSignBuilder? scanEqualSign() {
    if (scanner.scan(RegExp(r'='))) {
      final equalSign = syntaxes.EqualSign.withDefault().toBuilder()
        ..syntaxSpan = lastSpan();
      return equalSign;
    }
  }

  syntaxes.StringLiteralBuilder? scanStringLiteral({bool? unescape}) {
    // don't use lookahead or lookbehind here
    if (scanner.scan(RegExp(r'"([^"]|(?<=\\)")*"'))) {
      final matched = scanner.lastMatch![0];
      final trimmed = matched!.substring(1, matched.length - 1);
      final stringLiteral = syntaxes.StringLiteral.withDefault().toBuilder()
        ..syntaxSpan = lastSpan()
        ..string = unescape == true ? utils.unescape(trimmed) : trimmed;
      return stringLiteral;
    }
  }

  syntaxes.PackageNameBuilder? scanPackageName() {
    if (scanner.scan(RegExp(r'[^\s;]+'))) {
      final packageName = syntaxes.PackageName.withDefault().toBuilder()
        ..syntaxSpan = lastSpan()
        ..path = ListBuilder(
          scanner.lastMatch![0]!.split('.'),
        );

      return packageName;
    }
  }

  static const Map<syntaxes.BlockBoundarySymbols,
      Map<BlockBoundaryType, Pattern>> blockBoundarySymbolsMap = {
    syntaxes.BlockBoundarySymbols.brace: {
      BlockBoundaryType.open: '{',
      BlockBoundaryType.close: '}',
    },
    syntaxes.BlockBoundarySymbols.bracket: {
      BlockBoundaryType.open: '[',
      BlockBoundaryType.close: ']',
    },
    syntaxes.BlockBoundarySymbols.parenthesis: {
      BlockBoundaryType.open: '(',
      BlockBoundaryType.close: ')',
    },
  };

  syntaxes.BlockBoundaryBuilder? scanBlockBoundary({
    required syntaxes.BlockBoundarySymbols symbol,
    required BlockBoundaryType type,
  }) {
    final pattern = blockBoundarySymbolsMap[symbol]?[type];
    if (pattern != null) {
      if (scanner.scan(pattern)) {
        final blockBoundary = syntaxes.BlockBoundary.withDefault().toBuilder()
          ..syntaxSpan = lastSpan();

        return blockBoundary;
      }
    }
  }

  static final namePattern = RegExp(r'[a-zA-Z_$][a-zA-Z0-9_$]*');

  static final intPattern = RegExp(r'-?[0-9]+');

  syntaxes.MessageNameBuilder? scanMessageName() {
    if (scanner.scan(namePattern)) {
      final messageName = syntaxes.MessageName.withDefault().toBuilder()
        ..syntaxSpan = lastSpan()
        ..value = scanner.lastMatch![0]!;

      return messageName;
    }
  }

  syntaxes.MessageFieldModifierBuilder? scanMessageFieldModifier() {
    if (scanner.matches(namePattern)) {
      final syntaxes.MessageFieldModifiers modifier;
      try {
        modifier = syntaxes.MessageFieldModifiers.valueOf(
          scanner.lastMatch![0]!,
        );
        // move pointer to end of name
        scanner.expect(namePattern);
      } catch (e) {
        return null;
      }
      final fieldModifier =
          syntaxes.MessageFieldModifier.withDefault().toBuilder()
            ..syntaxSpan = lastSpan()
            ..value = modifier;

      return fieldModifier;
    }
  }

  syntaxes.MessageFieldTypeBuilder? scanMessageFieldType() {
    if (scanner.scan(namePattern)) {
      final fieldType = syntaxes.MessageFieldType.withDefault().toBuilder()
        ..syntaxSpan = lastSpan()
        ..value = syntaxes.MessageFieldTypes.valueOf(
          scanner.lastMatch![0]!,
        );

      return fieldType;
    }
  }

  syntaxes.MessageFieldNameBuilder? scanMessageFieldName() {
    if (scanner.scan(namePattern)) {
      final fieldName = syntaxes.MessageFieldName.withDefault().toBuilder()
        ..syntaxSpan = lastSpan()
        ..value = scanner.lastMatch![0]!;

      return fieldName;
    }
  }

  syntaxes.MessageFieldIndexBuilder? scanMessageIndex() {
    if (scanner.scan(intPattern)) {
      final fieldIndex = syntaxes.MessageFieldIndex.withDefault().toBuilder()
        ..syntaxSpan = lastSpan()
        ..value = int.parse(scanner.lastMatch![0]!);

      return fieldIndex;
    }
  }

  bool scanSpace() {
    return scanner.scan(RegExp(r'\s+'));
  }
}
