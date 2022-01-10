part of 'proto_x.dart';

class MessageGrammar extends BlockGrammar<Message> {
  const MessageGrammar();

  static const boundarySymbol = BlockBoundarySymbols.brace;

  static GrammarContext<MessageField> _fieldContextBuilder(
    GrammarContext<Message> context,
  ) {
    return GrammarContext(
      scanner: context.scanner,
      syntax: MessageField.withDefault(),
    );
  }

  static void _fieldCaster(
    GrammarContext<MessageField> previous,
    GrammarContext<Message> next,
  ) {
    next.syntax = next.syntax.rebuild((builder) {
      builder.fields.add(previous.syntax);
    });
  }

  @override
  final Grammar<Message>? begin = const _MessageBegin();

  @override
  final Grammar<Message>? end = const _MessageEnd();

  @override
  final Iterable<Grammar<Message>> includes = const [
    SpaceGrammar(isRequired: true),
    CastedGrammar(
      builder: _fieldContextBuilder,
      caster: _fieldCaster,
      grammar: _MessageField(),
    ),
  ];
}

class _MessageBegin extends ChainableGrammar<Message> {
  const _MessageBegin();

  @override
  final Iterable<Grammar<Message>> grammars = const [
    SpaceGrammar(),
    KeywordGrammar(KeywordType.message),
    SpaceGrammar(),
    _MessageName(),
    SpaceGrammar(),
    _MessageExtensions(),
    SpaceGrammar(),
    BlockBoundaryGrammar(
      symbol: MessageGrammar.boundarySymbol,
      type: BlockBoundaryType.open,
    ),
    SpaceGrammar(),
  ];
}

class _MessageName extends Grammar<Message> {
  const _MessageName();

  @override
  bool scan(GrammarContext<Message> context) {
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

class _MessageExtensions extends BlockGrammar<Message> {
  const _MessageExtensions();

  @override
  bool get isRequired => false;

  @override
  Grammar<Message>? get begin => const _MessageExtensionsBegin();

  @override
  Iterable<Grammar<Message>> get includes => const [_MessageExtensionsItem()];
}

class _MessageExtensionsBegin extends ChainableGrammar<Message> {
  const _MessageExtensionsBegin();

  @override
  Iterable<Grammar<Message>> get grammars => [
        SpaceGrammar(),
        KeywordGrammar(KeywordType.uses),
        SpaceGrammar(),
      ];
}

class _MessageExtensionsItem extends Grammar<Message> {
  const _MessageExtensionsItem();

  @override
  bool scan(GrammarContext<Message> context) {
    final extensions = MessageExtensions.withDefault().toBuilder();
    while (true) {
      final extension = context.scanMessageExtension();
      if (extension != null) {
        extensions.extensions.add(extension.build());
      } else {
        break;
      }
      context.skipComma();
    }

    if (extensions.extensions.isEmpty) {
      return false;
    }

    context.syntax = context.syntax.rebuild((builder) {
      builder.extensions = extensions;
    });

    return true;
  }
}

class _MessageEnd extends ChainableGrammar<Message> {
  const _MessageEnd();

  @override
  final Iterable<Grammar<Message>> grammars = const [
    SpaceGrammar(),
    BlockBoundaryGrammar(
      symbol: MessageGrammar.boundarySymbol,
      type: BlockBoundaryType.close,
    ),
    SpaceGrammar(),
  ];
}

class _MessageField extends ChainableGrammar<MessageField> {
  const _MessageField();

  @override
  final Iterable<Grammar<MessageField>> grammars = const [
    SpaceGrammar(),
    _MessageFieldModifier(),
    SpaceGrammar(),
    _MessageFieldType(),
    SpaceGrammar(),
    _MessageFieldName(),
    SpaceGrammar(),
    EqualSignGrammar(),
    SpaceGrammar(),
    _MessageFieldIndex(),
    SpaceGrammar(),
    SemicolonGrammar(),
    SpaceGrammar(),
  ];
}

class _MessageFieldModifier extends Grammar<MessageField> {
  const _MessageFieldModifier();

  @override
  bool scan(GrammarContext<MessageField> context) {
    final fieldModifier = context.scanMessageFieldModifier();
    if (fieldModifier != null) {
      context.syntax = context.syntax.rebuild((builder) {
        builder.fieldModifier = fieldModifier;
      });
      return true;
    }
    return true;
  }
}

class _MessageFieldType extends Grammar<MessageField> {
  const _MessageFieldType();

  @override
  bool scan(GrammarContext<MessageField> context) {
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

class _MessageFieldName extends Grammar<MessageField> {
  const _MessageFieldName();

  @override
  bool scan(GrammarContext<MessageField> context) {
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

class _MessageFieldIndex extends Grammar<MessageField> {
  const _MessageFieldIndex();

  @override
  bool scan(GrammarContext<MessageField> context) {
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
