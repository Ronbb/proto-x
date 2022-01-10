part of 'interface.dart';

typedef CodeBuilder = Code Function();

typedef CodesBuilder = Iterable<Code> Function();

abstract class Code {
  const Code();

  Future<void> writeTo(File file) async {
    await file.write(_string);
  }

  String code();

  String decorate(String code) => code;

  String get _string => decorate(code());

  @override
  String toString() {
    return _string;
  }
}

abstract class Line extends Code {
  const Line();
}

abstract class Inline extends Code {
  const Inline();

  CustomLine operator +(Inline inline) {
    return CustomLine([toString(), inline.toString()]);
  }
}

abstract class Block extends Code {
  const Block();

  String start();

  String end();

  Iterable<Code> children();

  String get childrenSeparator => '\n\n';

  @override
  String code() {
    final buffer = StringBuffer();

    buffer.writeln(start());

    for (var child in children()) {
      buffer.write(child.code());
      buffer.write(childrenSeparator);
    }

    buffer.writeln(end());

    return buffer.toString();
  }
}

class CustomLine extends Line {
  const CustomLine(this.inlines, [this.separator = ' ']);

  final List<String> inlines;

  final String separator;

  @override
  String code() {
    return inlines.join(separator);
  }

  CustomLine operator +(Inline inline) {
    return CustomLine([...inlines, inline.toString()]);
  }
}

class CustomInline extends Inline {
  const CustomInline(String code) : _code = code;

  final String _code;

  @override
  String code() {
    return _code;
  }
}

class CustomBlock extends Block {
  const CustomBlock({
    CodeBuilder? start,
    CodeBuilder? end,
    CodesBuilder? children,
    String? childrenSeparator,
  })  : _start = start,
        _end = end,
        _children = children,
        _childrenSeparator = childrenSeparator;

  final CodeBuilder? _start;
  final CodeBuilder? _end;
  final CodesBuilder? _children;
  final String? _childrenSeparator;

  @override
  String get childrenSeparator => _childrenSeparator ?? super.childrenSeparator;

  @override
  Iterable<Code> children() {
    return _children?.call() ?? [];
  }

  @override
  String end() {
    return _end?.call().code() ?? '';
  }

  @override
  String start() {
    return _start?.call().code() ?? '';
  }
}
