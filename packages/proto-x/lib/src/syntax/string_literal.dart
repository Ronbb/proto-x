part of 'syntax.dart';

abstract class StringLiteral
    implements Built<StringLiteral, StringLiteralBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.stringLiteral;

  String get string;

  StringLiteral._();

  factory StringLiteral([void Function(StringLiteralBuilder)? updates]) =
      _$StringLiteral;

  factory StringLiteral.withDefault() {
    return StringLiteral((builder) {
      builder
        ..syntaxSpan = SyntaxSpan.withDefault().toBuilder()
        ..string = '';
    });
  }
}
