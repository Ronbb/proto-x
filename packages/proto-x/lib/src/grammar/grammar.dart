import 'package:string_scanner/string_scanner.dart';
import 'package:proto_x/src/syntax/syntax.dart' as syntaxes;

class GrammarContext<S extends syntaxes.Syntax> {
  final SpanScanner scanner;
  S syntax;

  GrammarContext({
    required this.scanner,
    required this.syntax,
  });
}

abstract class Grammar<S extends syntaxes.Syntax> {
  /// Successful if returns true.
  bool scan(GrammarContext<S> context);

  bool check(GrammarContext<S> context) => context.syntax.error == null;

  const Grammar();
}

abstract class ChainableGrammar<S extends syntaxes.Syntax> extends Grammar<S> {
  Iterable<Grammar<S>> get grammars;

  const ChainableGrammar();

  @override
  bool scan(GrammarContext<S> context) {
    for (final grammar in grammars) {
      if (!grammar.scan(context)) {
        break;
      }
    }

    return check(context);
  }

  @override
  bool check(GrammarContext<S> context) {
    return super.check(context) &&
        grammars.every(
          (grammar) => grammar.check(context),
        );
  }
}

abstract class BlockGrammar<S extends syntaxes.Syntax> extends Grammar<S> {
  Grammar<S>? get begin => null;
  Grammar<S>? get end => null;
  Iterable<Grammar<S>> get includes;

  const BlockGrammar();

  @override
  bool scan(GrammarContext<S> context) {
    if (begin?.scan(context) == false || context.scanner.isDone) {
      return false;
    }

    out:
    while (!context.scanner.isDone) {
      if (end?.scan(context) == true) {
        break out;
      }

      for (final include in includes) {
        if (include.scan(context)) {
          continue out;
        }
      }

      end?.scan(context);
      break out;
    }

    return check(context);
  }

  @override
  bool check(GrammarContext<S> context) {
    return super.check(context) &&
        [begin, end, ...includes].every(
          (grammar) => grammar?.check(context) != false,
        );
  }
}

typedef GrammarCaster<S extends syntaxes.Syntax, OS extends syntaxes.Syntax>
    = void Function(GrammarContext<OS> previous, GrammarContext<S> next);

typedef GrammarContextBuilder<S extends syntaxes.Syntax,
        OS extends syntaxes.Syntax>
    = GrammarContext<OS> Function(GrammarContext<S> context);

class CastedGrammar<S extends syntaxes.Syntax, OS extends syntaxes.Syntax>
    extends Grammar<S> {
  final GrammarContextBuilder<S, OS> builder;
  final GrammarCaster<S, OS> caster;
  final Grammar<OS> grammar;

  const CastedGrammar({
    required this.builder,
    required this.caster,
    required this.grammar,
  });

  @override
  bool scan(GrammarContext<S> context) {
    final previousContext = builder(context);
    if (grammar.scan(previousContext)) {
      caster(previousContext, context);
      return check(context);
    }
    return false;
  }
}
