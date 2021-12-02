part of 'syntax.dart';

abstract class Package
    with KeywordMixin, SemicolonMixin, ParentedSyntax
    implements Built<Package, PackageBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.package;

  PackageName get name;

  @override
  Iterable<Syntax?> get syntaxes => [
        keyword,
        semicolon,
        name,
      ];

  Package._();

  factory Package([void Function(PackageBuilder) updates]) = _$Package;

  factory Package.withDefault() {
    return Package((builder) {
      builder
        ..keyword = Keyword.withDefault().toBuilder()
        ..name = PackageName.withDefault().toBuilder()
        ..semicolon = Semicolon.withDefault().toBuilder();
    });
  }
}

abstract class PackageName
    implements Built<PackageName, PackageNameBuilder>, Syntax {
  @override
  SyntaxType get syntaxType => SyntaxType.packageName;

  BuiltList<String> get path;

  PackageName._();

  factory PackageName([void Function(PackageNameBuilder) updates]) =
      _$PackageName;

  factory PackageName.withDefault() {
    return PackageName((builder) {
      builder
        ..path = ListBuilder()
        ..syntaxSpan = SyntaxSpan.withDefault().toBuilder();
    });
  }
}
