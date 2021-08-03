part 'comment.dart';
part 'syntax_declaration.dart';
part 'syntax_getter.dart';
part 'syntax_type.dart';
part 'syntax_span.dart';

abstract class Syntax {
  SyntaxSpan get span;
  SyntaxType get type;
}
