part of 'syntax.dart';

abstract class Semicolon implements Built<Semicolon, SemicolonBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.semicolon;

  Semicolon._();

  factory Semicolon([void Function(SemicolonBuilder) updates]) = _$Semicolon;
}

mixin SemicolonMixin implements Syntax {
  Semicolon get semicolon;
}
