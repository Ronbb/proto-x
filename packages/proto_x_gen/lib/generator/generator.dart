import 'package:proto_x_gen/interface/interface.dart';

abstract class Generator with Generatable {
  const Generator();
}

extension StringBufferX on StringBuffer {
  void writeSpace(Object? object) {
    write(object);
    write(' ');
  }

  void writeAllSpace(Iterable<dynamic> objects, [String separator = ""]) {
    writeAll(objects, separator);
    write(' ');
  }
}
