import 'dart:typed_data';

import 'package:change_case/change_case.dart';
import 'package:dart_style/dart_style.dart';
import 'package:proto_x/proto_x.dart' as $px;
import 'package:proto_x_gen/generator/generator.dart';
import 'package:proto_x_gen/generator/utils.dart';
import 'package:proto_x_gen/interface/interface.dart';

part 'basic.dart';

extension StyledFile on File {
  static final formatter = DartFormatter();

  Future<void> style() async {
    final formatted = formatter.format(await entity.readAsString());
    entity.writeAsString(formatted);
  }
}

final _jsonType = TypeName(
  'Map',
  genericArguments: [
    TypeName('String'),
    TypeName('dynamic'),
  ],
);

class DartGenerator extends Generator {
  const DartGenerator({
    required this.source,
    required this.target,
  });

  final Iterable<$px.SourceFile> source;

  final Uri target;

  Class _class($px.Message message, $px.ProtoX px) {
    final className = TypeName(message.name.value);

    return Class(
      name: className,
      fields: message.fields.map(
        (field) => Field(
          name: VariableName(field.fieldName.value),
          type: _type(field),
          isFinal: true,
        ),
      ),
      constructors: [
        Constructor(
          className,
          isConst: true,
          constructorName: VariableName('all'),
          parameters: Parameters(
            namedParameters: message.fields.map(
              (field) => NamedParameter(
                VariableName(field.fieldName.value),
                withThis: true,
                isRequired: true,
              ),
            ),
          ),
        ),
        Constructor(
          className,
          isConst: true,
          parameters: Parameters(
            namedParameters: message.fields.map(
              (field) => NamedParameter(
                VariableName(field.fieldName.value),
                withThis: true,
                defaultValue: _defaultValue(_type(field), px),
              ),
            ),
          ),
        ),
      ],
      factories: [
        Factory(
          className,
          VariableName('fromJson'),
          parameters: Parameters(
            requiredPositionedParameters: [
              Parameter(
                VariableName('json'),
                type: _jsonType,
              ),
            ],
          ),
          content: [
            Return(
              CustomBlock(
                start: () {
                  return className;
                },
                end: () {
                  final jsonName = VariableName('json');
                  return Arguments(
                    message.fields.map(
                      (field) {
                        final typeName = _type(field);
                        final baseType = TypeName(field.fieldType.value);
                        final name = VariableName(field.fieldName.value);
                        final nameLiteral = StringLiteral(name.toString());
                        final jsonValue = CustomInline(
                          '$jsonName[$nameLiteral]',
                        );
                        final isRepeated = field.fieldModifier?.value ==
                            $px.MessageFieldModifiers.repeated;
                        final wellKnown = px.getWellKnown(baseType.value);

                        Inline value = jsonValue;

                        Inline appendBaseDefault(Inline value) {
                          return CustomInline(
                            '$value ?? ${_defaultJsonValue(baseType, px)}',
                          );
                        }

                        Inline fixByType(Inline value) {
                          if (wellKnown != null) {
                            if (wellKnown.name.endsWith('64')) {
                              return CustomInline('Int64.parseInt($value)');
                            }
                          } else {
                            return CustomInline(
                              '$baseType.fromJson($value)',
                            );
                          }

                          return value;
                        }

                        if (isRepeated) {
                          value = CustomInline(
                            '''List.unmodifiable(
                                $jsonValue?.map((v) => ${fixByType(appendBaseDefault(CustomInline('v')))})
                                ?? const []
                            )
                            ''',
                          );
                        } else {
                          value = fixByType(appendBaseDefault(value));
                        }

                        return NamedArgument(name, value);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        )
      ],
      methods: [
        Method(
          name: VariableName('copyWith'),
          returnType: className,
          parameters: Parameters(
            namedParameters: message.fields.map(
              (field) => NamedParameter(
                VariableName(field.fieldName.value),
                type: _type(field, nullable: true),
              ),
            ),
          ),
          content: [
            Return(
              CustomBlock(
                start: () {
                  return className;
                },
                end: () {
                  return Arguments(
                    message.fields.map(
                      (field) {
                        final fieldName = VariableName(field.fieldName.value);
                        return NamedArgument(
                          fieldName,
                          CustomInline(
                            '$fieldName ?? this.$fieldName',
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Method(
          name: VariableName('toJson'),
          returnType: _jsonType,
          content: [
            Return(
              MapBlock(
                message.fields.map(
                  (field) {
                    final name = VariableName(field.fieldName.value);
                    return MapEntry(
                      StringLiteral(name.toString()),
                      name,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Inline _defaultValue(TypeName typeName, $px.ProtoX px) {
    if (typeName.value.toLowerCase() == 'list') {
      return CustomInline('const []');
    }

    final wellKnown = px.getWellKnown(typeName.value);
    if (wellKnown != null) {
      final type = wellKnown.name;
      final defaultValue = wellKnown.defaultValue;

      if (defaultValue is $px.StringLiteral) {
        return StringLiteral(defaultValue.string);
      }

      if (defaultValue is int && type.endsWith('64')) {
        return CustomInline('Int64.ZERO');
      }

      if (defaultValue is Uint8List) {
        return CustomInline('Uint8List(0)');
      }

      return CustomInline(wellKnown.defaultValue.toString());
    }
    return CustomInline('const $typeName()');
  }

  Inline _defaultJsonValue(TypeName typeName, $px.ProtoX px) {
    if (typeName.value.toLowerCase() == 'list') {
      return CustomInline('const []');
    }

    final wellKnown = px.getWellKnown(typeName.value);
    if (wellKnown != null) {
      final type = wellKnown.name;
      final defaultValue = wellKnown.defaultValue;

      if (defaultValue is $px.StringLiteral) {
        return StringLiteral(defaultValue.string);
      }

      if (defaultValue is int && type.endsWith('64')) {
        return StringLiteral('');
      }

      if (defaultValue is Uint8List) {
        return CustomInline('Uint8List(0)');
      }

      return CustomInline(wellKnown.defaultValue.toString());
    }
    return CustomInline('const {}');
  }

  TypeName _type($px.MessageField field, {bool nullable = false}) {
    final isRepeated =
        field.fieldModifier?.value == $px.MessageFieldModifiers.repeated;
    final base = TypeName(
      field.fieldType.value,
      nullable: !isRepeated && nullable,
    );
    if (isRepeated) {
      return TypeName('List', genericArguments: [base], nullable: nullable);
    }
    return base;
  }

  $px.GrammarContext<$px.ProtoX> _one($px.SourceFile source) {
    final scanner = $px.SpanScanner.within(source.span(0));
    final grammar = $px.ProtoXGrammar();
    final context = $px.GrammarContext(
      scanner: scanner,
      syntax: $px.ProtoX.withDefault(),
    );

    final result = grammar.scan(context);

    if (!result) {
      throw FormatException(context.scanner.location.toolString);
    }

    return context;
  }

  @override
  Future<Directory> generate() async {
    final contexts = source.map(_one);

    final root = Directory.create(target);
    await root.create();

    final generatedFile = File.create(
      root.entity.uri.resolve('generated.dart'),
    );

    await generatedFile.create();
    root.files.add(generatedFile);

    final fixnum = Import('package:fixnum/fixnum.dart');
    await fixnum.writeTo(generatedFile);

    for (final context in contexts) {
      print('context: ' + context.scanner.location.toolString);
      for (final message in context.syntax.messages) {
        print('message: ' + message.name.value);
        final generatedClass = _class(message, context.syntax);

        await generatedClass.writeTo(generatedFile);
      }
    }

    await generatedFile.style();

    return root;
  }
}
