import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'basic/block_boundary.dart';
part 'basic/equal_sign.dart';
part 'basic/keyword.dart';
part 'basic/semicolon.dart';
part 'basic/string_literal.dart';

part 'comment.dart';
part 'message.dart';
part 'package.dart';
part 'syntax_declaration.dart';

part 'proto_x.dart';

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
