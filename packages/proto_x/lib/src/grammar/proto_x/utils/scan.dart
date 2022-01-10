part of '../proto_x.dart';

extension ScanX on GrammarContext {
  SyntaxSpanBuilder? lastSpan() {
    final raw = scanner.lastSpan;
    if (raw != null) {
      final from = SyntaxPosition.withDefault().toBuilder()
        ..column = scanner.lastSpan!.start.column
        ..line = scanner.lastSpan!.start.line;
      final to = SyntaxPosition.withDefault().toBuilder()
        ..column = scanner.lastSpan!.end.column
        ..line = scanner.lastSpan!.end.line;
      final span = SyntaxSpan.withDefault().toBuilder()
        ..from = from
        ..to = to;
      return span;
    }
  }

  KeywordBuilder? scanKeyword(KeywordType type) {
    if (scanner.scan(type.name)) {
      final keyword = Keyword.withDefault().toBuilder()
        ..keywordType = type
        ..syntaxSpan = lastSpan();

      return keyword;
    }
  }

  SemicolonBuilder? scanSemicolon() {
    if (scanner.scan(r';')) {
      final semicolon = Semicolon.withDefault().toBuilder()
        ..syntaxSpan = lastSpan();
      return semicolon;
    }
  }

  EqualSignBuilder? scanEqualSign() {
    if (scanner.scan(RegExp(r'='))) {
      final equalSign = EqualSign.withDefault().toBuilder()
        ..syntaxSpan = lastSpan();
      return equalSign;
    }
  }

  StringLiteralBuilder? scanStringLiteral({bool? unescape}) {
    // don't use lookahead or lookbehind here
    if (scanner.scan(RegExp(r'"([^"]|(?<=\\)")*"'))) {
      final matched = scanner.lastMatch![0];
      final trimmed = matched!.substring(1, matched.length - 1);
      final stringLiteral = StringLiteral.withDefault().toBuilder()
        ..syntaxSpan = lastSpan()
        ..string = unescape == true ? utils.unescape(trimmed) : trimmed;
      return stringLiteral;
    }
  }

  PackageNameBuilder? scanPackageName() {
    if (scanner.scan(RegExp(r'[^\s;]+'))) {
      final packageName = PackageName.withDefault().toBuilder()
        ..syntaxSpan = lastSpan()
        ..path = ListBuilder(
          scanner.lastMatch![0]!.split('.'),
        );

      return packageName;
    }
  }

  static const Map<BlockBoundarySymbols, Map<BlockBoundaryType, Pattern>>
      blockBoundarySymbolsMap = {
    BlockBoundarySymbols.brace: {
      BlockBoundaryType.open: '{',
      BlockBoundaryType.close: '}',
    },
    BlockBoundarySymbols.bracket: {
      BlockBoundaryType.open: '[',
      BlockBoundaryType.close: ']',
    },
    BlockBoundarySymbols.parenthesis: {
      BlockBoundaryType.open: '(',
      BlockBoundaryType.close: ')',
    },
  };

  BlockBoundaryBuilder? scanBlockBoundary({
    required BlockBoundarySymbols symbol,
    required BlockBoundaryType type,
  }) {
    final pattern = blockBoundarySymbolsMap[symbol]?[type];
    if (pattern != null) {
      if (scanner.scan(pattern)) {
        final blockBoundary = BlockBoundary.withDefault().toBuilder()
          ..syntaxSpan = lastSpan();

        return blockBoundary;
      }
    }
  }

  static final namePattern = RegExp(r'[a-zA-Z_$][a-zA-Z0-9_$]*');

  static final intPattern = RegExp(r'-?[0-9]+');

  bool skipComma({bool skipSpace = true}) {
    return scanner.scan(skipSpace ? RegExp(r'\s*,\s*') : ',');
  }

  MessageNameBuilder? scanMessageName() {
    if (scanner.scan(namePattern)) {
      final messageName = MessageName.withDefault().toBuilder()
        ..syntaxSpan = lastSpan()
        ..value = scanner.lastMatch![0]!;

      return messageName;
    }
  }

  MessageExtensionBuilder? scanMessageExtension() {
    if (scanner.scan(namePattern)) {
      final messageName = MessageExtension.withDefault().toBuilder()
        ..syntaxSpan = lastSpan()
        ..value = scanner.lastMatch![0]!;

      return messageName;
    }
  }

  MessageFieldModifierBuilder? scanMessageFieldModifier() {
    if (scanner.matches(namePattern)) {
      final MessageFieldModifiers modifier;
      try {
        modifier = MessageFieldModifiers.valueOf(
          scanner.lastMatch![0]!,
        );
        // move pointer to end of name
        scanner.expect(namePattern);
      } catch (e) {
        return null;
      }
      final fieldModifier = MessageFieldModifier.withDefault().toBuilder()
        ..syntaxSpan = lastSpan()
        ..value = modifier;

      return fieldModifier;
    }
  }

  MessageFieldTypeBuilder? scanMessageFieldType() {
    if (scanner.scan(namePattern)) {
      final fieldType = MessageFieldType.withDefault().toBuilder()
        ..syntaxSpan = lastSpan()
        ..value = scanner.lastMatch![0]!;

      return fieldType;
    }
  }

  MessageFieldNameBuilder? scanMessageFieldName() {
    if (scanner.scan(namePattern)) {
      final fieldName = MessageFieldName.withDefault().toBuilder()
        ..syntaxSpan = lastSpan()
        ..value = scanner.lastMatch![0]!;

      return fieldName;
    }
  }

  MessageFieldIndexBuilder? scanMessageIndex() {
    if (scanner.scan(intPattern)) {
      final fieldIndex = MessageFieldIndex.withDefault().toBuilder()
        ..syntaxSpan = lastSpan()
        ..value = int.parse(scanner.lastMatch![0]!);

      return fieldIndex;
    }
  }

  bool scanSpace() {
    return scanner.scan(RegExp(r'\s+'));
  }
}
