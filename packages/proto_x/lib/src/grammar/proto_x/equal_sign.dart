part of 'proto_x.dart';

class EqualSignGrammar<S extends EqualSignMixin> extends Grammar<S> {
  const EqualSignGrammar();

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
