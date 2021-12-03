part of 'interface.dart';

class Directory with Generatable, GeneratableFileSystem {
  Directory._(this.entity);

  @override
  final io.Directory entity;

  final List<File> files = [];

  factory Directory.create(Uri uri) =>
      Directory._(io.Directory(uri.toFilePath()));

  @override
  Future<void> create() async {
    if (!await entity.exists()) {
      await entity.create(recursive: true);
    }
  }
}
