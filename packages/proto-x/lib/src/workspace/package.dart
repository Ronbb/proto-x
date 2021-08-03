part of 'workspace.dart';

class Package extends SyntaxGetter {
  final WorkSpace workSpace;
  final Package? parent;
  final Map<String, File> files = const {};
  final Map<String, Package> packages = const {};

  @override
  List<Syntax> get syntaxes => files.values.fold(
        [],
        (result, s) => result..addAll(s.syntaxes),
      );

  const Package({
    required this.workSpace,
    required this.parent,
  });
}
