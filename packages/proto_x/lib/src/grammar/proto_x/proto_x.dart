import 'package:built_collection/built_collection.dart';
import 'package:proto_x/src/grammar/grammar.dart';
import 'package:proto_x/src/syntax/syntax.dart' as syntaxes;
import 'package:proto_x/src/utils/utils.dart' as utils;

part 'block.dart';
part 'equal_sign.dart';
part 'keyword.dart';
part 'message.dart';
part 'package.dart';
part 'semicolon.dart';
part 'space.dart';
part 'syntax_declaration.dart';

part 'utils/scan.dart';

class ProtoX extends BlockGrammar<syntaxes.ProtoX> {
  const ProtoX();

  @override
  Iterable<Grammar<syntaxes.ProtoX>> get includes {
    return [
      CastedGrammar<syntaxes.ProtoX, syntaxes.SyntaxDeclaration>(
        builder: (context) => GrammarContext(
          scanner: context.scanner,
          syntax: syntaxes.SyntaxDeclaration.withDefault(),
        ),
        caster: (previous, next) {
          next.syntax = next.syntax.rebuild((builder) {
            builder.syntaxDeclarations.add(previous.syntax);
          });
        },
        grammar: SyntaxDeclaration(),
      ),
      CastedGrammar<syntaxes.ProtoX, syntaxes.Package>(
        builder: (context) => GrammarContext(
          scanner: context.scanner,
          syntax: syntaxes.Package.withDefault(),
        ),
        caster: (previous, next) {
          next.syntax = next.syntax.rebuild((builder) {
            builder.packages.add(previous.syntax);
          });
        },
        grammar: Package(),
      ),
      CastedGrammar<syntaxes.ProtoX, syntaxes.Message>(
        builder: (context) => GrammarContext(
          scanner: context.scanner,
          syntax: syntaxes.Message.withDefault(),
        ),
        caster: (previous, next) {
          next.syntax = next.syntax.rebuild((builder) {
            builder.messages.add(previous.syntax);
          });
        },
        grammar: Message(),
      ),
    ];
  }
}

abstract class _ProtoX<S extends syntaxes.Syntax, G extends Grammar<S>>
    extends Grammar<syntaxes.ProtoX> {
  final GrammarContext<syntaxes.ProtoX> context;
  final Grammar<S> insideGrammar;
  final GrammarContext<S> insideContext;

  const _ProtoX({
    required this.context,
    required this.insideContext,
    required this.insideGrammar,
  });

  void merge(
    GrammarContext<syntaxes.ProtoX> context,
    GrammarContext<S> insideContext,
  );

  bool insideScan(GrammarContext<syntaxes.ProtoX> context) {
    return insideGrammar.scan(insideContext);
  }

  @override
  bool scan(GrammarContext<syntaxes.ProtoX> context) {
    final result = insideScan(context);
    merge(context, insideContext);
    return result;
  }

  @override
  bool check(GrammarContext<syntaxes.ProtoX> context) {
    return insideGrammar.check(insideContext);
  }
}

class _SyntaxDeclaration
    extends _ProtoX<syntaxes.SyntaxDeclaration, SyntaxDeclaration> {
  _SyntaxDeclaration(GrammarContext<syntaxes.ProtoX> context)
      : super(
          context: context,
          insideContext: GrammarContext(
            scanner: context.scanner,
            syntax: syntaxes.SyntaxDeclaration.withDefault(),
          ),
          insideGrammar: SyntaxDeclaration(),
        );

  @override
  void merge(
    GrammarContext<syntaxes.ProtoX> context,
    GrammarContext<syntaxes.SyntaxDeclaration> insideContext,
  ) {
    context.syntax = context.syntax.rebuild(
      (builder) {
        builder.syntaxDeclarations.add(insideContext.syntax);
      },
    );
  }
}

class _Package extends _ProtoX<syntaxes.Package, Package> {
  _Package(GrammarContext<syntaxes.ProtoX> context)
      : super(
          context: context,
          insideContext: GrammarContext(
            scanner: context.scanner,
            syntax: syntaxes.Package.withDefault(),
          ),
          insideGrammar: Package(),
        );

  @override
  void merge(
    GrammarContext<syntaxes.ProtoX> context,
    GrammarContext<syntaxes.Package> insideContext,
  ) {
    context.syntax = context.syntax.rebuild(
      (builder) {
        builder.packages.add(insideContext.syntax);
      },
    );
  }
}
