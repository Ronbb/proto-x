import 'dart:async';

import 'package:proto_x_gen/generator/generator.dart';
import 'package:proto_x_gen/interface/interface.dart';

class DartGenerator extends Generator {
  @override
  Future<void> generate() {
    // TODO: implement generate
    throw UnimplementedError();
  }
}

class Library extends Line {
  const Library(this.name);

  final String name;

  @override
  FutureOr<String> code() {
    return 'library $name;';
  }
}

class Import extends Line {
  const Import(this.name, [this.as]);

  final String name;

  final String? as;

  bool get hasAs => as != null;

  @override
  FutureOr<String> code() {
    final buffer = StringBuffer();

    buffer.writeSpace('import');
    buffer.writeSpace('\'');
    buffer.writeSpace(name);
    buffer.writeSpace('\'');
    if (hasAs) {
      buffer.writeSpace('import');
      buffer.write(as);
    }
    buffer.write(';');

    return buffer.toString();
  }
}

class Part extends Line {
  const Part(this.name);

  final String name;

  @override
  FutureOr<String> code() {
    return "part '$name';";
  }
}

class PartOf extends Line {
  const PartOf(this.name);

  final String name;

  @override
  FutureOr<String> code() {
    return "part of '$name';";
  }
}

class Class extends Block {
  const Class({
    required this.name,
    this.extendsFrom,
    this.mixins = const [],
    this.implementsFrom = const [],
    this.fields = const [],
    this.methods = const [],
  });

  final String name;

  final String? extendsFrom;

  final List<String> mixins;

  final List<String> implementsFrom;

  final List<Field> fields;

  final List<Method> methods;

  bool get hasExtends => extendsFrom != null;

  bool get hasMixins => mixins.isNotEmpty;

  bool get hasImplements => implementsFrom.isNotEmpty;

  @override
  FutureOr<List<Code>> children() {
    return [
      ...fields,
      ...methods,
    ];
  }

  @override
  FutureOr<String> end() {
    return '}';
  }

  @override
  FutureOr<String> start() {
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

class Field extends Line {
  const Field({
    required this.name,
    this.isConst = false,
    this.isFinal = false,
    this.isStatic = false,
    this.isVariable = false,
    this.type,
  });

  final String name;

  final bool isStatic;

  final bool isFinal;

  final bool isConst;

  final bool isVariable;

  final String? type;

  bool get hasType => type != null;

  @override
  FutureOr<String> code() {
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
  const Argument(this.name, [this.type]);

  final String name;

  final String? type;

  bool get hasType => type != null;

  @override
  FutureOr<String> code() {
    final buffer = StringBuffer();

    if (hasType) {
      buffer.writeSpace(type);
    }
    buffer.write(name);

    return buffer.toString();
  }
}

class Method extends Block {
  const Method({
    required this.name,
    this.returnType,
    this.arguments = const [],
    this.content = const [],
  });

  final String name;

  final String? returnType;

  final List<Argument> arguments;

  final List<Code> content;

  bool get hasReturnType => returnType != null;

  @override
  FutureOr<List<Code>> children() {
    return content;
  }

  @override
  FutureOr<String> end() {
    return '}';
  }

  @override
  FutureOr<String> start() async {
    final buffer = StringBuffer();

    if (hasReturnType) {
      buffer.writeSpace(returnType);
    }

    buffer.write(name);

    buffer.write('(');

    buffer.writeAll(
      await Future.wait(arguments.map(
        (argument) async => await argument.code(),
      )),
      ',',
    );

    buffer.writeSpace(')');

    buffer.write('{');

    return buffer.toString();
  }
}
