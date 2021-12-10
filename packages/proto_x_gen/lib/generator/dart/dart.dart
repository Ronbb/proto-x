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

class DartGenerator extends Generator {
  const DartGenerator({
    required this.source,
    required this.target,
  });

  final $px.SourceFile source;

  final Uri target;

  Class _class($px.Message message, $px.ProtoX px) {
    final className = TypeName(message.name.value);

    return Class(
      name: className,
      fields: message.fields.map(
        (field) => Field(
          name: CamelName(field.fieldName.value),
          type: TypeName(field.fieldType.value.name),
          isFinal: true,
        ),
      ),
      constructor: Constructor(
        className,
        isConst: true,
        parameters: Parameters(
          namedParameters: message.fields.map(
            (field) => NamedParameter(
              CamelName(field.fieldName.value),
              withThis: true,
              isRequired: true,
            ),
          ),
        ),
      ),
      methods: [
        Method(
          name: CamelName('create'),
          isStatic: true,
          returnType: className,
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
                        return NamedArgument(
                          CamelName(field.fieldName.value),
                          _defaultValue(field.fieldType.value.name, px),
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
          name: CamelName('copyWith'),
          returnType: className,
          parameters: Parameters(
            namedParameters: message.fields.map(
              (field) => NamedParameter(
                CamelName(field.fieldName.value),
                type: TypeName(
                  field.fieldType.value.name,
                  nullable: true,
                ),
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
                        final fieldName = CamelName(field.fieldName.value);
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
          name: CamelName('toJson'),
          returnType: TypeName(
            'Map',
            genericArguments: [
              TypeName('String'),
              TypeName('dynamic'),
            ],
          ),
          content: [
            Return(
              MapBlock(
                message.fields.map(
                  (field) => MapEntry(
                    StringLiteral(CamelName(field.fieldName.value).toString()),
                    CustomInline(field.fieldName.value),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Code _defaultValue(String messageName, $px.ProtoX px) {
    final wellKnown = px.getWellKnown(messageName);
    if (wellKnown != null) {
      final defaultValue = wellKnown.defaultValue;

      if (defaultValue is String) {
        return StringLiteral(defaultValue);
      }

      if (defaultValue is Uint8List) {
        return CustomInline('Uint8List(0)');
      }

      return CustomInline(wellKnown.defaultValue.toString());
    }
    return CustomInline('${TypeName(messageName)}.create()');
  }

  @override
  Future<Directory> generate() async {
    final scanner = $px.SpanScanner.within(source.span(0));
    final grammar = $px.ProtoXGrammar();
    final context = $px.GrammarContext(
      scanner: scanner,
      syntax: $px.ProtoX.withDefault(),
    );

    final result = grammar.scan(context);

    if (!result) {
      throw FormatException();
    }

    final root = Directory.create(target);

    final generatedFile = File.create(
      root.entity.uri.resolve('generated.dart'),
    );

    generatedFile.create();
    root.files.add(generatedFile);

    for (final message in context.syntax.messages) {
      final generatedClass = _class(message, context.syntax);

      generatedClass.writeTo(generatedFile);
    }

    generatedFile.style();

    return root;
  }
}
