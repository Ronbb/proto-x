part of 'workspace.dart';

class File extends SyntaxGetter {
  final Package package;

  @override
  final List<Syntax> syntaxes = const [];

  const File({required this.package});
}
