part of 'dart.dart';

class Name extends Inline {
  const Name({
    this.value = '',
    this.caseType,
    this.separator,
    this.isPrivate = false,
  });

  final String? separator;

  final ChangeCaseType? caseType;

  final bool isPrivate;

  final String value;

  bool get hasValue => value.isNotEmpty || isPrivate;

  static const empty = Name();

  @override
  String code() {
    final cased = value.fixCase(caseType, separator);
    return isPrivate ? '_$cased' : cased;
  }
}

class TypeName extends Name {
  const TypeName(
    String name, {
    bool isPrivate = false,
    this.nullable = false,
    this.genericArguments = const [],
  }) : super(
          value: name,
          isPrivate: isPrivate,
          caseType: ChangeCaseType.pascal,
        );

  static const Set<String> _builtin = {
    'num',
    'int',
    'double',
    'bool',
    'dynamic',
    'void',
  };

  final bool nullable;

  final List<TypeName> genericArguments;

  bool get hasGenericArguments => genericArguments.isNotEmpty;

  static const empty = TypeName('');

  @override
  String code() {
    final isBuiltin = _builtin.contains(value);
    var name = isBuiltin ? value : super.code();

    if (hasGenericArguments) {
      name = '$name<${genericArguments.join(', ')}>';
    }

    return nullable ? '$name?' : name;
  }
}

class DotName extends Name {
  const DotName(String name)
      : super(
          value: name,
          caseType: ChangeCaseType.dot,
        );
}

class VariableName extends Name {
  const VariableName(
    String name, {
    bool isPrivate = false,
  }) : super(
          value: name,
          caseType: ChangeCaseType.camel,
          isPrivate: isPrivate,
        );

  static const empty = VariableName('');
}

class StringLiteral extends Inline {
  const StringLiteral(
    this.value, {
    this.quotes = "'",
    this.raw = false,
    this.escape = true,
  });

  final String value;

  final bool raw;

  final bool escape;

  final String quotes;

  String get _escaped {
    if (raw || !escape) {
      return value;
    }

    return value.replaceAll(quotes, '\\$quotes');
  }

  @override
  String code() {
    final combined = '$quotes$_escaped$quotes';
    return raw ? 'r$combined' : combined;
  }
}

class Library extends Line {
  Library(String name) : name = DotName(name);

  final DotName name;

  @override
  String code() {
    return 'library $name;';
  }
}

class Import extends Line {
  Import(String name, [this.as]) : name = StringLiteral(name);

  final StringLiteral name;

  final String? as;

  bool get hasAs => as != null;

  @override
  String code() {
    final buffer = StringBuffer();

    buffer.writeSpace('import');
    buffer.write(name);
    if (hasAs) {
      buffer.writeSpace('');
      buffer.writeSpace('as');
      buffer.write(as);
    }
    buffer.write(';');

    return buffer.toString();
  }
}

class Part extends Line {
  Part(String name) : name = StringLiteral(name);

  final StringLiteral name;

  @override
  String code() {
    return "part $name;";
  }
}

class PartOf extends Line {
  PartOf(String name) : name = StringLiteral(name);

  final StringLiteral name;

  @override
  String code() {
    return "part of $name;";
  }
}

class Class extends Block {
  Class({
    required this.name,
    this.extendsFrom,
    this.mixins = const [],
    this.implementsFrom = const [],
    this.constructors = const [],
    this.factories = const [],
    this.fields = const [],
    this.methods = const [],
  });

  final TypeName name;

  final Name? extendsFrom;

  final Iterable<Name> mixins;

  final Iterable<Name> implementsFrom;

  final List<Constructor> constructors;

  final Iterable<Factory> factories;

  final Iterable<Field> fields;

  final Iterable<Method> methods;

  bool get hasConstructor => constructors.isNotEmpty;

  bool get hasExtends => extendsFrom != null;

  bool get hasMixins => mixins.isNotEmpty;

  bool get hasImplements => implementsFrom.isNotEmpty;

  @override
  Iterable<Code> children() {
    return [
      ...fields,
      ...constructors,
      ...factories,
      ...methods,
    ];
  }

  @override
  String end() {
    return '}';
  }

  @override
  String start() {
    final buffer = StringBuffer();

    buffer.writeSpace('class');
    buffer.writeSpace(name);

    if (hasExtends) {
      buffer.writeSpace('extends');
      buffer.writeSpace(extendsFrom);
    }

    if (hasMixins) {
      buffer.writeSpace('with');
      buffer.writeAllSpace(mixins, ',');
    }

    if (hasImplements) {
      buffer.writeSpace('implements');
      buffer.writeAllSpace(implementsFrom, ',');
    }

    buffer.write('{');

    return buffer.toString();
  }
}

class Constructor extends Closure {
  Constructor(
    this.className, {
    this.constructorName = VariableName.empty,
    Parameters parameters = Parameters.empty,
    this.initializedParameters = const {},
    this.isConst = true,
    Iterable<Code> content = const [],
  }) : super(
          parameters: parameters,
          content: content,
        );

  final bool isConst;

  final TypeName className;

  final VariableName constructorName;

  final Map<VariableName, Code> initializedParameters;

  bool get hasContent => content.isNotEmpty;

  bool get hasInitializedParameters => initializedParameters.isNotEmpty;

  @override
  bool get hasBody => hasContent;

  @override
  String afterParameters() {
    final buffer = StringBuffer();
    if (hasInitializedParameters) {
      buffer.write(':');

      final pairs = <String>[];

      for (final entry in initializedParameters.entries) {
        pairs.add('${entry.key} = ${entry.value}');
      }

      buffer.writeAll(pairs, ',');
    }

    return buffer.toString();
  }

  @override
  String start() {
    final buffer = StringBuffer();

    if (isConst) {
      buffer.writeSpace('const');
    }

    buffer.write(className);

    if (constructorName.hasValue) {
      buffer.write('.');
      buffer.write(constructorName);
    }

    buffer.write(super.start());

    return buffer.toString();
  }
}

class Closure extends Block {
  const Closure({
    this.parameters = Parameters.empty,
    this.arrow = false,
    this.isAsync = false,
    this.content = const [],
  });

  final Parameters parameters;

  final bool arrow;

  final Iterable<Code> content;

  final bool isAsync;

  final bool hasBody = true;

  @override
  Iterable<Code> children() {
    return content;
  }

  @override
  String end() {
    return arrow || !hasBody ? ';' : '}';
  }

  String beforeParameters() {
    return '';
  }

  String afterParameters() {
    return '';
  }

  @override
  String start() {
    final buffer = StringBuffer();

    buffer.writeSpace(beforeParameters());
    buffer.writeSpace(parameters);
    buffer.writeSpace(afterParameters());

    if (isAsync) {
      buffer.write('async');
    }

    if (arrow) {
      buffer.writeSpace('=>');
    } else {
      if (hasBody) {
        buffer.write('{');
      }
    }

    return buffer.toString();
  }
}

class Factory extends Closure {
  Factory(
    this.className,
    this.factoryName, {
    Iterable<Code> content = const [],
    bool arrow = false,
    Parameters parameters = Parameters.empty,
  }) : super(
          arrow: arrow,
          content: content,
          parameters: parameters,
          isAsync: false,
        );

  final TypeName className;

  final VariableName factoryName;

  @override
  String start() {
    return 'factory $className.$factoryName${super.start()}';
  }
}

class Field extends Line {
  Field({
    required this.name,
    this.isConst = false,
    this.isFinal = false,
    this.isStatic = false,
    this.isVariable = false,
    this.type = TypeName.empty,
  });

  final VariableName name;

  final bool isStatic;

  final bool isFinal;

  final bool isConst;

  final bool isVariable;

  final TypeName type;

  bool get hasType => type.hasValue;

  @override
  String code() {
    final buffer = StringBuffer();

    if (isStatic) {
      buffer.writeSpace('static');
    }

    if (isFinal) {
      buffer.writeSpace('final');
    }

    if (isConst) {
      buffer.writeSpace('const');
    }

    if (isVariable) {
      buffer.writeSpace('var');
    }

    if (hasType) {
      buffer.writeSpace(type);
    }

    buffer.write(name);

    buffer.write(';');

    return buffer.toString();
  }
}

class Argument extends Inline {
  const Argument(this.content);

  final Code content;

  @override
  String code() {
    return content.code();
  }
}

class NamedArgument extends Argument {
  NamedArgument(this.name, Code content) : super(content);

  final VariableName name;

  @override
  String code() {
    return '$name: $content';
  }
}

class Arguments extends Code {
  const Arguments(this.arguments);

  final Iterable<Argument> arguments;

  static const empty = Arguments([]);

  @override
  String code() {
    final buffer = StringBuffer();

    buffer.write('(');

    for (final argument in arguments) {
      buffer.write(argument);
      buffer.writeSpace(',');
    }

    buffer.write(')');

    return buffer.toString();
  }
}

class Parameter extends Inline {
  Parameter(
    this.name, {
    this.type = TypeName.empty,
    this.withThis = false,
    this.defaultValue,
  });

  final VariableName name;

  final TypeName type;

  final Code? defaultValue;

  final bool withThis;

  bool get hasType => type.hasValue;

  bool get hasDefaultValue => defaultValue != null;

  @override
  String code() {
    final buffer = StringBuffer();

    if (withThis) {
      buffer.write('this.');
    } else {
      if (hasType) {
        buffer.writeSpace(type);
      }
    }

    buffer.write(name);

    if (hasDefaultValue) {
      buffer.writeSpace('');
      buffer.writeSpace('=');
      buffer.writeSpace(defaultValue!);
    }

    return buffer.toString();
  }
}

class NamedParameter extends Parameter {
  NamedParameter(
    VariableName name, {
    bool withThis = false,
    TypeName type = TypeName.empty,
    Code? defaultValue,
    this.isRequired = false,
  }) : super(
          name,
          withThis: withThis,
          type: type,
          defaultValue: defaultValue,
        );

  final bool isRequired;

  @override
  String code() {
    final parameter = super.code();
    return isRequired ? 'required $parameter' : parameter;
  }
}

class Parameters extends Code {
  const Parameters({
    this.namedParameters = const [],
    this.requiredPositionedParameters = const [],
    this.optionalPositionedParameters = const [],
  });

  final Iterable<Parameter> requiredPositionedParameters;
  final Iterable<Parameter> optionalPositionedParameters;
  final Iterable<NamedParameter> namedParameters;

  bool get hasRequiredPositionedParameters =>
      requiredPositionedParameters.isNotEmpty;

  bool get hasOptionalPositionedParameters =>
      optionalPositionedParameters.isNotEmpty;

  bool get hasNamedParameters => namedParameters.isNotEmpty;

  static const empty = Parameters();

  @override
  String code() {
    final buffer = StringBuffer();

    buffer.write('(');

    for (final parameter in requiredPositionedParameters) {
      buffer.write(parameter);
      buffer.writeSpace(',');
    }

    if (hasOptionalPositionedParameters) {
      buffer.write('[');
      for (final parameter in optionalPositionedParameters) {
        buffer.write(parameter);
        buffer.writeSpace(',');
      }
      buffer.write(']');
    }

    if (hasNamedParameters) {
      buffer.write('{');
      for (final parameter in namedParameters) {
        buffer.write(parameter);
        buffer.writeSpace(',');
      }
      buffer.write('}');
    }

    buffer.write(')');

    return buffer.toString();
  }
}

class Method extends Closure {
  Method({
    required this.name,
    this.returnType = TypeName.empty,
    Parameters parameters = Parameters.empty,
    this.isStatic = false,
    bool arrow = false,
    bool isAsync = false,
    Iterable<Code> content = const [],
  }) : super(
          arrow: arrow,
          isAsync: isAsync,
          parameters: parameters,
          content: content,
        );

  final VariableName name;

  final TypeName returnType;

  final bool isStatic;

  bool get hasReturnType => returnType.hasValue;

  @override
  String start() {
    final buffer = StringBuffer();

    if (isStatic) {
      buffer.writeSpace('static');
    }

    if (hasReturnType) {
      buffer.writeSpace(returnType);
    }

    buffer.write(name);

    buffer.write(super.start());

    return buffer.toString();
  }
}

class Return extends Code {
  const Return(this.content);

  final Code content;

  @override
  String code() {
    return 'return $content;';
  }
}

class MapBlock extends Block {
  const MapBlock(this.entries);

  final Iterable<MapEntry<Code, Code>> entries;

  Code _entry(MapEntry<Code, Code> entry) {
    return CustomLine([
      entry.key.toString(),
      ':',
      entry.value.toString(),
      ',',
    ]);
  }

  @override
  Iterable<Code> children() {
    return entries.map(_entry);
  }

  @override
  String end() {
    return '}';
  }

  @override
  String start() {
    return '{';
  }
}
