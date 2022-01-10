part of '../syntax.dart';

class SyntaxType extends EnumClass {
  static const SyntaxType block = _$syntaxTypeBlock;
  static const SyntaxType blockBoundary = _$syntaxTypeBlockBoundary;
  static const SyntaxType comment = _$syntaxTypeComment;
  static const SyntaxType equalSign = _$syntaxTypeEqualSign;
  static const SyntaxType keyword = _$syntaxTypeKeyword;
  static const SyntaxType message = _$syntaxTypeMessage;
  static const SyntaxType messageExtendsions = _$syntaxTypeMessageExtendsions;
  static const SyntaxType messageExtendsion = _$syntaxTypeMessageExtendsion;
  static const SyntaxType messageField = _$syntaxTypeMessageField;
  static const SyntaxType messageFieldIndex = _$syntaxTypeMessageFieldIndex;
  static const SyntaxType messageFieldModifier =
      _$syntaxTypeMessageFieldModifier;
  static const SyntaxType messageFieldName = _$syntaxTypeMessageFieldName;
  static const SyntaxType messageFieldType = _$syntaxTypeMessageFieldType;
  static const SyntaxType messageName = _$syntaxTypeMessageName;
  static const SyntaxType protoX = _$syntaxTypeProtoX;
  static const SyntaxType package = _$syntaxTypePackage;
  static const SyntaxType packageName = _$syntaxTypePackageName;
  static const SyntaxType semicolon = _$syntaxTypeSemicolon;
  static const SyntaxType stringLiteral = _$syntaxTypeStringLiteral;
  static const SyntaxType syntaxDeclaration = _$syntaxTypeSyntaxDeclaration;

  const SyntaxType._(String name) : super(name);

  static BuiltSet<SyntaxType> get values => _$values;
  static SyntaxType valueOf(String name) => _$valueOf(name);
}
