part of '../syntax.dart';

abstract class Keyword implements Built<Keyword, KeywordBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.keyword;

  KeywordType get keywordType;

  Keyword._();

  factory Keyword([void Function(KeywordBuilder) updates]) = _$Keyword;

  factory Keyword.withDefault() {
    return Keyword((builder) {
      builder
        ..keywordType = KeywordType.syntax
        ..syntaxSpan = SyntaxSpan.withDefault().toBuilder();
    });
  }
}

class KeywordType extends EnumClass {
  static const KeywordType syntax = _$keywordTypeSyntax;
  static const KeywordType package = _$keywordTypePackage;
  static const KeywordType message = _$keywordTypeMessage;

  const KeywordType._(String name) : super(name);

  static BuiltSet<KeywordType> get values => _$keywordTypeValues;
  static KeywordType valueOf(String name) => _$keywordTypeValueOf(name);
}

mixin KeywordMixin implements Syntax {
  Keyword get keyword;
}
