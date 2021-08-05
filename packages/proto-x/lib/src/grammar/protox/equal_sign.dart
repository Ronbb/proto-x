part of 'protox.dart';

class EqualSign<S extends syntaxes.EqualSignMixin> extends Grammar<S> {
  const EqualSign();

  @override
  bool scan(GrammarContext<S> context) {
    final equalSign = context.scanEqualSign();
    try {
      if (equalSign != null) {
        context.syntax = (context.syntax as dynamic).rebuild(
          (builder) => builder.equalSign = equalSign,
        );
        return true;
      }
    } catch (e) {
      rethrow;
    }
    return false;
  }
}
