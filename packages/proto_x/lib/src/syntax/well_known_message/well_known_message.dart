part of '../syntax.dart';

class WellKnownMessage<T> {
  const WellKnownMessage({
    required this.name,
    required this.defaultValue,
  });

  final String name;

  final T defaultValue;
}

final List<WellKnownMessage> _wellKnownMessages = [
  WellKnownMessage<double>(
    name: 'double',
    defaultValue: 0,
  ),
  WellKnownMessage<double>(
    name: 'float',
    defaultValue: 0,
  ),
  WellKnownMessage<int>(
    name: 'int32',
    defaultValue: 0,
  ),
  WellKnownMessage<int>(
    name: 'int64',
    defaultValue: 0,
  ),
  WellKnownMessage<int>(
    name: 'uint32',
    defaultValue: 0,
  ),
  WellKnownMessage<int>(
    name: 'uint64',
    defaultValue: 0,
  ),
  WellKnownMessage<int>(
    name: 'sint32',
    defaultValue: 0,
  ),
  WellKnownMessage<int>(
    name: 'sint64',
    defaultValue: 0,
  ),
  WellKnownMessage<int>(
    name: 'fixed32',
    defaultValue: 0,
  ),
  WellKnownMessage<int>(
    name: 'fixed64',
    defaultValue: 0,
  ),
  WellKnownMessage<int>(
    name: 'sfixed32',
    defaultValue: 0,
  ),
  WellKnownMessage<int>(
    name: 'sfixed64',
    defaultValue: 0,
  ),
  WellKnownMessage<bool>(
    name: 'bool',
    defaultValue: false,
  ),
  WellKnownMessage<String>(
    name: 'string',
    defaultValue: '',
  ),
  WellKnownMessage<Uint8List>(
    name: 'bytes',
    defaultValue: Uint8List(0),
  ),
];

final _wellKnownMessageMap = Map.fromIterables(
  _wellKnownMessages.map((e) => e.name),
  _wellKnownMessages,
);

extension WellKnownMessageX on ProtoX {
  bool isWellKnown(String messageName) =>
      _wellKnownMessageMap.containsKey(messageName);

  WellKnownMessage<dynamic>? getWellKnown(String messageName) =>
      _wellKnownMessageMap[messageName];
}
