part of 'syntax.dart';

abstract class Message
    with BlockMixin, KeywordMixin
    implements Built<Message, MessageBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.message;

  BuiltList<MessageField> get fields;
  MessageName get name;

  Message._();

  factory Message([void Function(MessageBuilder) updates]) = _$Message;

  factory Message.withDefault() {
    return Message((builder) {
      builder
        ..block = Block.withDefault().toBuilder()
        ..keyword = Keyword.withDefault().toBuilder()
        ..name = MessageName.withDefault().toBuilder()
        ..syntaxSpan = SyntaxSpan.withDefault().toBuilder();
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
    with EqualSignMixin, SemicolonMixin
    implements Built<MessageField, MessageFieldBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.messageField;

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
        ..semicolon = Semicolon.withDefault().toBuilder()
        ..syntaxSpan = SyntaxSpan.withDefault().toBuilder();
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

  MessageFieldTypes get value;

  MessageFieldType._();

  factory MessageFieldType([void Function(MessageFieldTypeBuilder) updates]) =
      _$MessageFieldType;

  factory MessageFieldType.withDefault() {
    return MessageFieldType((builder) {
      builder
        ..syntaxSpan = SyntaxSpan.withDefault().toBuilder()
        ..value = MessageFieldTypes.unknown;
    });
  }
}

class MessageFieldTypes extends EnumClass {
  // TODO
  static const MessageFieldTypes string = _$messageFieldTypesString;
  static const MessageFieldTypes unknown = _$messageFieldTypesUnknown;

  const MessageFieldTypes._(String name) : super(name);

  static BuiltSet<MessageFieldTypes> get values => _$messageFieldTypesValues;
  static MessageFieldTypes valueOf(String name) =>
      _$messageFieldTypesValueOf(name);
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
