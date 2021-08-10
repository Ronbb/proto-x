// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syntax.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const BlockBoundarySymbols _$blockBoundarySymbolsUnknown =
    const BlockBoundarySymbols._('unknown');
const BlockBoundarySymbols _$blockBoundarySymbolsBrace =
    const BlockBoundarySymbols._('brace');
const BlockBoundarySymbols _$blockBoundarySymbolsParenthesis =
    const BlockBoundarySymbols._('parenthesis');
const BlockBoundarySymbols _$blockBoundarySymbolsBracket =
    const BlockBoundarySymbols._('bracket');
const BlockBoundarySymbols _$blockBoundarySymbolsAngleBracket =
    const BlockBoundarySymbols._('angleBracket');

BlockBoundarySymbols _$blockBoundarySymbolsValueOf(String name) {
  switch (name) {
    case 'unknown':
      return _$blockBoundarySymbolsUnknown;
    case 'brace':
      return _$blockBoundarySymbolsBrace;
    case 'parenthesis':
      return _$blockBoundarySymbolsParenthesis;
    case 'bracket':
      return _$blockBoundarySymbolsBracket;
    case 'angleBracket':
      return _$blockBoundarySymbolsAngleBracket;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<BlockBoundarySymbols> _$blockBoundarySymbolsValues =
    new BuiltSet<BlockBoundarySymbols>(const <BlockBoundarySymbols>[
  _$blockBoundarySymbolsUnknown,
  _$blockBoundarySymbolsBrace,
  _$blockBoundarySymbolsParenthesis,
  _$blockBoundarySymbolsBracket,
  _$blockBoundarySymbolsAngleBracket,
]);

const KeywordType _$keywordTypeSyntax = const KeywordType._('syntax');
const KeywordType _$keywordTypePackage = const KeywordType._('package');
const KeywordType _$keywordTypeMessage = const KeywordType._('message');

KeywordType _$keywordTypeValueOf(String name) {
  switch (name) {
    case 'syntax':
      return _$keywordTypeSyntax;
    case 'package':
      return _$keywordTypePackage;
    case 'message':
      return _$keywordTypeMessage;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<KeywordType> _$keywordTypeValues =
    new BuiltSet<KeywordType>(const <KeywordType>[
  _$keywordTypeSyntax,
  _$keywordTypePackage,
  _$keywordTypeMessage,
]);

const CommentType _$commentTypeUnknown = const CommentType._('unknown');
const CommentType _$commentTypeBlock = const CommentType._('block');
const CommentType _$commentTypeInline = const CommentType._('inline');

CommentType _$commentTypeValueOf(String name) {
  switch (name) {
    case 'unknown':
      return _$commentTypeUnknown;
    case 'block':
      return _$commentTypeBlock;
    case 'inline':
      return _$commentTypeInline;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CommentType> _$commentTypeValues =
    new BuiltSet<CommentType>(const <CommentType>[
  _$commentTypeUnknown,
  _$commentTypeBlock,
  _$commentTypeInline,
]);

const MessageFieldModifiers _$messageFieldModifiersUnknown =
    const MessageFieldModifiers._('unknown');

MessageFieldModifiers _$messageFieldModifiersValueOf(String name) {
  switch (name) {
    case 'unknown':
      return _$messageFieldModifiersUnknown;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<MessageFieldModifiers> _$messageFieldModifiersValues =
    new BuiltSet<MessageFieldModifiers>(const <MessageFieldModifiers>[
  _$messageFieldModifiersUnknown,
]);

const MessageFieldTypes _$messageFieldTypesUnknown =
    const MessageFieldTypes._('unknown');

MessageFieldTypes _$messageFieldTypesValueOf(String name) {
  switch (name) {
    case 'unknown':
      return _$messageFieldTypesUnknown;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<MessageFieldTypes> _$messageFieldTypesValues =
    new BuiltSet<MessageFieldTypes>(const <MessageFieldTypes>[
  _$messageFieldTypesUnknown,
]);

class _$Block extends Block {
  @override
  final BlockBoundary open;
  @override
  final BlockBoundary close;
  @override
  final BlockBoundarySymbols symbol;
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;

  factory _$Block([void Function(BlockBuilder)? updates]) =>
      (new BlockBuilder()..update(updates)).build();

  _$Block._(
      {required this.open,
      required this.close,
      required this.symbol,
      required this.syntaxSpan,
      this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(open, 'Block', 'open');
    BuiltValueNullFieldError.checkNotNull(close, 'Block', 'close');
    BuiltValueNullFieldError.checkNotNull(symbol, 'Block', 'symbol');
    BuiltValueNullFieldError.checkNotNull(syntaxSpan, 'Block', 'syntaxSpan');
  }

  @override
  Block rebuild(void Function(BlockBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BlockBuilder toBuilder() => new BlockBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Block &&
        open == other.open &&
        close == other.close &&
        symbol == other.symbol &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, open.hashCode), close.hashCode), symbol.hashCode),
            syntaxSpan.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Block')
          ..add('open', open)
          ..add('close', close)
          ..add('symbol', symbol)
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error))
        .toString();
  }
}

class BlockBuilder implements Builder<Block, BlockBuilder> {
  _$Block? _$v;

  BlockBoundaryBuilder? _open;
  BlockBoundaryBuilder get open => _$this._open ??= new BlockBoundaryBuilder();
  set open(BlockBoundaryBuilder? open) => _$this._open = open;

  BlockBoundaryBuilder? _close;
  BlockBoundaryBuilder get close =>
      _$this._close ??= new BlockBoundaryBuilder();
  set close(BlockBoundaryBuilder? close) => _$this._close = close;

  BlockBoundarySymbols? _symbol;
  BlockBoundarySymbols? get symbol => _$this._symbol;
  set symbol(BlockBoundarySymbols? symbol) => _$this._symbol = symbol;

  SyntaxSpanBuilder? _syntaxSpan;
  SyntaxSpanBuilder get syntaxSpan =>
      _$this._syntaxSpan ??= new SyntaxSpanBuilder();
  set syntaxSpan(SyntaxSpanBuilder? syntaxSpan) =>
      _$this._syntaxSpan = syntaxSpan;

  SyntaxErrorBuilder? _error;
  SyntaxErrorBuilder get error => _$this._error ??= new SyntaxErrorBuilder();
  set error(SyntaxErrorBuilder? error) => _$this._error = error;

  BlockBuilder();

  BlockBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _open = $v.open.toBuilder();
      _close = $v.close.toBuilder();
      _symbol = $v.symbol;
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Block other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Block;
  }

  @override
  void update(void Function(BlockBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Block build() {
    _$Block _$result;
    try {
      _$result = _$v ??
          new _$Block._(
              open: open.build(),
              close: close.build(),
              symbol: BuiltValueNullFieldError.checkNotNull(
                  symbol, 'Block', 'symbol'),
              syntaxSpan: syntaxSpan.build(),
              error: _error?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'open';
        open.build();
        _$failedField = 'close';
        close.build();

        _$failedField = 'syntaxSpan';
        syntaxSpan.build();
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Block', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$BlockBoundary extends BlockBoundary {
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;

  factory _$BlockBoundary([void Function(BlockBoundaryBuilder)? updates]) =>
      (new BlockBoundaryBuilder()..update(updates)).build();

  _$BlockBoundary._({required this.syntaxSpan, this.error}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        syntaxSpan, 'BlockBoundary', 'syntaxSpan');
  }

  @override
  BlockBoundary rebuild(void Function(BlockBoundaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BlockBoundaryBuilder toBuilder() => new BlockBoundaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BlockBoundary &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, syntaxSpan.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BlockBoundary')
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error))
        .toString();
  }
}

class BlockBoundaryBuilder
    implements Builder<BlockBoundary, BlockBoundaryBuilder> {
  _$BlockBoundary? _$v;

  SyntaxSpanBuilder? _syntaxSpan;
  SyntaxSpanBuilder get syntaxSpan =>
      _$this._syntaxSpan ??= new SyntaxSpanBuilder();
  set syntaxSpan(SyntaxSpanBuilder? syntaxSpan) =>
      _$this._syntaxSpan = syntaxSpan;

  SyntaxErrorBuilder? _error;
  SyntaxErrorBuilder get error => _$this._error ??= new SyntaxErrorBuilder();
  set error(SyntaxErrorBuilder? error) => _$this._error = error;

  BlockBoundaryBuilder();

  BlockBoundaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BlockBoundary other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BlockBoundary;
  }

  @override
  void update(void Function(BlockBoundaryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BlockBoundary build() {
    _$BlockBoundary _$result;
    try {
      _$result = _$v ??
          new _$BlockBoundary._(
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
            'BlockBoundary', _$failedField, e.toString());
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

class _$StringLiteral extends StringLiteral {
  @override
  final String string;
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;

  factory _$StringLiteral([void Function(StringLiteralBuilder)? updates]) =>
      (new StringLiteralBuilder()..update(updates)).build();

  _$StringLiteral._(
      {required this.string, required this.syntaxSpan, this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(string, 'StringLiteral', 'string');
    BuiltValueNullFieldError.checkNotNull(
        syntaxSpan, 'StringLiteral', 'syntaxSpan');
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
    return (newBuiltValueToStringHelper('StringLiteral')
          ..add('string', string)
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error))
        .toString();
  }
}

class StringLiteralBuilder
    implements Builder<StringLiteral, StringLiteralBuilder> {
  _$StringLiteral? _$v;

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
    _$v = other as _$StringLiteral;
  }

  @override
  void update(void Function(StringLiteralBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StringLiteral build() {
    _$StringLiteral _$result;
    try {
      _$result = _$v ??
          new _$StringLiteral._(
              string: BuiltValueNullFieldError.checkNotNull(
                  string, 'StringLiteral', 'string'),
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
            'StringLiteral', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Comment extends Comment {
  @override
  final StringLiteral text;
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

  StringLiteralBuilder? _text;
  StringLiteralBuilder get text => _$this._text ??= new StringLiteralBuilder();
  set text(StringLiteralBuilder? text) => _$this._text = text;

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
      _text = $v.text.toBuilder();
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
              text: text.build(),
              commentType: BuiltValueNullFieldError.checkNotNull(
                  commentType, 'Comment', 'commentType'),
              syntaxSpan: syntaxSpan.build(),
              error: _error?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'text';
        text.build();

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

class _$Message extends Message {
  @override
  final BuiltList<MessageField> fields;
  @override
  final MessageName name;
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;
  @override
  final Block block;

  factory _$Message([void Function(MessageBuilder)? updates]) =>
      (new MessageBuilder()..update(updates)).build();

  _$Message._(
      {required this.fields,
      required this.name,
      required this.syntaxSpan,
      this.error,
      required this.block})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(fields, 'Message', 'fields');
    BuiltValueNullFieldError.checkNotNull(name, 'Message', 'name');
    BuiltValueNullFieldError.checkNotNull(syntaxSpan, 'Message', 'syntaxSpan');
    BuiltValueNullFieldError.checkNotNull(block, 'Message', 'block');
  }

  @override
  Message rebuild(void Function(MessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageBuilder toBuilder() => new MessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Message &&
        fields == other.fields &&
        name == other.name &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error &&
        block == other.block;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, fields.hashCode), name.hashCode),
                syntaxSpan.hashCode),
            error.hashCode),
        block.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Message')
          ..add('fields', fields)
          ..add('name', name)
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error)
          ..add('block', block))
        .toString();
  }
}

class MessageBuilder implements Builder<Message, MessageBuilder> {
  _$Message? _$v;

  ListBuilder<MessageField>? _fields;
  ListBuilder<MessageField> get fields =>
      _$this._fields ??= new ListBuilder<MessageField>();
  set fields(ListBuilder<MessageField>? fields) => _$this._fields = fields;

  MessageNameBuilder? _name;
  MessageNameBuilder get name => _$this._name ??= new MessageNameBuilder();
  set name(MessageNameBuilder? name) => _$this._name = name;

  SyntaxSpanBuilder? _syntaxSpan;
  SyntaxSpanBuilder get syntaxSpan =>
      _$this._syntaxSpan ??= new SyntaxSpanBuilder();
  set syntaxSpan(SyntaxSpanBuilder? syntaxSpan) =>
      _$this._syntaxSpan = syntaxSpan;

  SyntaxErrorBuilder? _error;
  SyntaxErrorBuilder get error => _$this._error ??= new SyntaxErrorBuilder();
  set error(SyntaxErrorBuilder? error) => _$this._error = error;

  BlockBuilder? _block;
  BlockBuilder get block => _$this._block ??= new BlockBuilder();
  set block(BlockBuilder? block) => _$this._block = block;

  MessageBuilder();

  MessageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fields = $v.fields.toBuilder();
      _name = $v.name.toBuilder();
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _block = $v.block.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Message other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Message;
  }

  @override
  void update(void Function(MessageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Message build() {
    _$Message _$result;
    try {
      _$result = _$v ??
          new _$Message._(
              fields: fields.build(),
              name: name.build(),
              syntaxSpan: syntaxSpan.build(),
              error: _error?.build(),
              block: block.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fields';
        fields.build();
        _$failedField = 'name';
        name.build();
        _$failedField = 'syntaxSpan';
        syntaxSpan.build();
        _$failedField = 'error';
        _error?.build();
        _$failedField = 'block';
        block.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Message', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MessageName extends MessageName {
  @override
  final String value;
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;

  factory _$MessageName([void Function(MessageNameBuilder)? updates]) =>
      (new MessageNameBuilder()..update(updates)).build();

  _$MessageName._({required this.value, required this.syntaxSpan, this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(value, 'MessageName', 'value');
    BuiltValueNullFieldError.checkNotNull(
        syntaxSpan, 'MessageName', 'syntaxSpan');
  }

  @override
  MessageName rebuild(void Function(MessageNameBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageNameBuilder toBuilder() => new MessageNameBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageName &&
        value == other.value &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, value.hashCode), syntaxSpan.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MessageName')
          ..add('value', value)
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error))
        .toString();
  }
}

class MessageNameBuilder implements Builder<MessageName, MessageNameBuilder> {
  _$MessageName? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  SyntaxSpanBuilder? _syntaxSpan;
  SyntaxSpanBuilder get syntaxSpan =>
      _$this._syntaxSpan ??= new SyntaxSpanBuilder();
  set syntaxSpan(SyntaxSpanBuilder? syntaxSpan) =>
      _$this._syntaxSpan = syntaxSpan;

  SyntaxErrorBuilder? _error;
  SyntaxErrorBuilder get error => _$this._error ??= new SyntaxErrorBuilder();
  set error(SyntaxErrorBuilder? error) => _$this._error = error;

  MessageNameBuilder();

  MessageNameBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageName other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessageName;
  }

  @override
  void update(void Function(MessageNameBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MessageName build() {
    _$MessageName _$result;
    try {
      _$result = _$v ??
          new _$MessageName._(
              value: BuiltValueNullFieldError.checkNotNull(
                  value, 'MessageName', 'value'),
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
            'MessageName', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MessageField extends MessageField {
  @override
  final MessageFieldModifier fieldModifier;
  @override
  final MessageFieldType fieldType;
  @override
  final MessageFieldName fieldName;
  @override
  final MessageFieldIndex fieldIndex;
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;
  @override
  final EqualSign equalSign;
  @override
  final Semicolon semicolon;

  factory _$MessageField([void Function(MessageFieldBuilder)? updates]) =>
      (new MessageFieldBuilder()..update(updates)).build();

  _$MessageField._(
      {required this.fieldModifier,
      required this.fieldType,
      required this.fieldName,
      required this.fieldIndex,
      required this.syntaxSpan,
      this.error,
      required this.equalSign,
      required this.semicolon})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        fieldModifier, 'MessageField', 'fieldModifier');
    BuiltValueNullFieldError.checkNotNull(
        fieldType, 'MessageField', 'fieldType');
    BuiltValueNullFieldError.checkNotNull(
        fieldName, 'MessageField', 'fieldName');
    BuiltValueNullFieldError.checkNotNull(
        fieldIndex, 'MessageField', 'fieldIndex');
    BuiltValueNullFieldError.checkNotNull(
        syntaxSpan, 'MessageField', 'syntaxSpan');
    BuiltValueNullFieldError.checkNotNull(
        equalSign, 'MessageField', 'equalSign');
    BuiltValueNullFieldError.checkNotNull(
        semicolon, 'MessageField', 'semicolon');
  }

  @override
  MessageField rebuild(void Function(MessageFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageFieldBuilder toBuilder() => new MessageFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageField &&
        fieldModifier == other.fieldModifier &&
        fieldType == other.fieldType &&
        fieldName == other.fieldName &&
        fieldIndex == other.fieldIndex &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error &&
        equalSign == other.equalSign &&
        semicolon == other.semicolon;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, fieldModifier.hashCode),
                                fieldType.hashCode),
                            fieldName.hashCode),
                        fieldIndex.hashCode),
                    syntaxSpan.hashCode),
                error.hashCode),
            equalSign.hashCode),
        semicolon.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MessageField')
          ..add('fieldModifier', fieldModifier)
          ..add('fieldType', fieldType)
          ..add('fieldName', fieldName)
          ..add('fieldIndex', fieldIndex)
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error)
          ..add('equalSign', equalSign)
          ..add('semicolon', semicolon))
        .toString();
  }
}

class MessageFieldBuilder
    implements Builder<MessageField, MessageFieldBuilder> {
  _$MessageField? _$v;

  MessageFieldModifierBuilder? _fieldModifier;
  MessageFieldModifierBuilder get fieldModifier =>
      _$this._fieldModifier ??= new MessageFieldModifierBuilder();
  set fieldModifier(MessageFieldModifierBuilder? fieldModifier) =>
      _$this._fieldModifier = fieldModifier;

  MessageFieldTypeBuilder? _fieldType;
  MessageFieldTypeBuilder get fieldType =>
      _$this._fieldType ??= new MessageFieldTypeBuilder();
  set fieldType(MessageFieldTypeBuilder? fieldType) =>
      _$this._fieldType = fieldType;

  MessageFieldNameBuilder? _fieldName;
  MessageFieldNameBuilder get fieldName =>
      _$this._fieldName ??= new MessageFieldNameBuilder();
  set fieldName(MessageFieldNameBuilder? fieldName) =>
      _$this._fieldName = fieldName;

  MessageFieldIndexBuilder? _fieldIndex;
  MessageFieldIndexBuilder get fieldIndex =>
      _$this._fieldIndex ??= new MessageFieldIndexBuilder();
  set fieldIndex(MessageFieldIndexBuilder? fieldIndex) =>
      _$this._fieldIndex = fieldIndex;

  SyntaxSpanBuilder? _syntaxSpan;
  SyntaxSpanBuilder get syntaxSpan =>
      _$this._syntaxSpan ??= new SyntaxSpanBuilder();
  set syntaxSpan(SyntaxSpanBuilder? syntaxSpan) =>
      _$this._syntaxSpan = syntaxSpan;

  SyntaxErrorBuilder? _error;
  SyntaxErrorBuilder get error => _$this._error ??= new SyntaxErrorBuilder();
  set error(SyntaxErrorBuilder? error) => _$this._error = error;

  EqualSignBuilder? _equalSign;
  EqualSignBuilder get equalSign =>
      _$this._equalSign ??= new EqualSignBuilder();
  set equalSign(EqualSignBuilder? equalSign) => _$this._equalSign = equalSign;

  SemicolonBuilder? _semicolon;
  SemicolonBuilder get semicolon =>
      _$this._semicolon ??= new SemicolonBuilder();
  set semicolon(SemicolonBuilder? semicolon) => _$this._semicolon = semicolon;

  MessageFieldBuilder();

  MessageFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fieldModifier = $v.fieldModifier.toBuilder();
      _fieldType = $v.fieldType.toBuilder();
      _fieldName = $v.fieldName.toBuilder();
      _fieldIndex = $v.fieldIndex.toBuilder();
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _equalSign = $v.equalSign.toBuilder();
      _semicolon = $v.semicolon.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageField other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessageField;
  }

  @override
  void update(void Function(MessageFieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MessageField build() {
    _$MessageField _$result;
    try {
      _$result = _$v ??
          new _$MessageField._(
              fieldModifier: fieldModifier.build(),
              fieldType: fieldType.build(),
              fieldName: fieldName.build(),
              fieldIndex: fieldIndex.build(),
              syntaxSpan: syntaxSpan.build(),
              error: _error?.build(),
              equalSign: equalSign.build(),
              semicolon: semicolon.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fieldModifier';
        fieldModifier.build();
        _$failedField = 'fieldType';
        fieldType.build();
        _$failedField = 'fieldName';
        fieldName.build();
        _$failedField = 'fieldIndex';
        fieldIndex.build();
        _$failedField = 'syntaxSpan';
        syntaxSpan.build();
        _$failedField = 'error';
        _error?.build();
        _$failedField = 'equalSign';
        equalSign.build();
        _$failedField = 'semicolon';
        semicolon.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MessageField', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MessageFieldModifier extends MessageFieldModifier {
  @override
  final MessageFieldModifiers value;
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;

  factory _$MessageFieldModifier(
          [void Function(MessageFieldModifierBuilder)? updates]) =>
      (new MessageFieldModifierBuilder()..update(updates)).build();

  _$MessageFieldModifier._(
      {required this.value, required this.syntaxSpan, this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, 'MessageFieldModifier', 'value');
    BuiltValueNullFieldError.checkNotNull(
        syntaxSpan, 'MessageFieldModifier', 'syntaxSpan');
  }

  @override
  MessageFieldModifier rebuild(
          void Function(MessageFieldModifierBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageFieldModifierBuilder toBuilder() =>
      new MessageFieldModifierBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageFieldModifier &&
        value == other.value &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, value.hashCode), syntaxSpan.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MessageFieldModifier')
          ..add('value', value)
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error))
        .toString();
  }
}

class MessageFieldModifierBuilder
    implements Builder<MessageFieldModifier, MessageFieldModifierBuilder> {
  _$MessageFieldModifier? _$v;

  MessageFieldModifiers? _value;
  MessageFieldModifiers? get value => _$this._value;
  set value(MessageFieldModifiers? value) => _$this._value = value;

  SyntaxSpanBuilder? _syntaxSpan;
  SyntaxSpanBuilder get syntaxSpan =>
      _$this._syntaxSpan ??= new SyntaxSpanBuilder();
  set syntaxSpan(SyntaxSpanBuilder? syntaxSpan) =>
      _$this._syntaxSpan = syntaxSpan;

  SyntaxErrorBuilder? _error;
  SyntaxErrorBuilder get error => _$this._error ??= new SyntaxErrorBuilder();
  set error(SyntaxErrorBuilder? error) => _$this._error = error;

  MessageFieldModifierBuilder();

  MessageFieldModifierBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageFieldModifier other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessageFieldModifier;
  }

  @override
  void update(void Function(MessageFieldModifierBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MessageFieldModifier build() {
    _$MessageFieldModifier _$result;
    try {
      _$result = _$v ??
          new _$MessageFieldModifier._(
              value: BuiltValueNullFieldError.checkNotNull(
                  value, 'MessageFieldModifier', 'value'),
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
            'MessageFieldModifier', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MessageFieldType extends MessageFieldType {
  @override
  final MessageFieldTypes value;
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;

  factory _$MessageFieldType(
          [void Function(MessageFieldTypeBuilder)? updates]) =>
      (new MessageFieldTypeBuilder()..update(updates)).build();

  _$MessageFieldType._(
      {required this.value, required this.syntaxSpan, this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(value, 'MessageFieldType', 'value');
    BuiltValueNullFieldError.checkNotNull(
        syntaxSpan, 'MessageFieldType', 'syntaxSpan');
  }

  @override
  MessageFieldType rebuild(void Function(MessageFieldTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageFieldTypeBuilder toBuilder() =>
      new MessageFieldTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageFieldType &&
        value == other.value &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, value.hashCode), syntaxSpan.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MessageFieldType')
          ..add('value', value)
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error))
        .toString();
  }
}

class MessageFieldTypeBuilder
    implements Builder<MessageFieldType, MessageFieldTypeBuilder> {
  _$MessageFieldType? _$v;

  MessageFieldTypes? _value;
  MessageFieldTypes? get value => _$this._value;
  set value(MessageFieldTypes? value) => _$this._value = value;

  SyntaxSpanBuilder? _syntaxSpan;
  SyntaxSpanBuilder get syntaxSpan =>
      _$this._syntaxSpan ??= new SyntaxSpanBuilder();
  set syntaxSpan(SyntaxSpanBuilder? syntaxSpan) =>
      _$this._syntaxSpan = syntaxSpan;

  SyntaxErrorBuilder? _error;
  SyntaxErrorBuilder get error => _$this._error ??= new SyntaxErrorBuilder();
  set error(SyntaxErrorBuilder? error) => _$this._error = error;

  MessageFieldTypeBuilder();

  MessageFieldTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageFieldType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessageFieldType;
  }

  @override
  void update(void Function(MessageFieldTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MessageFieldType build() {
    _$MessageFieldType _$result;
    try {
      _$result = _$v ??
          new _$MessageFieldType._(
              value: BuiltValueNullFieldError.checkNotNull(
                  value, 'MessageFieldType', 'value'),
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
            'MessageFieldType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MessageFieldName extends MessageFieldName {
  @override
  final String value;
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;

  factory _$MessageFieldName(
          [void Function(MessageFieldNameBuilder)? updates]) =>
      (new MessageFieldNameBuilder()..update(updates)).build();

  _$MessageFieldName._(
      {required this.value, required this.syntaxSpan, this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(value, 'MessageFieldName', 'value');
    BuiltValueNullFieldError.checkNotNull(
        syntaxSpan, 'MessageFieldName', 'syntaxSpan');
  }

  @override
  MessageFieldName rebuild(void Function(MessageFieldNameBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageFieldNameBuilder toBuilder() =>
      new MessageFieldNameBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageFieldName &&
        value == other.value &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, value.hashCode), syntaxSpan.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MessageFieldName')
          ..add('value', value)
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error))
        .toString();
  }
}

class MessageFieldNameBuilder
    implements Builder<MessageFieldName, MessageFieldNameBuilder> {
  _$MessageFieldName? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  SyntaxSpanBuilder? _syntaxSpan;
  SyntaxSpanBuilder get syntaxSpan =>
      _$this._syntaxSpan ??= new SyntaxSpanBuilder();
  set syntaxSpan(SyntaxSpanBuilder? syntaxSpan) =>
      _$this._syntaxSpan = syntaxSpan;

  SyntaxErrorBuilder? _error;
  SyntaxErrorBuilder get error => _$this._error ??= new SyntaxErrorBuilder();
  set error(SyntaxErrorBuilder? error) => _$this._error = error;

  MessageFieldNameBuilder();

  MessageFieldNameBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageFieldName other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessageFieldName;
  }

  @override
  void update(void Function(MessageFieldNameBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MessageFieldName build() {
    _$MessageFieldName _$result;
    try {
      _$result = _$v ??
          new _$MessageFieldName._(
              value: BuiltValueNullFieldError.checkNotNull(
                  value, 'MessageFieldName', 'value'),
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
            'MessageFieldName', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MessageFieldIndex extends MessageFieldIndex {
  @override
  final int value;
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;

  factory _$MessageFieldIndex(
          [void Function(MessageFieldIndexBuilder)? updates]) =>
      (new MessageFieldIndexBuilder()..update(updates)).build();

  _$MessageFieldIndex._(
      {required this.value, required this.syntaxSpan, this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(value, 'MessageFieldIndex', 'value');
    BuiltValueNullFieldError.checkNotNull(
        syntaxSpan, 'MessageFieldIndex', 'syntaxSpan');
  }

  @override
  MessageFieldIndex rebuild(void Function(MessageFieldIndexBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageFieldIndexBuilder toBuilder() =>
      new MessageFieldIndexBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageFieldIndex &&
        value == other.value &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, value.hashCode), syntaxSpan.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MessageFieldIndex')
          ..add('value', value)
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error))
        .toString();
  }
}

class MessageFieldIndexBuilder
    implements Builder<MessageFieldIndex, MessageFieldIndexBuilder> {
  _$MessageFieldIndex? _$v;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  SyntaxSpanBuilder? _syntaxSpan;
  SyntaxSpanBuilder get syntaxSpan =>
      _$this._syntaxSpan ??= new SyntaxSpanBuilder();
  set syntaxSpan(SyntaxSpanBuilder? syntaxSpan) =>
      _$this._syntaxSpan = syntaxSpan;

  SyntaxErrorBuilder? _error;
  SyntaxErrorBuilder get error => _$this._error ??= new SyntaxErrorBuilder();
  set error(SyntaxErrorBuilder? error) => _$this._error = error;

  MessageFieldIndexBuilder();

  MessageFieldIndexBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageFieldIndex other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessageFieldIndex;
  }

  @override
  void update(void Function(MessageFieldIndexBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MessageFieldIndex build() {
    _$MessageFieldIndex _$result;
    try {
      _$result = _$v ??
          new _$MessageFieldIndex._(
              value: BuiltValueNullFieldError.checkNotNull(
                  value, 'MessageFieldIndex', 'value'),
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
            'MessageFieldIndex', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Package extends Package {
  @override
  final PackageName name;
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;
  @override
  final Keyword keyword;
  @override
  final Semicolon semicolon;

  factory _$Package([void Function(PackageBuilder)? updates]) =>
      (new PackageBuilder()..update(updates)).build();

  _$Package._(
      {required this.name,
      required this.syntaxSpan,
      this.error,
      required this.keyword,
      required this.semicolon})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'Package', 'name');
    BuiltValueNullFieldError.checkNotNull(syntaxSpan, 'Package', 'syntaxSpan');
    BuiltValueNullFieldError.checkNotNull(keyword, 'Package', 'keyword');
    BuiltValueNullFieldError.checkNotNull(semicolon, 'Package', 'semicolon');
  }

  @override
  Package rebuild(void Function(PackageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PackageBuilder toBuilder() => new PackageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Package &&
        name == other.name &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error &&
        keyword == other.keyword &&
        semicolon == other.semicolon;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, name.hashCode), syntaxSpan.hashCode),
                error.hashCode),
            keyword.hashCode),
        semicolon.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Package')
          ..add('name', name)
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error)
          ..add('keyword', keyword)
          ..add('semicolon', semicolon))
        .toString();
  }
}

class PackageBuilder implements Builder<Package, PackageBuilder> {
  _$Package? _$v;

  PackageNameBuilder? _name;
  PackageNameBuilder get name => _$this._name ??= new PackageNameBuilder();
  set name(PackageNameBuilder? name) => _$this._name = name;

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

  PackageBuilder();

  PackageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name.toBuilder();
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _keyword = $v.keyword.toBuilder();
      _semicolon = $v.semicolon.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Package other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Package;
  }

  @override
  void update(void Function(PackageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Package build() {
    _$Package _$result;
    try {
      _$result = _$v ??
          new _$Package._(
              name: name.build(),
              syntaxSpan: syntaxSpan.build(),
              error: _error?.build(),
              keyword: keyword.build(),
              semicolon: semicolon.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'name';
        name.build();
        _$failedField = 'syntaxSpan';
        syntaxSpan.build();
        _$failedField = 'error';
        _error?.build();
        _$failedField = 'keyword';
        keyword.build();
        _$failedField = 'semicolon';
        semicolon.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Package', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PackageName extends PackageName {
  @override
  final BuiltList<String> path;
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;

  factory _$PackageName([void Function(PackageNameBuilder)? updates]) =>
      (new PackageNameBuilder()..update(updates)).build();

  _$PackageName._({required this.path, required this.syntaxSpan, this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(path, 'PackageName', 'path');
    BuiltValueNullFieldError.checkNotNull(
        syntaxSpan, 'PackageName', 'syntaxSpan');
  }

  @override
  PackageName rebuild(void Function(PackageNameBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PackageNameBuilder toBuilder() => new PackageNameBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PackageName &&
        path == other.path &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, path.hashCode), syntaxSpan.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PackageName')
          ..add('path', path)
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error))
        .toString();
  }
}

class PackageNameBuilder implements Builder<PackageName, PackageNameBuilder> {
  _$PackageName? _$v;

  ListBuilder<String>? _path;
  ListBuilder<String> get path => _$this._path ??= new ListBuilder<String>();
  set path(ListBuilder<String>? path) => _$this._path = path;

  SyntaxSpanBuilder? _syntaxSpan;
  SyntaxSpanBuilder get syntaxSpan =>
      _$this._syntaxSpan ??= new SyntaxSpanBuilder();
  set syntaxSpan(SyntaxSpanBuilder? syntaxSpan) =>
      _$this._syntaxSpan = syntaxSpan;

  SyntaxErrorBuilder? _error;
  SyntaxErrorBuilder get error => _$this._error ??= new SyntaxErrorBuilder();
  set error(SyntaxErrorBuilder? error) => _$this._error = error;

  PackageNameBuilder();

  PackageNameBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _path = $v.path.toBuilder();
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PackageName other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PackageName;
  }

  @override
  void update(void Function(PackageNameBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PackageName build() {
    _$PackageName _$result;
    try {
      _$result = _$v ??
          new _$PackageName._(
              path: path.build(),
              syntaxSpan: syntaxSpan.build(),
              error: _error?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'path';
        path.build();
        _$failedField = 'syntaxSpan';
        syntaxSpan.build();
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PackageName', _$failedField, e.toString());
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
  StringLiteralBuilder get value =>
      _$this._value ??= new StringLiteralBuilder();
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

class _$ProtoX extends ProtoX {
  @override
  final BuiltList<SyntaxDeclaration> syntaxDeclarations;
  @override
  final BuiltList<Package> packages;
  @override
  final SyntaxSpan syntaxSpan;
  @override
  final SyntaxError? error;

  factory _$ProtoX([void Function(ProtoXBuilder)? updates]) =>
      (new ProtoXBuilder()..update(updates)).build();

  _$ProtoX._(
      {required this.syntaxDeclarations,
      required this.packages,
      required this.syntaxSpan,
      this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        syntaxDeclarations, 'ProtoX', 'syntaxDeclarations');
    BuiltValueNullFieldError.checkNotNull(packages, 'ProtoX', 'packages');
    BuiltValueNullFieldError.checkNotNull(syntaxSpan, 'ProtoX', 'syntaxSpan');
  }

  @override
  ProtoX rebuild(void Function(ProtoXBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProtoXBuilder toBuilder() => new ProtoXBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProtoX &&
        syntaxDeclarations == other.syntaxDeclarations &&
        packages == other.packages &&
        syntaxSpan == other.syntaxSpan &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, syntaxDeclarations.hashCode), packages.hashCode),
            syntaxSpan.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProtoX')
          ..add('syntaxDeclarations', syntaxDeclarations)
          ..add('packages', packages)
          ..add('syntaxSpan', syntaxSpan)
          ..add('error', error))
        .toString();
  }
}

class ProtoXBuilder implements Builder<ProtoX, ProtoXBuilder> {
  _$ProtoX? _$v;

  ListBuilder<SyntaxDeclaration>? _syntaxDeclarations;
  ListBuilder<SyntaxDeclaration> get syntaxDeclarations =>
      _$this._syntaxDeclarations ??= new ListBuilder<SyntaxDeclaration>();
  set syntaxDeclarations(ListBuilder<SyntaxDeclaration>? syntaxDeclarations) =>
      _$this._syntaxDeclarations = syntaxDeclarations;

  ListBuilder<Package>? _packages;
  ListBuilder<Package> get packages =>
      _$this._packages ??= new ListBuilder<Package>();
  set packages(ListBuilder<Package>? packages) => _$this._packages = packages;

  SyntaxSpanBuilder? _syntaxSpan;
  SyntaxSpanBuilder get syntaxSpan =>
      _$this._syntaxSpan ??= new SyntaxSpanBuilder();
  set syntaxSpan(SyntaxSpanBuilder? syntaxSpan) =>
      _$this._syntaxSpan = syntaxSpan;

  SyntaxErrorBuilder? _error;
  SyntaxErrorBuilder get error => _$this._error ??= new SyntaxErrorBuilder();
  set error(SyntaxErrorBuilder? error) => _$this._error = error;

  ProtoXBuilder();

  ProtoXBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _syntaxDeclarations = $v.syntaxDeclarations.toBuilder();
      _packages = $v.packages.toBuilder();
      _syntaxSpan = $v.syntaxSpan.toBuilder();
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProtoX other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProtoX;
  }

  @override
  void update(void Function(ProtoXBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProtoX build() {
    _$ProtoX _$result;
    try {
      _$result = _$v ??
          new _$ProtoX._(
              syntaxDeclarations: syntaxDeclarations.build(),
              packages: packages.build(),
              syntaxSpan: syntaxSpan.build(),
              error: _error?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'syntaxDeclarations';
        syntaxDeclarations.build();
        _$failedField = 'packages';
        packages.build();
        _$failedField = 'syntaxSpan';
        syntaxSpan.build();
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProtoX', _$failedField, e.toString());
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
