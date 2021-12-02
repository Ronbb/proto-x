part of '../syntax.dart';

abstract class Block
    with ParentedSyntax
    implements Built<Block, BlockBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.block;

  BlockBoundary get open;
  BlockBoundary get close;
  BlockBoundarySymbols get symbol;

  Block._();

  @override
  Iterable<Syntax?> get syntaxes => [open, close];

  factory Block([void Function(BlockBuilder) updates]) = _$Block;

  factory Block.withDefault() {
    return Block((builder) {
      builder
        ..open = BlockBoundary.withDefault().toBuilder()
        ..close = BlockBoundary.withDefault().toBuilder()
        ..symbol = BlockBoundarySymbols.unknown;
    });
  }
}

abstract class BlockBoundary
    implements Built<BlockBoundary, BlockBoundaryBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.blockBoundary;

  BlockBoundary._();

  factory BlockBoundary([void Function(BlockBoundaryBuilder) updates]) =
      _$BlockBoundary;

  factory BlockBoundary.withDefault() {
    return BlockBoundary((builder) {
      builder.syntaxSpan = SyntaxSpan.withDefault().toBuilder();
    });
  }
}

mixin BlockMixin implements Syntax {
  Block get block;
}

class BlockBoundarySymbols extends EnumClass {
  static const BlockBoundarySymbols unknown = _$blockBoundarySymbolsUnknown;
  static const BlockBoundarySymbols brace = _$blockBoundarySymbolsBrace;
  static const BlockBoundarySymbols parenthesis =
      _$blockBoundarySymbolsParenthesis;
  static const BlockBoundarySymbols bracket = _$blockBoundarySymbolsBracket;
  static const BlockBoundarySymbols angleBracket =
      _$blockBoundarySymbolsAngleBracket;

  const BlockBoundarySymbols._(String name) : super(name);

  static BuiltSet<BlockBoundarySymbols> get values =>
      _$blockBoundarySymbolsValues;
  static BlockBoundarySymbols valueOf(String name) =>
      _$blockBoundarySymbolsValueOf(name);
}
