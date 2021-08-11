part of 'syntax.dart';

abstract class ProtoX
    with ParentedSyntax
    implements Built<ProtoX, ProtoXBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.protoX;

  BuiltList<SyntaxDeclaration> get syntaxDeclarations;

  BuiltList<Package> get packages;

  BuiltList<Message> get messages;

  @override
  Iterable<Syntax?> get syntaxes => [
        ...syntaxDeclarations,
        ...packages,
        ...messages,
      ];

  ProtoX._();

  factory ProtoX([void Function(ProtoXBuilder) updates]) = _$ProtoX;

  factory ProtoX.withDefault() {
    return ProtoX();
  }
}
