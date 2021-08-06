part of 'syntax.dart';

abstract class Package
    with KeywordMixin, SemicolonMixin
    implements Built<Package, PackageBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.package;

  PackageName get name;

  Package._();

  factory Package([void Function(PackageBuilder) updates]) = _$Package;
}

abstract class PackageName
    implements Built<PackageName, PackageNameBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.packageName;

  BuiltList<String> get path;

  PackageName._();

  factory PackageName([void Function(PackageNameBuilder) updates]) =
      _$PackageName;
}
