part of 'proto_x.dart';

class SyntaxDeclarationGrammar extends ChainableGrammar<SyntaxDeclaration> {
  const SyntaxDeclarationGrammar();

  @override
  final Iterable<Grammar<SyntaxDeclaration>> grammars = const [
    SpaceGrammar(),
    KeywordGrammar(KeywordType.syntax),
    SpaceGrammar(),
    EqualSignGrammar(),
    SpaceGrammar(),
    _SyntaxDeclarationLiteral(),
    SpaceGrammar(),
    SemicolonGrammar(),
  ];
}

class _SyntaxDeclarationLiteral extends Grammar<SyntaxDeclaration> {
  const _SyntaxDeclarationLiteral();

  @override
  bool scan(GrammarContext<SyntaxDeclaration> context) {
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
