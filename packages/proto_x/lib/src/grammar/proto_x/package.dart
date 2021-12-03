part of 'proto_x.dart';

class PackageGrammar extends ChainableGrammar<Package> {
  const PackageGrammar();

  @override
  final Iterable<Grammar<Package>> grammars = const [
    SpaceGrammar(),
    KeywordGrammar(KeywordType.package),
    SpaceGrammar(),
    _PackageName(),
    SpaceGrammar(),
    SemicolonGrammar(),
  ];
}

class _PackageName extends Grammar<Package> {
  const _PackageName();

  @override
  bool scan(GrammarContext<Package> context) {
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
