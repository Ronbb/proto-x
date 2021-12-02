part of 'proto_x.dart';

class SyntaxDeclaration extends ChainableGrammar<syntaxes.SyntaxDeclaration> {
  const SyntaxDeclaration();

  @override
  final Iterable<Grammar<syntaxes.SyntaxDeclaration>> grammars = const [
    Space(),
    Keyword(syntaxes.KeywordType.syntax),
    Space(),
    EqualSign(),
    Space(),
    _SyntaxDeclarationLiteral(),
    Space(),
    Semicolon(),
  ];
}

class _SyntaxDeclarationLiteral extends Grammar<syntaxes.SyntaxDeclaration> {
  const _SyntaxDeclarationLiteral();

  @override
  bool scan(GrammarContext<syntaxes.SyntaxDeclaration> context) {
    final stringLiteral = context.scanStringLiteral(unescape: true);
    if (stringLiteral != null) {
      context.syntax = context.syntax.rebuild(
        (builder) => builder.value = stringLiteral,
      );
      return true;
    }
    return false;
  }
}