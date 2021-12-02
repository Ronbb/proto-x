part of 'interface.dart';

abstract class Code {
  const Code();

  Future<void> writeTo(File file) async {
    await file.write(await code());
  }

  FutureOr<String> code();
}

abstract class Line extends Code {
  const Line();
}

abstract class Inline extends Code {
  const Inline();
}

abstract class Block extends Code {
  const Block();

  FutureOr<String> start();

  FutureOr<String> end();

  FutureOr<List<Code>> children();

  @override
  FutureOr<String> code() async {
    final buffer = StringBuffer();

    buffer.writeln(await start());

    for (var child in (await children())) {
      buffer.writeln(await child.code());
    }

    buffer.writeln(await end());

    return buffer.toString();
  }
}
