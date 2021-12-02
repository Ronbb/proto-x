part of 'interface.dart';

class File with Generatable, GeneratableFileSystem {
  const File._(this.entity);

  @override
  final io.File entity;

  factory File.create(Uri uri) => File._(io.File.fromUri(uri));

  @override
  Future<void> create(String path) async {
    await entity.create(recursive: true);
  }

  Future<void> write(String code) async {
    await entity.writeAsString(code, mode: io.FileMode.append);
  }
}
