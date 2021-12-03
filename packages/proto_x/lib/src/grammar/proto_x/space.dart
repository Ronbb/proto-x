part of 'proto_x.dart';

class SpaceGrammar<S extends Syntax> extends Grammar<S> {
  const SpaceGrammar({this.isRequired = false});

  final bool isRequired;

  @override
  bool scan(GrammarContext<S> context) {
    final result = context.scanSpace();
    if (isRequired) {
      return result;
    }
    return true;
  }
}
