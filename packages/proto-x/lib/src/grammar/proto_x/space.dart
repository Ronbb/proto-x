part of 'proto_x.dart';

class Space<S extends syntaxes.Syntax> extends Grammar<S> {
  const Space({this.isRequired = false});

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
