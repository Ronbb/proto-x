import 'package:proto_x/src/syntax/syntax.dart';
import 'package:string_scanner/string_scanner.dart';

abstract class Grammar<T extends Syntax> {
  T updater([T? t]);
  T parse(SpanScanner scanner);
}

abstract class BlockGrammar<T extends Syntax> extends Grammar<T> {
  Grammar<T> get begin;
  Grammar<T> get end;
  Iterable<Grammar<T>> get includes;

  @override
  T parse(SpanScanner scanner) {
    final result = updater();
    return result;
  }
}
