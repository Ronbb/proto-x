part of 'syntax.dart';

abstract class Comment implements Built<Comment, CommentBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.comment;

  StringLiteral get text;

  CommentType get commentType;

  Comment._();

  factory Comment([void Function(CommentBuilder)? updates]) = _$Comment;

  factory Comment.withDefault() {
    return Comment((builder) {
      builder
        ..commentType = CommentType.unknown
        ..syntaxSpan = SyntaxSpan.withDefault().toBuilder()
        ..text = StringLiteral.withDefault().toBuilder();
    });
  }
}

class CommentType extends EnumClass {
  static const CommentType unknown = _$commentTypeUnknown;
  static const CommentType block = _$commentTypeBlock;
  static const CommentType inline = _$commentTypeInline;

  const CommentType._(String name) : super(name);

  static BuiltSet<CommentType> get values => _$commentTypeValues;
  static CommentType valueOf(String name) => _$commentTypeValueOf(name);
}
