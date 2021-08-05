part of '../syntax.dart';

abstract class SyntaxGetter {
  const SyntaxGetter();

  Iterable<Syntax> get syntaxes;

  Iterable<T> get<T>(SyntaxType t) {
    return syntaxes.where((s) => s.syntaxType == t).cast<T>();
  }

  Iterable<Comment> get comments => get(SyntaxType.comment);
  Iterable<SyntaxDeclaration> get syntaxDeclarations =>
      get(SyntaxType.syntaxDeclaration);
}
