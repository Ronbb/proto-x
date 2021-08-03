part of 'syntax.dart';

class SyntaxPosition {
  final int line;
  final int column;

  SyntaxPosition({
    required this.line,
    required this.column,
  });
}

class SyntaxSpan {
  final SyntaxPosition from;
  final SyntaxPosition to;

  SyntaxSpan({
    required this.from,
    required this.to,
  });
}
