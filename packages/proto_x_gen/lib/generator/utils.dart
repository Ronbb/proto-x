import 'package:change_case/change_case.dart';

extension StringCase on String {
  String fixCase(ChangeCaseType? caseType, [String? separator]) {
    if (caseType == null) {
      return this;
    }

    switch (caseType) {
      case ChangeCaseType.camel:
        return toCamelCase();
      case ChangeCaseType.constant:
        return toConstantCase();
      case ChangeCaseType.dot:
        return toDotCase();
      case ChangeCaseType.kebab:
        return toKebabCase();
      case ChangeCaseType.lowerFirst:
        return toLowerFirstCase();
      case ChangeCaseType.no:
        return toNoCase();
      case ChangeCaseType.pascal:
        return toPascalCase();
      case ChangeCaseType.path:
        return toPathCase(separator);
      case ChangeCaseType.sentence:
        return toSentenceCase();
      case ChangeCaseType.snake:
        return toSnakeCase();
      case ChangeCaseType.swap:
        return toSwapCase();
      case ChangeCaseType.title:
        return toTitleCase();
      case ChangeCaseType.upperFirst:
        return toUpperCase();
      case ChangeCaseType.capital:
        return toCapitalCase();
      case ChangeCaseType.header:
        return toHeaderCase();
      case ChangeCaseType.sponge:
        return toSpongeCase();
    }
  }
}
