part of 'proto_x.dart';

class Package extends ChainableGrammar<syntaxes.Package> {
  const Package();

  @override
  final Iterable<Grammar<syntaxes.Package>> grammars = const [
    Space(),
    Keyword(syntaxes.KeywordType.package),
    Space(),
    PackageName(),
    Space(),
    Semicolon(),
  ];
}

class PackageName extends Grammar<syntaxes.Package> {
  const PackageName();

  @override
  bool scan(GrammarContext<syntaxes.Package> context) {
    final packageName = context.scanPackageName();
    if (packageName != null) {
      context.syntax = context.syntax.rebuild(
        (builder) => builder.name = packageName,
      );

      return true;
    }

    return false;
  }
}
