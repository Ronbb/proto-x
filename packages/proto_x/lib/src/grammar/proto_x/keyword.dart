part of 'proto_x.dart';

class KeywordGrammar<S extends KeywordMixin> extends Grammar<S> {
  final KeywordType type;

  const KeywordGrammar(this.type);

  @override
  bool scan(GrammarContext<KeywordMixin> context) {
    try {
      final keyword = context.scanKeyword(type);

      if (keyword != null) {
        context.syntax = (context.syntax as dynamic).rebuild(
          (builder) => builder.keyword = keyword,
        );

        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
