part of 'protox.dart';

class Keyword<S extends syntaxes.KeywordMixin> extends Grammar<S> {
  final syntaxes.KeywordType type;

  const Keyword(this.type);

  @override
  bool scan(GrammarContext<syntaxes.KeywordMixin> context) {
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
