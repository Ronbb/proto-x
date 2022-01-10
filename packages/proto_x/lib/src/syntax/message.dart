part of 'syntax.dart';

abstract class Message
    with BlockMixin, KeywordMixin, ParentedSyntax
    implements Built<Message, MessageBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.message;

  BuiltList<MessageField> get fields;
  MessageName get name;
  MessageExtensions get extensions;

  @override
  Iterable<Syntax?> get syntaxes => [
        block,
        keyword,
        name,
        extensions,
        ...fields,
      ];

  Message._();

  factory Message([void Function(MessageBuilder) updates]) = _$Message;

  factory Message.withDefault() {
    return Message((builder) {
      builder
        ..block = Block.withDefault().toBuilder()
        ..keyword = Keyword.withDefault().toBuilder()
        ..name = MessageName.withDefault().toBuilder()
        ..extensions = MessageExtensions.withDefault().toBuilder();
    });
  }
}

abstract class MessageName
    implements Built<MessageName, MessageNameBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.messageName;

  String get value;

  MessageName._();

  factory MessageName([void Function(MessageNameBuilder) updates]) =
      _$MessageName;

  factory MessageName.withDefault() {
    return MessageName((builder) {
      builder
        ..syntaxSpan = SyntaxSpan.withDefault().toBuilder()
        ..value = '';
    });
  }
}

abstract class MessageField
    with EqualSignMixin, SemicolonMixin, ParentedSyntax
    implements Built<MessageField, MessageFieldBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.messageField;

  @override
  Iterable<Syntax?> get syntaxes => [
        equalSign,
        semicolon,
        fieldModifier,
        fieldType,
        fieldName,
        fieldIndex,
      ];

  MessageFieldModifier? get fieldModifier;
  MessageFieldType get fieldType;
  MessageFieldName get fieldName;
  MessageFieldIndex get fieldIndex;

  MessageField._();

  factory MessageField([void Function(MessageFieldBuilder) updates]) =
      _$MessageField;

  factory MessageField.withDefault() {
    return MessageField((builder) {
      builder
        ..equalSign = EqualSign.withDefault().toBuilder()
        ..fieldIndex = MessageFieldIndex.withDefault().toBuilder()
        ..fieldName = MessageFieldName.withDefault().toBuilder()
        ..fieldType = MessageFieldType.withDefault().toBuilder()
        ..semicolon = Semicolon.withDefault().toBuilder();
    });
  }
}

abstract class MessageFieldModifier
    implements
        Built<MessageFieldModifier, MessageFieldModifierBuilder>,
        Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.messageFieldModifier;

  MessageFieldModifiers get value;

  MessageFieldModifier._();

  factory MessageFieldModifier(
          [void Function(MessageFieldModifierBuilder) updates]) =
      _$MessageFieldModifier;

  factory MessageFieldModifier.withDefault() {
    return MessageFieldModifier((builder) {
      builder
        ..syntaxSpan = SyntaxSpan.withDefault().toBuilder()
        ..value = MessageFieldModifiers.unknown;
    });
  }
}

class MessageFieldModifiers extends EnumClass {
  // TODO
  static const MessageFieldModifiers unknown = _$messageFieldModifiersUnknown;

  static const MessageFieldModifiers repeated = _$messageFieldModifiersRepeated;

  const MessageFieldModifiers._(String name) : super(name);

  static BuiltSet<MessageFieldModifiers> get values =>
      _$messageFieldModifiersValues;
  static MessageFieldModifiers valueOf(String name) =>
      _$messageFieldModifiersValueOf(name);
}

abstract class MessageFieldType
    implements Built<MessageFieldType, MessageFieldTypeBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.messageFieldType;

  String get value;

  MessageFieldType._();

  factory MessageFieldType([void Function(MessageFieldTypeBuilder) updates]) =
      _$MessageFieldType;

  factory MessageFieldType.withDefault() {
    return MessageFieldType((builder) {
      builder
        ..syntaxSpan = SyntaxSpan.withDefault().toBuilder()
        ..value = '';
    });
  }
}

abstract class MessageFieldName
    implements Built<MessageFieldName, MessageFieldNameBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.messageFieldName;
  String get value;

  MessageFieldName._();

  factory MessageFieldName([void Function(MessageFieldNameBuilder) updates]) =
      _$MessageFieldName;

  factory MessageFieldName.withDefault() {
    return MessageFieldName((builder) {
      builder
        ..syntaxSpan = SyntaxSpan.withDefault().toBuilder()
        ..value = '';
    });
  }
}

abstract class MessageFieldIndex
    implements Built<MessageFieldIndex, MessageFieldIndexBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.messageFieldIndex;
  int get value;

  MessageFieldIndex._();

  factory MessageFieldIndex([void Function(MessageFieldIndexBuilder) updates]) =
      _$MessageFieldIndex;

  factory MessageFieldIndex.withDefault() {
    return MessageFieldIndex((builder) {
      builder
        ..syntaxSpan = SyntaxSpan.withDefault().toBuilder()
        ..value = 0;
    });
  }
}

abstract class MessageExtensions
    implements Built<MessageExtensions, MessageExtensionsBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.messageExtendsions;

  BuiltList<MessageExtension> get values;

  MessageExtensions._();

  factory MessageExtensions([void Function(MessageExtensionsBuilder) updates]) =
      _$MessageExtensions;

  factory MessageExtensions.withDefault() {
    return MessageExtensions((builder) {
      builder.syntaxSpan = SyntaxSpan.withDefault().toBuilder();
    });
  }
}

abstract class MessageExtension
    implements Built<MessageExtension, MessageExtensionBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.messageExtendsion;
  String get value;

  MessageExtension._();

  factory MessageExtension([void Function(MessageExtensionBuilder) updates]) =
      _$MessageExtension;

  factory MessageExtension.withDefault() {
    return MessageExtension((builder) {
      builder
        ..syntaxSpan = SyntaxSpan.withDefault().toBuilder()
        ..value = '';
    });
  }
}
