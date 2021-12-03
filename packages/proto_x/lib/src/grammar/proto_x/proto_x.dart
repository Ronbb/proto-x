import 'package:built_collection/built_collection.dart';
import 'package:proto_x/src/grammar/grammar.dart';
import 'package:proto_x/src/syntax/syntax.dart';
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

class ProtoXGrammar extends BlockGrammar<ProtoX> {
  const ProtoXGrammar();

  @override
  Iterable<Grammar<ProtoX>> get includes {
    return [
      CastedGrammar<ProtoX, SyntaxDeclaration>(
        builder: (context) => GrammarContext(
          scanner: context.scanner,
          syntax: SyntaxDeclaration.withDefault(),
        ),
        caster: (previous, next) {
          next.syntax = next.syntax.rebuild((builder) {
            builder.syntaxDeclarations.add(previous.syntax);
          });
        },
        grammar: SyntaxDeclarationGrammar(),
      ),
      CastedGrammar<ProtoX, Package>(
        builder: (context) => GrammarContext(
          scanner: context.scanner,
          syntax: Package.withDefault(),
        ),
        caster: (previous, next) {
          next.syntax = next.syntax.rebuild((builder) {
            builder.packages.add(previous.syntax);
          });
        },
        grammar: PackageGrammar(),
      ),
      CastedGrammar<ProtoX, Message>(
        builder: (context) => GrammarContext(
          scanner: context.scanner,
          syntax: Message.withDefault(),
        ),
        caster: (previous, next) {
          next.syntax = next.syntax.rebuild((builder) {
            builder.messages.add(previous.syntax);
          });
        },
        grammar: MessageGrammar(),
      ),
    ];
  }
}
