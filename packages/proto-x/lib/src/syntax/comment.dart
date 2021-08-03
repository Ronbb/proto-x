part of 'syntax.dart';

enum CommentType {
  block,
  inline,
}

class Comment implements Syntax {
  @override
  final SyntaxSpan span;

  @override
  final SyntaxType type = SyntaxType.comment;

  final String text;

  final CommentType commentType;

  const Comment({
    required this.span,
    required this.text,
    required this.commentType,
  });
}
