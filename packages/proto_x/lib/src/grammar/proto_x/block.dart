part of 'proto_x.dart';

enum BlockBoundaryType {
  open,
  close,
}

class BlockBoundaryGrammar<S extends BlockMixin> extends Grammar<S> {
  final BlockBoundarySymbols symbol;
  final BlockBoundaryType type;

  const BlockBoundaryGrammar({required this.symbol, required this.type});

  @override
  bool scan(GrammarContext<S> context) {
    try {
      final boundary = context.scanBlockBoundary(type: type, symbol: symbol);

      if (boundary != null) {
        context.syntax = (context.syntax as dynamic).rebuild(
          (builder) {
            switch (type) {
              case BlockBoundaryType.open:
                builder.block.open = boundary;
                break;
              case BlockBoundaryType.close:
                builder.block.close = boundary;
                break;
              default:
                throw Exception('unknown BlockBoundaryType');
            }
          },
        );

        return true;
      }
      return false;
    } catch (e) {
      context.syntax = (context.syntax as dynamic).rebuild((builder) {
        final error = SyntaxError.withDefault().toBuilder();
        error
          ..message = e.toString()
          ..position = context.lastSpan()!.to;
        builder.error = error;
      });
      rethrow;
    }
  }
}
