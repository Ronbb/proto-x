part of 'syntax.dart';

abstract class SyntaxDeclaration
    with KeywordMixin, SemicolonMixin, EqualSignMixin
    implements Built<SyntaxDeclaration, SyntaxDeclarationBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.syntaxDeclaration;

  StringLiteral get value;

  SyntaxDeclaration._();

  factory SyntaxDeclaration(
      [void Function(SyntaxDeclarationBuilder)? updates]) = _$SyntaxDeclaration;
}
