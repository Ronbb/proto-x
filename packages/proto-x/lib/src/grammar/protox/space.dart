part of 'protox.dart';

class Space<S extends syntaxes.Syntax> extends Grammar<S> {
  const Space();

  @override
  bool scan(GrammarContext<S> context) {
    context.scanSpace();
    return true;
  }
}
