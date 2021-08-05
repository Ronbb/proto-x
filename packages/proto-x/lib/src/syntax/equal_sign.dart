part of 'syntax.dart';

abstract class EqualSign implements Built<EqualSign, EqualSignBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.equalSign;

  EqualSign._();

  factory EqualSign([void Function(EqualSignBuilder) updates]) = _$EqualSign;
}

mixin EqualSignMixin implements Syntax {
  EqualSign get equalSign;
}
