part of '../syntax.dart';

abstract class SyntaxError implements Built<SyntaxError, SyntaxErrorBuilder> {
  SyntaxPosition get position;
  String get message;

  SyntaxError._();

  factory SyntaxError([void Function(SyntaxErrorBuilder) updates]) =
      _$SyntaxError;

  factory SyntaxError.withDefault() {
    return SyntaxError((builder) {
      builder
        ..message = ''
        ..position = SyntaxPosition.withDefault().toBuilder();
    });
  }
}
