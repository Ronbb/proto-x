part of 'syntax.dart';

abstract class Keyword implements Built<Keyword, KeywordBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.keyword;

  KeywordType get keywordType;

  Keyword._();

  factory Keyword([void Function(KeywordBuilder) updates]) = _$Keyword;
}

class KeywordType extends EnumClass {
  static const KeywordType syntax = _$keywordTypeSyntax;

  const KeywordType._(String name) : super(name);

  static BuiltSet<KeywordType> get values => _$keywordTypeValues;
  static KeywordType valueOf(String name) => _$keywordTypeValueOf(name);
}

mixin KeywordMixin implements Syntax {
  Keyword get keyword;
}
