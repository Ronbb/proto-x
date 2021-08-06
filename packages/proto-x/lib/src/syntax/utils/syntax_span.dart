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

  factory SyntaxPosition.withDefault() {
    return SyntaxPosition((builder) {
      builder
        ..column = 0
        ..line = 0;
    });
  }
}

abstract class SyntaxSpan implements Built<SyntaxSpan, SyntaxSpanBuilder> {
  SyntaxPosition get from;
  SyntaxPosition get to;

  SyntaxSpan._();

  factory SyntaxSpan([void Function(SyntaxSpanBuilder) updates]) = _$SyntaxSpan;

  factory SyntaxSpan.withDefault() {
    return SyntaxSpan((builder) {
      builder
        ..from = SyntaxPosition.withDefault().toBuilder()
        ..to = SyntaxPosition.withDefault().toBuilder();
    });
  }
}
