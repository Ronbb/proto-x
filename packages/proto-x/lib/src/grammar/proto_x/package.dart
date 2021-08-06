part of 'proto_x.dart';

class Package extends ChainableGrammar<syntaxes.Package> {
  const Package();

  @override
  final Iterable<Grammar<syntaxes.Package>> grammars = const [
    Keyword(syntaxes.KeywordType.package),
  ];
}

class PackageName extends Grammar<syntaxes.Package> {
  @override
  bool scan(GrammarContext<syntaxes.Package> context) {
    // TODO: implement scan
    throw UnimplementedError();
  }
  
}
