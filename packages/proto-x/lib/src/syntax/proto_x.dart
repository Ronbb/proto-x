part of 'syntax.dart';

abstract class ProtoX implements Built<ProtoX, ProtoXBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.protoX;

  BuiltList<SyntaxDeclaration> get syntaxDeclarations;

  BuiltList<Package> get packages;

  ProtoX._();

  factory ProtoX([void Function(ProtoXBuilder) updates]) = _$ProtoX;
}
