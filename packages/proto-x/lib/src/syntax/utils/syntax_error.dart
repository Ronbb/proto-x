part of '../syntax.dart';

abstract class SyntaxError implements Built<SyntaxError, SyntaxErrorBuilder> {
  SyntaxPosition get position;
  String get message;

  SyntaxError._();

  factory SyntaxError([void Function(SyntaxErrorBuilder) updates]) =
      _$SyntaxError;
}
