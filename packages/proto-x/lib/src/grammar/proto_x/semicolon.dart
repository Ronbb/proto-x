part of 'proto_x.dart';

class Semicolon<S extends syntaxes.SemicolonMixin> extends Grammar<S> {
  const Semicolon();

  @override
  bool scan(GrammarContext<S> context) {
    final semicolon = context.scanSemicolon();
    try {
      if (semicolon != null) {
        context.syntax = (context.syntax as dynamic).rebuild(
          (builder) => builder.semicolon = semicolon,
        );
        return true;
      }
    } catch (e) {
      rethrow;
    }
    return false;
  }
}
