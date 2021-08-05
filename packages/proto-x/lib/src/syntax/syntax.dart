import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'comment.dart';
part 'equal_sign.dart';
part 'keyword.dart';
part 'semicolon.dart';
part 'string_literal.dart';
part 'syntax_declaration.dart';
part 'utils/syntax_error.dart';
part 'utils/syntax_getter.dart';
part 'utils/syntax_type.dart';
part 'utils/syntax_span.dart';

part 'syntax.g.dart';

abstract class Syntax {
  const Syntax();

  SyntaxSpan get syntaxSpan;
  SyntaxType get syntaxType;
  SyntaxError? get error;
}
