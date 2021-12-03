part of 'interface.dart';

mixin Generatable {
  Future<void> generate();
}

mixin GeneratableFileSystem on Generatable {
  io.FileSystemEntity get entity;

  @override
  Future<void> generate() async {
    await create();
  }

  Future<void> create();
}
