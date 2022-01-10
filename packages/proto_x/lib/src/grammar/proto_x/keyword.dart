part of 'proto_x.dart';

class KeywordGrammar<S extends KeywordMixin> extends Grammar<S> {
  final KeywordType type;

  @override
  final bool isRequired;

  const KeywordGrammar(
    this.type, {
    this.isRequired = true,
  });

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
      return !isRequired;
    } catch (e) {
      rethrow;
    }
  }
}
