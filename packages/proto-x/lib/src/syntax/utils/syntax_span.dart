part of '../syntax.dart';

abstract class SyntaxPosition
    implements Built<SyntaxPosition, SyntaxPositionBuilder> {
  int get line;
  int get column;

  SyntaxPosition._();

  bool operator >(SyntaxPosition position) {
    if (line == position.line) {
      return column > position.column;
    }

    return line > position.line;
  }

  bool operator <(SyntaxPosition position) {
    if (line == position.line) {
      return column < position.column;
    }

    return line < position.line;
  }

  factory SyntaxPosition([void Function(SyntaxPositionBuilder) updates]) =
      _$SyntaxPosition;
}

abstract class SyntaxSpan implements Built<SyntaxSpan, SyntaxSpanBuilder> {
  SyntaxPosition get from;
  SyntaxPosition get to;

  SyntaxSpan._();

  factory SyntaxSpan([void Function(SyntaxSpanBuilder) updates]) = _$SyntaxSpan;
}
