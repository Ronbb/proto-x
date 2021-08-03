part of 'syntax.dart';

class SyntaxDeclaration implements Syntax {
  @override
  final SyntaxSpan span;

  @override
  final SyntaxType type = SyntaxType.syntaxDeclaration;

  SyntaxDeclaration({
    required this.span,
  });
}
