part of 'proto_x.dart';

class Message extends BlockGrammar<syntaxes.Message> {
  const Message();

  static const boundarySymbol = syntaxes.BlockBoundarySymbols.brace;

  static GrammarContext<syntaxes.MessageField> _fieldContextBuilder(
    GrammarContext<syntaxes.Message> context,
  ) {
    return GrammarContext(
      scanner: context.scanner,
      syntax: syntaxes.MessageField.withDefault(),
    );
  }

  static void _fieldCaster(
    GrammarContext<syntaxes.MessageField> previous,
    GrammarContext<syntaxes.Message> next,
  ) {
    next.syntax = next.syntax.rebuild((builder) {
      builder.fields.add(previous.syntax);
    });
  }

  @override
  final Grammar<syntaxes.Message>? begin = const _MessageBegin();

  @override
  final Grammar<syntaxes.Message>? end = const _MessageEnd();

  @override
  final Iterable<Grammar<syntaxes.Message>> includes = const [
    CastedGrammar(
      builder: _fieldContextBuilder,
      caster: _fieldCaster,
      grammar: _MessageField(),
    ),
  ];
}

class _MessageBegin extends ChainableGrammar<syntaxes.Message> {
  const _MessageBegin();

  @override
  final Iterable<Grammar<syntaxes.Message>> grammars = const [
    Space(),
    Keyword(syntaxes.KeywordType.message),
    Space(),
    _MessageName(),
    Space(),
    BlockBoundary(
      symbol: Message.boundarySymbol,
      type: BlockBoundaryType.open,
    ),
    Space(),
  ];
}

class _MessageName extends Grammar<syntaxes.Message> {
  const _MessageName();

  @override
  bool scan(GrammarContext<syntaxes.Message> context) {
    final messageName = context.scanMessageName();
    if (messageName != null) {
      context.syntax = context.syntax.rebuild((builder) {
        builder.name = messageName;
      });
      return true;
    }
    return false;
  }
}

class _MessageEnd extends ChainableGrammar<syntaxes.Message> {
  const _MessageEnd();

  @override
  final Iterable<Grammar<syntaxes.Message>> grammars = const [
    Space(),
    BlockBoundary(
      symbol: Message.boundarySymbol,
      type: BlockBoundaryType.close,
    ),
    Space(),
  ];
}

class _MessageField extends ChainableGrammar<syntaxes.MessageField> {
  const _MessageField();

  @override
  final Iterable<Grammar<syntaxes.MessageField>> grammars = const [
    Space(),
    _MessageFieldModifier(),
    Space(),
    _MessageFieldType(),
    Space(),
    _MessageFieldName(),
    Space(),
    _MessageFieldIndex(),
    Space(),
    Semicolon(),
    Space(),
  ];
}

class _MessageFieldModifier extends Grammar<syntaxes.MessageField> {
  const _MessageFieldModifier();

  @override
  bool scan(GrammarContext<syntaxes.MessageField> context) {
    final fieldModifier = context.scanMessageFieldModifier();
    if (fieldModifier != null) {
      context.syntax = context.syntax.rebuild((builder) {
        builder.fieldModifier = fieldModifier;
      });
      return true;
    }
    return false;
  }
}

class _MessageFieldType extends Grammar<syntaxes.MessageField> {
  const _MessageFieldType();

  @override
  bool scan(GrammarContext<syntaxes.MessageField> context) {
    final fieldType = context.scanMessageFieldType();
    if (fieldType != null) {
      context.syntax = context.syntax.rebuild((builder) {
        builder.fieldType = fieldType;
      });
      return true;
    }
    return false;
  }
}

class _MessageFieldName extends Grammar<syntaxes.MessageField> {
  const _MessageFieldName();

  @override
  bool scan(GrammarContext<syntaxes.MessageField> context) {
    final fieldName = context.scanMessageFieldName();
    if (fieldName != null) {
      context.syntax = context.syntax.rebuild((builder) {
        builder.fieldName = fieldName;
      });
      return true;
    }
    return false;
  }
}

class _MessageFieldIndex extends Grammar<syntaxes.MessageField> {
  const _MessageFieldIndex();

  @override
  bool scan(GrammarContext<syntaxes.MessageField> context) {
    final fieldIndex = context.scanMessageIndex();
    if (fieldIndex != null) {
      context.syntax = context.syntax.rebuild((builder) {
        builder.fieldIndex = fieldIndex;
      });
      return true;
    }
    return false;
  }
}
