part of 'syntax.dart';

enum CommentType {
  block,
  inline,
}

abstract class Comment implements Built<Comment, CommentBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.comment;

  String get text;

  CommentType get commentType;

  Comment._();

  factory Comment([void Function(CommentBuilder)? updates]) = _$Comment;
}
