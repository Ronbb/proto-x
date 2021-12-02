part of 'interface.dart';

class Directory with Generatable, GeneratableFileSystem {
  const Directory._(this.entity);

  @override
  final io.Directory entity;

  final List<File> files = const [];

  factory Directory.create(Uri uri) => Directory._(io.Directory.fromUri(uri));

  @override
  Future<void> create(String path) async {
    await entity.create(recursive: true);
  }
}
