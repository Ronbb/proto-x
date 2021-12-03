part of 'interface.dart';

class File with Generatable, GeneratableFileSystem {
  const File._(this.entity);

  @override
  final io.File entity;

  factory File.create(Uri uri) => File._(io.File(uri.toFilePath()));

  @override
  Future<void> create() async {
    if (await entity.exists()) {
      entity.delete();
    }
    await entity.create(recursive: true);
  }

  Future<void> write(String code) async {
    await entity.writeAsString(code, mode: io.FileMode.append);
  }
}
