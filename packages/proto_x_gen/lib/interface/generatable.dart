part of 'interface.dart';

mixin Generatable {
  Future<void> generate();
}

mixin GeneratableFileSystem on Generatable {
  io.FileSystemEntity get entity;

  @override
  Future<void> generate() async {
    await create(entity.path);
  }

  Future<void> create(String path);
}
