// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syntax.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const KeywordType _$keywordTypeSyntax = const KeywordType._('syntax');

KeywordType _$keywordTypeValueOf(String name) {
  switch (name) {
    case 'syntax':
      return _$keywordTypeSyntax;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<KeywordType> _$keywordTypeValues =
    new BuiltSet<KeywordType>(const <KeywordType>[
  _$keywordTypeSyntax,
]);

class _$Comment extends Comment {
  @override
  final String text;
  @override
  final CommentType commentType;
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;

  factory _$Comment([void Function(CommentBuilder)? updates]) =>
      (new CommentBuilder()..update(updates)).build();

  _$Comment._(
      {required this.text,
      required this.commentType,
      required this.syntaxSpan,
      this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(text, 'Comment', 'text');
    BuiltValueNullFieldError.checkNotNull(
        commentType, 'Comment', 'commentType');
    BuiltValueNullFieldError.checkNotNull(syntaxSpan, 'Comment', 'syntaxSpan');
  }

  @override
  Comment rebuild(void Function(CommentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentBuilder toBuilder() => new CommentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Comment &&
        text == other.text &&
        commentType == other.commentType &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, text.hashCode), commentType.hashCode),
            syntaxSpan.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Comment')
          ..add('text', text)
          ..add('commentType', commentType)
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error))
        .toString();
  }
}

class CommentBuilder implements Builder<Comment, CommentBuilder> {
  _$Comment? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  CommentType? _commentType;
  CommentType? get commentType => _$this._commentType;
  set commentType(CommentType? commentType) =>
      _$this._commentType = commentType;

  SyntaxSpanBuilder? _syntaxSpan;
  SyntaxSpanBuilder get syntaxSpan =>
      _$this._syntaxSpan ??= new SyntaxSpanBuilder();
  set syntaxSpan(SyntaxSpanBuilder? syntaxSpan) =>
      _$this._syntaxSpan = syntaxSpan;

  SyntaxErrorBuilder? _error;
  SyntaxErrorBuilder get error => _$this._error ??= new SyntaxErrorBuilder();
  set error(SyntaxErrorBuilder? error) => _$this._error = error;

  CommentBuilder();

  CommentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _commentType = $v.commentType;
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Comment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Comment;
  }

  @override
  void update(void Function(CommentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Comment build() {
    _$Comment _$result;
    try {
      _$result = _$v ??
          new _$Comment._(
              text: BuiltValueNullFieldError.checkNotNull(
                  text, 'Comment', 'text'),
              commentType: BuiltValueNullFieldError.checkNotNull(
                  commentType, 'Comment', 'commentType'),
              syntaxSpan: syntaxSpan.build(),
              error: _error?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'syntaxSpan';
        syntaxSpan.build();
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Comment', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$EqualSign extends EqualSign {
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;

  factory _$EqualSign([void Function(EqualSignBuilder)? updates]) =>
      (new EqualSignBuilder()..update(updates)).build();

  _$EqualSign._({required this.syntaxSpan, this.error}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        syntaxSpan, 'EqualSign', 'syntaxSpan');
  }

  @override
  EqualSign rebuild(void Function(EqualSignBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EqualSignBuilder toBuilder() => new EqualSignBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EqualSign &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, syntaxSpan.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EqualSign')
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error))
        .toString();
  }
}

class EqualSignBuilder implements Builder<EqualSign, EqualSignBuilder> {
  _$EqualSign? _$v;

  SyntaxSpanBuilder? _syntaxSpan;
  SyntaxSpanBuilder get syntaxSpan =>
      _$this._syntaxSpan ??= new SyntaxSpanBuilder();
  set syntaxSpan(SyntaxSpanBuilder? syntaxSpan) =>
      _$this._syntaxSpan = syntaxSpan;

  SyntaxErrorBuilder? _error;
  SyntaxErrorBuilder get error => _$this._error ??= new SyntaxErrorBuilder();
  set error(SyntaxErrorBuilder? error) => _$this._error = error;

  EqualSignBuilder();

  EqualSignBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EqualSign other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EqualSign;
  }

  @override
  void update(void Function(EqualSignBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EqualSign build() {
    _$EqualSign _$result;
    try {
      _$result = _$v ??
          new _$EqualSign._(
              syntaxSpan: syntaxSpan.build(), error: _error?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'syntaxSpan';
        syntaxSpan.build();
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EqualSign', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Keyword extends Keyword {
  @override
  final KeywordType keywordType;
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;

  factory _$Keyword([void Function(KeywordBuilder)? updates]) =>
      (new KeywordBuilder()..update(updates)).build();

  _$Keyword._({required this.keywordType, required this.syntaxSpan, this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        keywordType, 'Keyword', 'keywordType');
    BuiltValueNullFieldError.checkNotNull(syntaxSpan, 'Keyword', 'syntaxSpan');
  }

  @override
  Keyword rebuild(void Function(KeywordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KeywordBuilder toBuilder() => new KeywordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Keyword &&
        keywordType == other.keywordType &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, keywordType.hashCode), syntaxSpan.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Keyword')
          ..add('keywordType', keywordType)
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error))
        .toString();
  }
}

class KeywordBuilder implements Builder<Keyword, KeywordBuilder> {
  _$Keyword? _$v;

  KeywordType? _keywordType;
  KeywordType? get keywordType => _$this._keywordType;
  set keywordType(KeywordType? keywordType) =>
      _$this._keywordType = keywordType;

  SyntaxSpanBuilder? _syntaxSpan;
  SyntaxSpanBuilder get syntaxSpan =>
      _$this._syntaxSpan ??= new SyntaxSpanBuilder();
  set syntaxSpan(SyntaxSpanBuilder? syntaxSpan) =>
      _$this._syntaxSpan = syntaxSpan;

  SyntaxErrorBuilder? _error;
  SyntaxErrorBuilder get error => _$this._error ??= new SyntaxErrorBuilder();
  set error(SyntaxErrorBuilder? error) => _$this._error = error;

  KeywordBuilder();

  KeywordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _keywordType = $v.keywordType;
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Keyword other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Keyword;
  }

  @override
  void update(void Function(KeywordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Keyword build() {
    _$Keyword _$result;
    try {
      _$result = _$v ??
          new _$Keyword._(
              keywordType: BuiltValueNullFieldError.checkNotNull(
                  keywordType, 'Keyword', 'keywordType'),
              syntaxSpan: syntaxSpan.build(),
              error: _error?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'syntaxSpan';
        syntaxSpan.build();
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Keyword', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Semicolon extends Semicolon {
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;

  factory _$Semicolon([void Function(SemicolonBuilder)? updates]) =>
      (new SemicolonBuilder()..update(updates)).build();

  _$Semicolon._({required this.syntaxSpan, this.error}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        syntaxSpan, 'Semicolon', 'syntaxSpan');
  }

  @override
  Semicolon rebuild(void Function(SemicolonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SemicolonBuilder toBuilder() => new SemicolonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Semicolon &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, syntaxSpan.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Semicolon')
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error))
        .toString();
  }
}

class SemicolonBuilder implements Builder<Semicolon, SemicolonBuilder> {
  _$Semicolon? _$v;

  SyntaxSpanBuilder? _syntaxSpan;
  SyntaxSpanBuilder get syntaxSpan =>
      _$this._syntaxSpan ??= new SyntaxSpanBuilder();
  set syntaxSpan(SyntaxSpanBuilder? syntaxSpan) =>
      _$this._syntaxSpan = syntaxSpan;

  SyntaxErrorBuilder? _error;
  SyntaxErrorBuilder get error => _$this._error ??= new SyntaxErrorBuilder();
  set error(SyntaxErrorBuilder? error) => _$this._error = error;

  SemicolonBuilder();

  SemicolonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Semicolon other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Semicolon;
  }

  @override
  void update(void Function(SemicolonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Semicolon build() {
    _$Semicolon _$result;
    try {
      _$result = _$v ??
          new _$Semicolon._(
              syntaxSpan: syntaxSpan.build(), error: _error?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'syntaxSpan';
        syntaxSpan.build();
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Semicolon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$StringValue extends StringLiteral {
  @override
  final String string;
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;

  factory _$StringValue([void Function(StringLiteralBuilder)? updates]) =>
      (new StringLiteralBuilder()..update(updates)).build();

  _$StringValue._({required this.string, required this.syntaxSpan, this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(string, 'StringValue', 'string');
    BuiltValueNullFieldError.checkNotNull(
        syntaxSpan, 'StringValue', 'syntaxSpan');
  }

  @override
  StringLiteral rebuild(void Function(StringLiteralBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StringLiteralBuilder toBuilder() => new StringLiteralBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StringLiteral &&
        string == other.string &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, string.hashCode), syntaxSpan.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StringValue')
          ..add('string', string)
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error))
        .toString();
  }
}

class StringLiteralBuilder implements Builder<StringLiteral, StringLiteralBuilder> {
  _$StringValue? _$v;

  String? _string;
  String? get string => _$this._string;
  set string(String? string) => _$this._string = string;

  SyntaxSpanBuilder? _syntaxSpan;
  SyntaxSpanBuilder get syntaxSpan =>
      _$this._syntaxSpan ??= new SyntaxSpanBuilder();
  set syntaxSpan(SyntaxSpanBuilder? syntaxSpan) =>
      _$this._syntaxSpan = syntaxSpan;

  SyntaxErrorBuilder? _error;
  SyntaxErrorBuilder get error => _$this._error ??= new SyntaxErrorBuilder();
  set error(SyntaxErrorBuilder? error) => _$this._error = error;

  StringLiteralBuilder();

  StringLiteralBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _string = $v.string;
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StringLiteral other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StringValue;
  }

  @override
  void update(void Function(StringLiteralBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StringValue build() {
    _$StringValue _$result;
    try {
      _$result = _$v ??
          new _$StringValue._(
              string: BuiltValueNullFieldError.checkNotNull(
                  string, 'StringValue', 'string'),
              syntaxSpan: syntaxSpan.build(),
              error: _error?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'syntaxSpan';
        syntaxSpan.build();
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'StringValue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SyntaxDeclaration extends SyntaxDeclaration {
  @override
  final StringLiteral value;
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;
  @override
  final Keyword keyword;
  @override
  final Semicolon semicolon;
  @override
  final EqualSign equalSign;

  factory _$SyntaxDeclaration(
          [void Function(SyntaxDeclarationBuilder)? updates]) =>
      (new SyntaxDeclarationBuilder()..update(updates)).build();

  _$SyntaxDeclaration._(
      {required this.value,
      required this.syntaxSpan,
      this.error,
      required this.keyword,
      required this.semicolon,
      required this.equalSign})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(value, 'SyntaxDeclaration', 'value');
    BuiltValueNullFieldError.checkNotNull(
        syntaxSpan, 'SyntaxDeclaration', 'syntaxSpan');
    BuiltValueNullFieldError.checkNotNull(
        keyword, 'SyntaxDeclaration', 'keyword');
    BuiltValueNullFieldError.checkNotNull(
        semicolon, 'SyntaxDeclaration', 'semicolon');
    BuiltValueNullFieldError.checkNotNull(
        equalSign, 'SyntaxDeclaration', 'equalSign');
  }

  @override
  SyntaxDeclaration rebuild(void Function(SyntaxDeclarationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SyntaxDeclarationBuilder toBuilder() =>
      new SyntaxDeclarationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SyntaxDeclaration &&
        value == other.value &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error &&
        keyword == other.keyword &&
        semicolon == other.semicolon &&
        equalSign == other.equalSign;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, value.hashCode), syntaxSpan.hashCode),
                    error.hashCode),
                keyword.hashCode),
            semicolon.hashCode),
        equalSign.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SyntaxDeclaration')
          ..add('value', value)
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error)
          ..add('keyword', keyword)
          ..add('semicolon', semicolon)
          ..add('equalSign', equalSign))
        .toString();
  }
}

class SyntaxDeclarationBuilder
    implements Builder<SyntaxDeclaration, SyntaxDeclarationBuilder> {
  _$SyntaxDeclaration? _$v;

  StringLiteralBuilder? _value;
  StringLiteralBuilder get value => _$this._value ??= new StringLiteralBuilder();
  set value(StringLiteralBuilder? value) => _$this._value = value;

  SyntaxSpanBuilder? _syntaxSpan;
  SyntaxSpanBuilder get syntaxSpan =>
      _$this._syntaxSpan ??= new SyntaxSpanBuilder();
  set syntaxSpan(SyntaxSpanBuilder? syntaxSpan) =>
      _$this._syntaxSpan = syntaxSpan;

  SyntaxErrorBuilder? _error;
  SyntaxErrorBuilder get error => _$this._error ??= new SyntaxErrorBuilder();
  set error(SyntaxErrorBuilder? error) => _$this._error = error;

  KeywordBuilder? _keyword;
  KeywordBuilder get keyword => _$this._keyword ??= new KeywordBuilder();
  set keyword(KeywordBuilder? keyword) => _$this._keyword = keyword;

  SemicolonBuilder? _semicolon;
  SemicolonBuilder get semicolon =>
      _$this._semicolon ??= new SemicolonBuilder();
  set semicolon(SemicolonBuilder? semicolon) => _$this._semicolon = semicolon;

  EqualSignBuilder? _equalSign;
  EqualSignBuilder get equalSign =>
      _$this._equalSign ??= new EqualSignBuilder();
  set equalSign(EqualSignBuilder? equalSign) => _$this._equalSign = equalSign;

  SyntaxDeclarationBuilder();

  SyntaxDeclarationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value.toBuilder();
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _keyword = $v.keyword.toBuilder();
      _semicolon = $v.semicolon.toBuilder();
      _equalSign = $v.equalSign.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SyntaxDeclaration other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SyntaxDeclaration;
  }

  @override
  void update(void Function(SyntaxDeclarationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SyntaxDeclaration build() {
    _$SyntaxDeclaration _$result;
    try {
      _$result = _$v ??
          new _$SyntaxDeclaration._(
              value: value.build(),
              syntaxSpan: syntaxSpan.build(),
              error: _error?.build(),
              keyword: keyword.build(),
              semicolon: semicolon.build(),
              equalSign: equalSign.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'value';
        value.build();
        _$failedField = 'syntaxSpan';
        syntaxSpan.build();
        _$failedField = 'error';
        _error?.build();
        _$failedField = 'keyword';
        keyword.build();
        _$failedField = 'semicolon';
        semicolon.build();
        _$failedField = 'equalSign';
        equalSign.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SyntaxDeclaration', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SyntaxError extends SyntaxError {
  @override
  final SyntaxPosition position;
  @override
  final String message;

  factory _$SyntaxError([void Function(SyntaxErrorBuilder)? updates]) =>
      (new SyntaxErrorBuilder()..update(updates)).build();

  _$SyntaxError._({required this.position, required this.message}) : super._() {
    BuiltValueNullFieldError.checkNotNull(position, 'SyntaxError', 'position');
    BuiltValueNullFieldError.checkNotNull(message, 'SyntaxError', 'message');
  }

  @override
  SyntaxError rebuild(void Function(SyntaxErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SyntaxErrorBuilder toBuilder() => new SyntaxErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SyntaxError &&
        position == other.position &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, position.hashCode), message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SyntaxError')
          ..add('position', position)
          ..add('message', message))
        .toString();
  }
}

class SyntaxErrorBuilder implements Builder<SyntaxError, SyntaxErrorBuilder> {
  _$SyntaxError? _$v;

  SyntaxPositionBuilder? _position;
  SyntaxPositionBuilder get position =>
      _$this._position ??= new SyntaxPositionBuilder();
  set position(SyntaxPositionBuilder? position) => _$this._position = position;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  SyntaxErrorBuilder();

  SyntaxErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _position = $v.position.toBuilder();
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SyntaxError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SyntaxError;
  }

  @override
  void update(void Function(SyntaxErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SyntaxError build() {
    _$SyntaxError _$result;
    try {
      _$result = _$v ??
          new _$SyntaxError._(
              position: position.build(),
              message: BuiltValueNullFieldError.checkNotNull(
                  message, 'SyntaxError', 'message'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'position';
        position.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SyntaxError', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SyntaxPosition extends SyntaxPosition {
  @override
  final int line;
  @override
  final int column;

  factory _$SyntaxPosition([void Function(SyntaxPositionBuilder)? updates]) =>
      (new SyntaxPositionBuilder()..update(updates)).build();

  _$SyntaxPosition._({required this.line, required this.column}) : super._() {
    BuiltValueNullFieldError.checkNotNull(line, 'SyntaxPosition', 'line');
    BuiltValueNullFieldError.checkNotNull(column, 'SyntaxPosition', 'column');
  }

  @override
  SyntaxPosition rebuild(void Function(SyntaxPositionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SyntaxPositionBuilder toBuilder() =>
      new SyntaxPositionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SyntaxPosition &&
        line == other.line &&
        column == other.column;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, line.hashCode), column.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SyntaxPosition')
          ..add('line', line)
          ..add('column', column))
        .toString();
  }
}

class SyntaxPositionBuilder
    implements Builder<SyntaxPosition, SyntaxPositionBuilder> {
  _$SyntaxPosition? _$v;

  int? _line;
  int? get line => _$this._line;
  set line(int? line) => _$this._line = line;

  int? _column;
  int? get column => _$this._column;
  set column(int? column) => _$this._column = column;

  SyntaxPositionBuilder();

  SyntaxPositionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _line = $v.line;
      _column = $v.column;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SyntaxPosition other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SyntaxPosition;
  }

  @override
  void update(void Function(SyntaxPositionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SyntaxPosition build() {
    final _$result = _$v ??
        new _$SyntaxPosition._(
            line: BuiltValueNullFieldError.checkNotNull(
                line, 'SyntaxPosition', 'line'),
            column: BuiltValueNullFieldError.checkNotNull(
                column, 'SyntaxPosition', 'column'));
    replace(_$result);
    return _$result;
  }
}

class _$SyntaxSpan extends SyntaxSpan {
  @override
  final SyntaxPosition from;
  @override
  final SyntaxPosition to;

  factory _$SyntaxSpan([void Function(SyntaxSpanBuilder)? updates]) =>
      (new SyntaxSpanBuilder()..update(updates)).build();

  _$SyntaxSpan._({required this.from, required this.to}) : super._() {
    BuiltValueNullFieldError.checkNotNull(from, 'SyntaxSpan', 'from');
    BuiltValueNullFieldError.checkNotNull(to, 'SyntaxSpan', 'to');
  }

  @override
  SyntaxSpan rebuild(void Function(SyntaxSpanBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SyntaxSpanBuilder toBuilder() => new SyntaxSpanBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SyntaxSpan && from == other.from && to == other.to;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, from.hashCode), to.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SyntaxSpan')
          ..add('from', from)
          ..add('to', to))
        .toString();
  }
}

class SyntaxSpanBuilder implements Builder<SyntaxSpan, SyntaxSpanBuilder> {
  _$SyntaxSpan? _$v;

  SyntaxPositionBuilder? _from;
  SyntaxPositionBuilder get from =>
      _$this._from ??= new SyntaxPositionBuilder();
  set from(SyntaxPositionBuilder? from) => _$this._from = from;

  SyntaxPositionBuilder? _to;
  SyntaxPositionBuilder get to => _$this._to ??= new SyntaxPositionBuilder();
  set to(SyntaxPositionBuilder? to) => _$this._to = to;

  SyntaxSpanBuilder();

  SyntaxSpanBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _from = $v.from.toBuilder();
      _to = $v.to.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SyntaxSpan other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SyntaxSpan;
  }

  @override
  void update(void Function(SyntaxSpanBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SyntaxSpan build() {
    _$SyntaxSpan _$result;
    try {
      _$result = _$v ?? new _$SyntaxSpan._(from: from.build(), to: to.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'from';
        from.build();
        _$failedField = 'to';
        to.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SyntaxSpan', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
