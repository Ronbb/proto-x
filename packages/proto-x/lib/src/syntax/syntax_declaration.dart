part of 'syntax.dart';

abstract class SyntaxDeclaration
    with KeywordMixin, SemicolonMixin, EqualSignMixin, ParentedSyntax
    implements Built<SyntaxDeclaration, SyntaxDeclarationBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.syntaxDeclaration;

  StringLiteral get value;

  SyntaxDeclaration._();

  @override
  Iterable<Syntax?> get syntaxes => [
        equalSign,
        semicolon,
        keyword,
        value,
      ];

  factory SyntaxDeclaration(
      [void Function(SyntaxDeclarationBuilder)? updates]) = _$SyntaxDeclaration;

  factory SyntaxDeclaration.withDefault() {
    return SyntaxDeclaration((builder) {
      builder
        ..equalSign = EqualSign.withDefault().toBuilder()
        ..keyword = Keyword.withDefault().toBuilder()
        ..semicolon = Semicolon.withDefault().toBuilder()
        ..value = StringLiteral.withDefault().toBuilder();
    });
  }
}
