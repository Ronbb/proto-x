import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:json_rpc_2/json_rpc_2.dart';

part 'interface.g.dart';

@SerializersFor([
  ServerCapabilities,
  ClientCapabilities,
  TextDocumentClientCapabilities,
  SynchronizationCapabilities,
  HoverCapabilities,
  WorkspaceClientCapabilities,
  DynamicRegistrationCapability,
  CodeActionCapabilities,
  CodeActionLiteralSupport,
  CodeActionKinds,
  CompletionCapabilities,
  CompletionItemCapabilities,
  CompletionOptions,
  DocumentLinkOptions,
  DocumentOnTypeFormattingOptions,
  ExecuteCommandOptions,
  SignatureHelpOptions,
  TextDocumentSyncOptions,
  TextDocumentSyncKind,
  SaveOptions,
  TextDocumentItem,
  VersionedTextDocumentIdentifier,
  TextDocumentContentChangeEvent,
  Range,
  Position,
  TextDocumentIdentifier,
  CompletionList,
  TextEdit,
  Command,
  InsertTextFormat,
  CompletionItemKind,
  Location,
  ReferenceContext,
  DocumentHighlight,
  DocumentHighlightKind,
  SymbolInformation,
  SymbolKind,
  CodeActionContext,
  Diagnostic,
  WorkspaceEdit,
  Diagnostics,
  ApplyWorkspaceEditParams,
  ShowMessageParams,
  MessageType,
])
final Serializers _serializers = _$_serializers;
final Serializers serializers =
    (_serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

abstract class ServerCapabilities
    implements Built<ServerCapabilities, ServerCapabilitiesBuilder> {
  bool get codeActionProvider;

  CodeLensOptions get codeLensProvider;

  CompletionOptions get completionProvider;

  bool get definitionProvider;

  bool get documentFormattingProvider;

  bool get documentHighlightProvider;

  DocumentLinkOptions get documentLinkProvider;

  DocumentOnTypeFormattingOptions get documentOnTypeFormattingProvider;

  bool get documentRangeFormattingProvider;

  bool get documentSymbolProvider;

  ExecuteCommandOptions get executeCommandProvider;

  bool get hoverProvider;

  bool get implementationProvider;

  bool get referencesProvider;

  bool get renameProvider;

  SignatureHelpOptions get signatureHelpProvider;

  TextDocumentSyncOptions get textDocumentSync;

  bool get workspaceSymbolProvider;

  ServerCapabilities._();

  static Serializer<ServerCapabilities> get serializer =>
      _$serverCapabilitiesSerializer;

  factory ServerCapabilities(
          [void Function(ServerCapabilitiesBuilder) updates]) =
      _$ServerCapabilities;
}

abstract class ClientCapabilities
    implements Built<ClientCapabilities, ClientCapabilitiesBuilder> {
  TextDocumentClientCapabilities get textDocument;

  WorkspaceClientCapabilities get workspace;

  ClientCapabilities._();

  factory ClientCapabilities(
          [void Function(ClientCapabilitiesBuilder)? updates]) =
      _$ClientCapabilities;

  String toJson() {
    return json
        .encode(serializers.serializeWith(ClientCapabilities.serializer, this));
  }

  static ClientCapabilities? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ClientCapabilities.serializer, json.decode(jsonString));
  }

  static Serializer<ClientCapabilities> get serializer =>
      _$clientCapabilitiesSerializer;
}

abstract class TextDocumentClientCapabilities
    implements
        Built<TextDocumentClientCapabilities,
            TextDocumentClientCapabilitiesBuilder> {
  // Fields

  CodeActionCapabilities get codeAction;

  DynamicRegistrationCapability get codeLens;

  CompletionCapabilities get completion;

  DynamicRegistrationCapability get definition;

  DynamicRegistrationCapability get documentHighlight;

  DynamicRegistrationCapability get documentLink;

  DynamicRegistrationCapability get documentSymbol;

  DynamicRegistrationCapability get formatting;

  HoverCapabilities get hover;

  DynamicRegistrationCapability get onTypeFormatting;

  DynamicRegistrationCapability get references;

  DynamicRegistrationCapability get rename;

  SynchronizationCapabilities get synchronization;

  TextDocumentClientCapabilities._();

  factory TextDocumentClientCapabilities(
          [void Function(TextDocumentClientCapabilitiesBuilder) updates]) =
      _$TextDocumentClientCapabilities;

  String toJson() {
    return json.encode(serializers.serializeWith(
        TextDocumentClientCapabilities.serializer, this));
  }

  static TextDocumentClientCapabilities? fromJson(String jsonString) {
    return serializers.deserializeWith(
        TextDocumentClientCapabilities.serializer, json.decode(jsonString));
  }

  static Serializer<TextDocumentClientCapabilities> get serializer =>
      _$textDocumentClientCapabilitiesSerializer;
}

abstract class SynchronizationCapabilities
    implements
        Built<SynchronizationCapabilities, SynchronizationCapabilitiesBuilder> {
  bool get didSave;

  bool get dynamicRegistration;

  bool get willSave;

  bool get willSaveWaitUntil;

  SynchronizationCapabilities._();

  factory SynchronizationCapabilities(
          [void Function(SynchronizationCapabilitiesBuilder) updates]) =
      _$SynchronizationCapabilities;

  String toJson() {
    return json.encode(serializers.serializeWith(
        SynchronizationCapabilities.serializer, this));
  }

  static SynchronizationCapabilities? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SynchronizationCapabilities.serializer, json.decode(jsonString));
  }

  static Serializer<SynchronizationCapabilities> get serializer =>
      _$synchronizationCapabilitiesSerializer;
}

abstract class HoverCapabilities
    implements Built<HoverCapabilities, HoverCapabilitiesBuilder> {
  List<String> get contentFormat;

  bool get dynamicRegistration;

  HoverCapabilities._();

  factory HoverCapabilities([void Function(HoverCapabilitiesBuilder) updates]) =
      _$HoverCapabilities;

  String toJson() {
    return json
        .encode(serializers.serializeWith(HoverCapabilities.serializer, this));
  }

  static HoverCapabilities? fromJson(String jsonString) {
    return serializers.deserializeWith(
        HoverCapabilities.serializer, json.decode(jsonString));
  }

  static Serializer<HoverCapabilities> get serializer =>
      _$hoverCapabilitiesSerializer;
}

abstract class WorkspaceClientCapabilities
    implements
        Built<WorkspaceClientCapabilities, WorkspaceClientCapabilitiesBuilder> {
  bool get applyEdit;

  DynamicRegistrationCapability get didChangeConfiguration;

  DynamicRegistrationCapability get didChangeWatchedFiles;

  DynamicRegistrationCapability get executeCommand;

  DynamicRegistrationCapability get symbol;

  WorkspaceClientCapabilities._();

  factory WorkspaceClientCapabilities(
          [void Function(WorkspaceClientCapabilitiesBuilder) updates]) =
      _$WorkspaceClientCapabilities;

  String toJson() {
    return json.encode(serializers.serializeWith(
        WorkspaceClientCapabilities.serializer, this));
  }

  static WorkspaceClientCapabilities? fromJson(String jsonString) {
    return serializers.deserializeWith(
        WorkspaceClientCapabilities.serializer, json.decode(jsonString));
  }

  static Serializer<WorkspaceClientCapabilities> get serializer =>
      _$workspaceClientCapabilitiesSerializer;
}

abstract class DynamicRegistrationCapability
    implements
        Built<DynamicRegistrationCapability,
            DynamicRegistrationCapabilityBuilder> {
  bool get dynamicRegistration;

  DynamicRegistrationCapability._();

  factory DynamicRegistrationCapability(
          [void Function(DynamicRegistrationCapabilityBuilder) updates]) =
      _$DynamicRegistrationCapability;

  String toJson() {
    return json.encode(serializers.serializeWith(
        DynamicRegistrationCapability.serializer, this));
  }

  static DynamicRegistrationCapability? fromJson(String jsonString) {
    return serializers.deserializeWith(
        DynamicRegistrationCapability.serializer, json.decode(jsonString));
  }

  static Serializer<DynamicRegistrationCapability> get serializer =>
      _$dynamicRegistrationCapabilitySerializer;
}

abstract class CodeActionCapabilities
    implements Built<CodeActionCapabilities, CodeActionCapabilitiesBuilder> {
  CodeActionLiteralSupport get codeActionLiteralSupport;

  bool get dynamicRegistration;

  CodeActionCapabilities._();

  factory CodeActionCapabilities(
          [void Function(CodeActionCapabilitiesBuilder) updates]) =
      _$CodeActionCapabilities;

  String toJson() {
    return json.encode(
        serializers.serializeWith(CodeActionCapabilities.serializer, this));
  }

  static CodeActionCapabilities? fromJson(String jsonString) {
    return serializers.deserializeWith(
        CodeActionCapabilities.serializer, json.decode(jsonString));
  }

  static Serializer<CodeActionCapabilities> get serializer =>
      _$codeActionCapabilitiesSerializer;
}

abstract class CodeActionLiteralSupport
    implements
        Built<CodeActionLiteralSupport, CodeActionLiteralSupportBuilder> {
  CodeActionKinds get codeActionKind;

  CodeActionLiteralSupport._();

  factory CodeActionLiteralSupport(
          [void Function(CodeActionLiteralSupportBuilder) updates]) =
      _$CodeActionLiteralSupport;

  String toJson() {
    return json.encode(
        serializers.serializeWith(CodeActionLiteralSupport.serializer, this));
  }

  static CodeActionLiteralSupport? fromJson(String jsonString) {
    return serializers.deserializeWith(
        CodeActionLiteralSupport.serializer, json.decode(jsonString));
  }

  static Serializer<CodeActionLiteralSupport> get serializer =>
      _$codeActionLiteralSupportSerializer;
}

abstract class CodeActionKinds
    implements Built<CodeActionKinds, CodeActionKindsBuilder> {
  List<String> get valueSet;

  CodeActionKinds._();

  factory CodeActionKinds([void Function(CodeActionKindsBuilder) updates]) =
      _$CodeActionKinds;

  String toJson() {
    return json
        .encode(serializers.serializeWith(CodeActionKinds.serializer, this));
  }

  static CodeActionKinds? fromJson(String jsonString) {
    return serializers.deserializeWith(
        CodeActionKinds.serializer, json.decode(jsonString));
  }

  static Serializer<CodeActionKinds> get serializer =>
      _$codeActionKindsSerializer;
}

abstract class CompletionCapabilities
    implements Built<CompletionCapabilities, CompletionCapabilitiesBuilder> {
  CompletionItemCapabilities get completionItem;

  bool get dynamicRegistration;

  CompletionCapabilities._();

  factory CompletionCapabilities(
          [void Function(CompletionCapabilitiesBuilder) updates]) =
      _$CompletionCapabilities;

  String toJson() {
    return json.encode(
        serializers.serializeWith(CompletionCapabilities.serializer, this));
  }

  static CompletionCapabilities? fromJson(String jsonString) {
    return serializers.deserializeWith(
        CompletionCapabilities.serializer, json.decode(jsonString));
  }

  static Serializer<CompletionCapabilities> get serializer =>
      _$completionCapabilitiesSerializer;
}

abstract class CompletionItemCapabilities
    implements
        Built<CompletionItemCapabilities, CompletionItemCapabilitiesBuilder> {
  bool get snippetSupport;

  CompletionItemCapabilities._();

  factory CompletionItemCapabilities(
          [void Function(CompletionItemCapabilitiesBuilder) updates]) =
      _$CompletionItemCapabilities;

  String toJson() {
    return json.encode(
        serializers.serializeWith(CompletionItemCapabilities.serializer, this));
  }

  static CompletionItemCapabilities? fromJson(String jsonString) {
    return serializers.deserializeWith(
        CompletionItemCapabilities.serializer, json.decode(jsonString));
  }

  static Serializer<CompletionItemCapabilities> get serializer =>
      _$completionItemCapabilitiesSerializer;
}

abstract class CodeLensOptions
    implements Built<CodeLensOptions, CodeLensOptionsBuilder> {
  bool get resolveProvider;

  CodeLensOptions._();

  factory CodeLensOptions([void Function(CodeLensOptionsBuilder) updates]) =
      _$CodeLensOptions;

  String toJson() {
    return json
        .encode(serializers.serializeWith(CodeLensOptions.serializer, this));
  }

  static CodeLensOptions? fromJson(String jsonString) {
    return serializers.deserializeWith(
        CodeLensOptions.serializer, json.decode(jsonString));
  }

  static Serializer<CodeLensOptions> get serializer =>
      _$codeLensOptionsSerializer;
}

abstract class CompletionOptions
    implements Built<CompletionOptions, CompletionOptionsBuilder> {
  bool get resolveProvider;

  List<String> get triggerCharacters;

  CompletionOptions._();

  factory CompletionOptions([void Function(CompletionOptionsBuilder) updates]) =
      _$CompletionOptions;

  String toJson() {
    return json
        .encode(serializers.serializeWith(CompletionOptions.serializer, this));
  }

  static CompletionOptions? fromJson(String jsonString) {
    return serializers.deserializeWith(
        CompletionOptions.serializer, json.decode(jsonString));
  }

  static Serializer<CompletionOptions> get serializer =>
      _$completionOptionsSerializer;
}

abstract class DocumentLinkOptions
    implements Built<DocumentLinkOptions, DocumentLinkOptionsBuilder> {
  bool get resolveProvider;

  DocumentLinkOptions._();

  factory DocumentLinkOptions(
          [void Function(DocumentLinkOptionsBuilder) updates]) =
      _$DocumentLinkOptions;

  String toJson() {
    return json.encode(
        serializers.serializeWith(DocumentLinkOptions.serializer, this));
  }

  static DocumentLinkOptions? fromJson(String jsonString) {
    return serializers.deserializeWith(
        DocumentLinkOptions.serializer, json.decode(jsonString));
  }

  static Serializer<DocumentLinkOptions> get serializer =>
      _$documentLinkOptionsSerializer;
}

abstract class DocumentOnTypeFormattingOptions
    implements
        Built<DocumentOnTypeFormattingOptions,
            DocumentOnTypeFormattingOptionsBuilder> {
  String get firstTriggerCharacter;

  List<String> get moreTriggerCharacter;

  DocumentOnTypeFormattingOptions._();

  factory DocumentOnTypeFormattingOptions(
          [void Function(DocumentOnTypeFormattingOptionsBuilder) updates]) =
      _$DocumentOnTypeFormattingOptions;

  String toJson() {
    return json.encode(serializers.serializeWith(
        DocumentOnTypeFormattingOptions.serializer, this));
  }

  static DocumentOnTypeFormattingOptions? fromJson(String jsonString) {
    return serializers.deserializeWith(
        DocumentOnTypeFormattingOptions.serializer, json.decode(jsonString));
  }

  static Serializer<DocumentOnTypeFormattingOptions> get serializer =>
      _$documentOnTypeFormattingOptionsSerializer;
}

abstract class ExecuteCommandOptions
    implements Built<ExecuteCommandOptions, ExecuteCommandOptionsBuilder> {
  List<String> get commands;

  ExecuteCommandOptions._();

  factory ExecuteCommandOptions(
          [void Function(ExecuteCommandOptionsBuilder) updates]) =
      _$ExecuteCommandOptions;

  String toJson() {
    return json.encode(
        serializers.serializeWith(ExecuteCommandOptions.serializer, this));
  }

  static ExecuteCommandOptions? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ExecuteCommandOptions.serializer, json.decode(jsonString));
  }

  static Serializer<ExecuteCommandOptions> get serializer =>
      _$executeCommandOptionsSerializer;
}

abstract class SignatureHelpOptions
    implements Built<SignatureHelpOptions, SignatureHelpOptionsBuilder> {
  List<String> get triggerCharacters;

  SignatureHelpOptions._();

  factory SignatureHelpOptions(
          [void Function(SignatureHelpOptionsBuilder) updates]) =
      _$SignatureHelpOptions;

  String toJson() {
    return json.encode(
        serializers.serializeWith(SignatureHelpOptions.serializer, this));
  }

  static SignatureHelpOptions? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SignatureHelpOptions.serializer, json.decode(jsonString));
  }

  static Serializer<SignatureHelpOptions> get serializer =>
      _$signatureHelpOptionsSerializer;
}

abstract class TextDocumentSyncOptions
    implements Built<TextDocumentSyncOptions, TextDocumentSyncOptionsBuilder> {
  TextDocumentSyncKind get change;

  bool get openClose;

  SaveOptions get save;

  bool get willSave;

  bool get willSaveWaitUntil;

  TextDocumentSyncOptions._();

  factory TextDocumentSyncOptions(
          [void Function(TextDocumentSyncOptionsBuilder) updates]) =
      _$TextDocumentSyncOptions;

  String toJson() {
    return json.encode(
        serializers.serializeWith(TextDocumentSyncOptions.serializer, this));
  }

  static TextDocumentSyncOptions? fromJson(String jsonString) {
    return serializers.deserializeWith(
        TextDocumentSyncOptions.serializer, json.decode(jsonString));
  }

  static Serializer<TextDocumentSyncOptions> get serializer =>
      _$textDocumentSyncOptionsSerializer;
}

class TextDocumentSyncKind extends EnumClass {
  @BuiltValueEnumConst(wireNumber: 1)
  static const TextDocumentSyncKind full = _$TextDocumentSyncKindFull;
  @BuiltValueEnumConst(wireNumber: 2)
  static const TextDocumentSyncKind incremental =
      _$TextDocumentSyncKindIncremental;
  @BuiltValueEnumConst(wireNumber: 0)
  static const TextDocumentSyncKind none = _$TextDocumentSyncKindNone;

  const TextDocumentSyncKind._(String name) : super(name);

  static BuiltSet<TextDocumentSyncKind> get values =>
      _$TextDocumentSyncKindValues;
  static TextDocumentSyncKind valueOf(String name) =>
      _$TextDocumentSyncKindValueOf(name);
  static Serializer<TextDocumentSyncKind> get serializer =>
      _$textDocumentSyncKindSerializer;
}

abstract class SaveOptions implements Built<SaveOptions, SaveOptionsBuilder> {
  bool get includeText;

  SaveOptions._();

  factory SaveOptions([void Function(SaveOptionsBuilder) updates]) =
      _$SaveOptions;

  String toJson() {
    return json.encode(serializers.serializeWith(SaveOptions.serializer, this));
  }

  static SaveOptions? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SaveOptions.serializer, json.decode(jsonString));
  }

  static Serializer<SaveOptions> get serializer => _$saveOptionsSerializer;
}

abstract class TextDocumentItem
    implements Built<TextDocumentItem, TextDocumentItemBuilder> {
  String get languageId;

  String get text;

  String get uri;

  int get version;

  TextDocumentItem._();

  factory TextDocumentItem([void Function(TextDocumentItemBuilder) updates]) =
      _$TextDocumentItem;

  String toJson() {
    return json
        .encode(serializers.serializeWith(TextDocumentItem.serializer, this));
  }

  static TextDocumentItem? fromJson(String jsonString) {
    return serializers.deserializeWith(
        TextDocumentItem.serializer, json.decode(jsonString));
  }

  static Serializer<TextDocumentItem> get serializer =>
      _$textDocumentItemSerializer;
}

abstract class VersionedTextDocumentIdentifier
    implements
        Built<VersionedTextDocumentIdentifier,
            VersionedTextDocumentIdentifierBuilder> {
  String get uri;

  int get version;

  VersionedTextDocumentIdentifier._();

  factory VersionedTextDocumentIdentifier(
          [void Function(VersionedTextDocumentIdentifierBuilder) updates]) =
      _$VersionedTextDocumentIdentifier;

  String toJson() {
    return json.encode(serializers.serializeWith(
        VersionedTextDocumentIdentifier.serializer, this));
  }

  static VersionedTextDocumentIdentifier? fromJson(String jsonString) {
    return serializers.deserializeWith(
        VersionedTextDocumentIdentifier.serializer, json.decode(jsonString));
  }

  static Serializer<VersionedTextDocumentIdentifier> get serializer =>
      _$versionedTextDocumentIdentifierSerializer;
}

abstract class TextDocumentContentChangeEvent
    implements
        Built<TextDocumentContentChangeEvent,
            TextDocumentContentChangeEventBuilder> {
  Range get range;

  int get rangeLength;

  String get text;

  TextDocumentContentChangeEvent._();

  factory TextDocumentContentChangeEvent(
          [void Function(TextDocumentContentChangeEventBuilder) updates]) =
      _$TextDocumentContentChangeEvent;

  String toJson() {
    return json.encode(serializers.serializeWith(
        TextDocumentContentChangeEvent.serializer, this));
  }

  static TextDocumentContentChangeEvent? fromJson(String jsonString) {
    return serializers.deserializeWith(
        TextDocumentContentChangeEvent.serializer, json.decode(jsonString));
  }

  static Serializer<TextDocumentContentChangeEvent> get serializer =>
      _$textDocumentContentChangeEventSerializer;
}

abstract class Range implements Built<Range, RangeBuilder> {
  Position get end;

  Position get start;

  Range._();

  factory Range([void Function(RangeBuilder) updates]) = _$Range;

  String toJson() {
    return json.encode(serializers.serializeWith(Range.serializer, this));
  }

  static Range? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Range.serializer, json.decode(jsonString));
  }

  static Serializer<Range> get serializer => _$rangeSerializer;
}

abstract class Position implements Built<Position, PositionBuilder> {
  int get character;

  int get line;

  Position._();

  factory Position([void Function(PositionBuilder) updates]) = _$Position;

  String toJson() {
    return json.encode(serializers.serializeWith(Position.serializer, this));
  }

  static Position? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Position.serializer, json.decode(jsonString));
  }

  static Serializer<Position> get serializer => _$positionSerializer;
}

abstract class TextDocumentIdentifier
    implements Built<TextDocumentIdentifier, TextDocumentIdentifierBuilder> {
  String get uri;

  TextDocumentIdentifier._();

  factory TextDocumentIdentifier(
          [void Function(TextDocumentIdentifierBuilder) updates]) =
      _$TextDocumentIdentifier;

  String toJson() {
    return json.encode(
        serializers.serializeWith(TextDocumentIdentifier.serializer, this));
  }

  static TextDocumentIdentifier? fromJson(String jsonString) {
    return serializers.deserializeWith(
        TextDocumentIdentifier.serializer, json.decode(jsonString));
  }

  static Serializer<TextDocumentIdentifier> get serializer =>
      _$textDocumentIdentifierSerializer;
}

abstract class CompletionList
    implements Built<CompletionList, CompletionListBuilder> {
  bool get isIncomplete;

  List<CompletionItem> get items;

  CompletionList._();

  factory CompletionList([void Function(CompletionListBuilder) updates]) =
      _$CompletionList;

  String toJson() {
    return json
        .encode(serializers.serializeWith(CompletionList.serializer, this));
  }

  static CompletionList? fromJson(String jsonString) {
    return serializers.deserializeWith(
        CompletionList.serializer, json.decode(jsonString));
  }

  static Serializer<CompletionList> get serializer =>
      _$completionListSerializer;
}

abstract class CompletionItem
    implements Built<CompletionItem, CompletionItemBuilder> {
  BuiltList<TextEdit> get additionalTextEdits;

  Command get command;

  BuiltMap get data;

  String get detail;

  String get documentation;

  String get filterText;

  String get insertText;

  InsertTextFormat get insertTextFormat;

  CompletionItemKind get kind;

  String get label;

  String get sortText;

  TextEdit get textEdit;

  CompletionItem._();

  factory CompletionItem([void Function(CompletionItemBuilder) updates]) =
      _$CompletionItem;

  String toJson() {
    return json
        .encode(serializers.serializeWith(CompletionItem.serializer, this));
  }

  static CompletionItem? fromJson(String jsonString) {
    return serializers.deserializeWith(
        CompletionItem.serializer, json.decode(jsonString));
  }

  static Serializer<CompletionItem> get serializer =>
      _$completionItemSerializer;
}

abstract class TextEdit implements Built<TextEdit, TextEditBuilder> {
  String get newText;

  Range get range;

  TextEdit._();

  factory TextEdit([void Function(TextEditBuilder) updates]) = _$TextEdit;

  String toJson() {
    return json.encode(serializers.serializeWith(TextEdit.serializer, this));
  }

  static TextEdit? fromJson(String jsonString) {
    return serializers.deserializeWith(
        TextEdit.serializer, json.decode(jsonString));
  }

  static Serializer<TextEdit> get serializer => _$textEditSerializer;
}

abstract class Command implements Built<Command, CommandBuilder> {
  BuiltList<dynamic> get arguments;

  String get command;

  String get title;

  Command._();

  factory Command([void Function(CommandBuilder) updates]) = _$Command;

  String toJson() {
    return json.encode(serializers.serializeWith(Command.serializer, this));
  }

  static Command? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Command.serializer, json.decode(jsonString));
  }

  static Serializer<Command> get serializer => _$commandSerializer;
}

class InsertTextFormat extends EnumClass {
  @BuiltValueEnumConst(wireNumber: 1)
  static const InsertTextFormat plainText = _$InsertTextFormatPlainText;

  @BuiltValueEnumConst(wireNumber: 2)
  static const InsertTextFormat snippet = _$InsertTextFormatSnippet;

  const InsertTextFormat._(String name) : super(name);

  static BuiltSet<InsertTextFormat> get values => _$InsertTextFormatValues;
  static InsertTextFormat valueOf(String name) =>
      _$InsertTextFormatValueOf(name);
  static Serializer<InsertTextFormat> get serializer =>
      _$insertTextFormatSerializer;
}

class CompletionItemKind extends EnumClass {
  @BuiltValueEnumConst(wireNumber: 7)
  static const CompletionItemKind classKind = _$CompletionItemKindClassKind;

  @BuiltValueEnumConst(wireNumber: 16)
  static const CompletionItemKind color = _$CompletionItemKindColor;

  @BuiltValueEnumConst(wireNumber: 4)
  static const CompletionItemKind constructor = _$CompletionItemKindConstructor;

  @BuiltValueEnumConst(wireNumber: 13)
  static const CompletionItemKind enumKind = _$CompletionItemKindEnumKind;

  @BuiltValueEnumConst(wireNumber: 5)
  static const CompletionItemKind field = _$CompletionItemKindField;

  @BuiltValueEnumConst(wireNumber: 17)
  static const CompletionItemKind file = _$CompletionItemKindFile;

  @BuiltValueEnumConst(wireNumber: 3)
  static const CompletionItemKind function = _$CompletionItemKindFunction;

  @BuiltValueEnumConst(wireNumber: 8)
  static const CompletionItemKind interface = _$CompletionItemKindInterface;

  @BuiltValueEnumConst(wireNumber: 14)
  static const CompletionItemKind keyword = _$CompletionItemKindKeyword;

  @BuiltValueEnumConst(wireNumber: 2)
  static const CompletionItemKind method = _$CompletionItemKindMethod;

  @BuiltValueEnumConst(wireNumber: 9)
  static const CompletionItemKind module = _$CompletionItemKindModule;

  @BuiltValueEnumConst(wireNumber: 10)
  static const CompletionItemKind property = _$CompletionItemKindProperty;

  @BuiltValueEnumConst(wireNumber: 18)
  static const CompletionItemKind reference = _$CompletionItemKindReference;

  @BuiltValueEnumConst(wireNumber: 15)
  static const CompletionItemKind snippet = _$CompletionItemKindSnippet;

  @BuiltValueEnumConst(wireNumber: 1)
  static const CompletionItemKind text = _$CompletionItemKindText;

  @BuiltValueEnumConst(wireNumber: 11)
  static const CompletionItemKind unit = _$CompletionItemKindUnit;

  @BuiltValueEnumConst(wireNumber: 12)
  static const CompletionItemKind value = _$CompletionItemKindValue;

  @BuiltValueEnumConst(wireNumber: 6)
  static const CompletionItemKind variable = _$CompletionItemKindVariable;

  const CompletionItemKind._(String name) : super(name);

  static BuiltSet<CompletionItemKind> get values => _$CompletionItemKindValues;
  static CompletionItemKind valueOf(String name) =>
      _$CompletionItemKindValueOf(name);
  static Serializer<CompletionItemKind> get serializer =>
      _$completionItemKindSerializer;
}

abstract class Location implements Built<Location, LocationBuilder> {
  Range get range;

  String get uri;

  Location._();

  factory Location([void Function(LocationBuilder) updates]) = _$Location;

  String toJson() {
    return json.encode(serializers.serializeWith(Location.serializer, this));
  }

  static Location? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Location.serializer, json.decode(jsonString));
  }

  static Serializer<Location> get serializer => _$locationSerializer;
}

abstract class ReferenceContext
    implements Built<ReferenceContext, ReferenceContextBuilder> {
  bool get includeDeclaration;

  ReferenceContext._();

  factory ReferenceContext([void Function(ReferenceContextBuilder) updates]) =
      _$ReferenceContext;

  String toJson() {
    return json
        .encode(serializers.serializeWith(ReferenceContext.serializer, this));
  }

  static ReferenceContext? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ReferenceContext.serializer, json.decode(jsonString));
  }

  static Serializer<ReferenceContext> get serializer =>
      _$referenceContextSerializer;
}

abstract class DocumentHighlight
    implements Built<DocumentHighlight, DocumentHighlightBuilder> {
  DocumentHighlightKind get kind;

  Range get range;

  DocumentHighlight._();

  factory DocumentHighlight([void Function(DocumentHighlightBuilder) updates]) =
      _$DocumentHighlight;

  String toJson() {
    return json
        .encode(serializers.serializeWith(DocumentHighlight.serializer, this));
  }

  static DocumentHighlight? fromJson(String jsonString) {
    return serializers.deserializeWith(
        DocumentHighlight.serializer, json.decode(jsonString));
  }

  static Serializer<DocumentHighlight> get serializer =>
      _$documentHighlightSerializer;
}

class DocumentHighlightKind extends EnumClass {
  @BuiltValueEnumConst(wireNumber: 2)
  static const DocumentHighlightKind read = _$DocumentHighlightKindRead;

  @BuiltValueEnumConst(wireNumber: 1)
  static const DocumentHighlightKind text = _$DocumentHighlightKindText;

  @BuiltValueEnumConst(wireNumber: 3)
  static const DocumentHighlightKind write = _$DocumentHighlightKindWrite;

  const DocumentHighlightKind._(String name) : super(name);

  static BuiltSet<DocumentHighlightKind> get values =>
      _$DocumentHighlightKindValues;
  static DocumentHighlightKind valueOf(String name) =>
      _$DocumentHighlightKindValueOf(name);
  static Serializer<DocumentHighlightKind> get serializer =>
      _$documentHighlightKindSerializer;
}

abstract class SymbolInformation
    implements Built<SymbolInformation, SymbolInformationBuilder> {
  String get containerName;

  SymbolKind get kind;

  Location get location;

  String get name;

  SymbolInformation._();

  factory SymbolInformation([void Function(SymbolInformationBuilder) updates]) =
      _$SymbolInformation;

  String toJson() {
    return json
        .encode(serializers.serializeWith(SymbolInformation.serializer, this));
  }

  static SymbolInformation? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SymbolInformation.serializer, json.decode(jsonString));
  }

  static Serializer<SymbolInformation> get serializer =>
      _$symbolInformationSerializer;
}

class SymbolKind extends EnumClass {
  @BuiltValueEnumConst(wireNumber: 18)
  static const SymbolKind array = _$SymbolKind18;

  @BuiltValueEnumConst(wireNumber: 17)
  static const SymbolKind boolean = _$SymbolKind17;

  @BuiltValueEnumConst(wireNumber: 5)
  static const SymbolKind classSymbol = _$SymbolKind5;

  @BuiltValueEnumConst(wireNumber: 14)
  static const SymbolKind constant = _$SymbolKind14;

  @BuiltValueEnumConst(wireNumber: 9)
  static const SymbolKind constructor = _$SymbolKind9;

  @BuiltValueEnumConst(wireNumber: 22)
  static const SymbolKind enumMember = _$SymbolKind22;

  @BuiltValueEnumConst(wireNumber: 10)
  static const SymbolKind enumSymbol = _$SymbolKind10;

  @BuiltValueEnumConst(wireNumber: 24)
  static const SymbolKind event = _$SymbolKind24;

  @BuiltValueEnumConst(wireNumber: 8)
  static const SymbolKind field = _$SymbolKind8;

  @BuiltValueEnumConst(wireNumber: 1)
  static const SymbolKind file = _$SymbolKind1;

  @BuiltValueEnumConst(wireNumber: 12)
  static const SymbolKind function = _$SymbolKind12;

  @BuiltValueEnumConst(wireNumber: 11)
  static const SymbolKind interface = _$SymbolKind11;

  @BuiltValueEnumConst(wireNumber: 20)
  static const SymbolKind key = _$SymbolKind20;

  @BuiltValueEnumConst(wireNumber: 6)
  static const SymbolKind method = _$SymbolKind6;

  @BuiltValueEnumConst(wireNumber: 2)
  static const SymbolKind module = _$SymbolKind2;

  @BuiltValueEnumConst(wireNumber: 3)
  static const SymbolKind namespace = _$SymbolKind3;

  @BuiltValueEnumConst(wireNumber: 21)
  static const SymbolKind nullSymbol = _$SymbolKind21;

  @BuiltValueEnumConst(wireNumber: 16)
  static const SymbolKind number = _$SymbolKind16;

  @BuiltValueEnumConst(wireNumber: 19)
  static const SymbolKind object = _$SymbolKind19;

  @BuiltValueEnumConst(wireNumber: 25)
  static const SymbolKind operator = _$SymbolKind25;

  @BuiltValueEnumConst(wireNumber: 4)
  static const SymbolKind package = _$SymbolKind4;

  @BuiltValueEnumConst(wireNumber: 7)
  static const SymbolKind property = _$SymbolKind7;

  @BuiltValueEnumConst(wireNumber: 15)
  static const SymbolKind string = _$SymbolKind15;

  @BuiltValueEnumConst(wireNumber: 23)
  static const SymbolKind struct = _$SymbolKind23;

  @BuiltValueEnumConst(wireNumber: 26)
  static const SymbolKind typeParameter = _$SymbolKind26;

  @BuiltValueEnumConst(wireNumber: 13)
  static const SymbolKind variable = _$SymbolKind13;

  const SymbolKind._(String name) : super(name);

  static BuiltSet<SymbolKind> get values => _$SymbolKindValues;
  static SymbolKind valueOf(String name) => _$SymbolKindValueOf(name);
  static Serializer<SymbolKind> get serializer => _$symbolKindSerializer;
}

abstract class CodeActionContext
    implements Built<CodeActionContext, CodeActionContextBuilder> {
  BuiltList<Diagnostic> get diagnostics;

  CodeActionContext._();

  factory CodeActionContext([void Function(CodeActionContextBuilder) updates]) =
      _$CodeActionContext;

  String toJson() {
    return json
        .encode(serializers.serializeWith(CodeActionContext.serializer, this));
  }

  static CodeActionContext? fromJson(String jsonString) {
    return serializers.deserializeWith(
        CodeActionContext.serializer, json.decode(jsonString));
  }

  static Serializer<CodeActionContext> get serializer =>
      _$codeActionContextSerializer;
}

abstract class Diagnostic implements Built<Diagnostic, DiagnosticBuilder> {
  Object get code;

  String get message;

  Range get range;

  int get severity;

  String get source;

  Diagnostic._();

  factory Diagnostic([void Function(DiagnosticBuilder) updates]) = _$Diagnostic;

  String toJson() {
    return json.encode(serializers.serializeWith(Diagnostic.serializer, this));
  }

  static Diagnostic? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Diagnostic.serializer, json.decode(jsonString));
  }

  static Serializer<Diagnostic> get serializer => _$diagnosticSerializer;
}

abstract class WorkspaceEdit
    implements Built<WorkspaceEdit, WorkspaceEditBuilder> {
  BuiltMap<String, BuiltList<TextEdit>> get changes;

  WorkspaceEdit._();

  factory WorkspaceEdit([void Function(WorkspaceEditBuilder) updates]) =
      _$WorkspaceEdit;

  String toJson() {
    return json
        .encode(serializers.serializeWith(WorkspaceEdit.serializer, this));
  }

  static WorkspaceEdit? fromJson(String jsonString) {
    return serializers.deserializeWith(
        WorkspaceEdit.serializer, json.decode(jsonString));
  }

  static Serializer<WorkspaceEdit> get serializer => _$workspaceEditSerializer;
}

abstract class Diagnostics implements Built<Diagnostics, DiagnosticsBuilder> {
  List<Diagnostic> get diagnostics;

  String get uri;

  Diagnostics._();

  factory Diagnostics([void Function(DiagnosticsBuilder) updates]) =
      _$Diagnostics;

  String toJson() {
    return json.encode(serializers.serializeWith(Diagnostics.serializer, this));
  }

  static Diagnostics? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Diagnostics.serializer, json.decode(jsonString));
  }

  static Serializer<Diagnostics> get serializer => _$diagnosticsSerializer;
}

abstract class ApplyWorkspaceEditParams
    implements
        Built<ApplyWorkspaceEditParams, ApplyWorkspaceEditParamsBuilder> {
  WorkspaceEdit get edit;

  String get label;

  ApplyWorkspaceEditParams._();

  factory ApplyWorkspaceEditParams(
          [void Function(ApplyWorkspaceEditParamsBuilder) updates]) =
      _$ApplyWorkspaceEditParams;

  String toJson() {
    return json.encode(
        serializers.serializeWith(ApplyWorkspaceEditParams.serializer, this));
  }

  static ApplyWorkspaceEditParams? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ApplyWorkspaceEditParams.serializer, json.decode(jsonString));
  }

  static Serializer<ApplyWorkspaceEditParams> get serializer =>
      _$applyWorkspaceEditParamsSerializer;
}

abstract class ShowMessageParams
    implements Built<ShowMessageParams, ShowMessageParamsBuilder> {
  String get message;

  MessageType get type;

  ShowMessageParams._();

  factory ShowMessageParams([void Function(ShowMessageParamsBuilder) updates]) =
      _$ShowMessageParams;

  String toJson() {
    return json
        .encode(serializers.serializeWith(ShowMessageParams.serializer, this));
  }

  static ShowMessageParams? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ShowMessageParams.serializer, json.decode(jsonString));
  }

  static Serializer<ShowMessageParams> get serializer =>
      _$showMessageParamsSerializer;
}

class MessageType extends EnumClass {
  @BuiltValueEnumConst(wireNumber: 1)
  static const MessageType error = _$MessageType1;

  @BuiltValueEnumConst(wireNumber: 3)
  static const MessageType info = _$MessageType3;

  @BuiltValueEnumConst(wireNumber: 4)
  static const MessageType log = _$MessageType4;

  @BuiltValueEnumConst(wireNumber: 2)
  static const MessageType warning = _$MessageType2;

  const MessageType._(String name) : super(name);

  static BuiltSet<MessageType> get values => _$MessageTypeValues;
  static MessageType valueOf(String name) => _$MessageTypeValueOf(name);
  static Serializer<MessageType> get serializer => _$messageTypeSerializer;
}

abstract class LanguageServer {
  Future<void> get onDone;
  Future<void> shutdown();
  void exit();

  Future<ServerCapabilities> initialize(int clientPid, String rootUri,
      ClientCapabilities clientCapabilities, String trace);
  void initialized();
  void textDocumentDidOpen(TextDocumentItem document);
  void textDocumentDidChange(VersionedTextDocumentIdentifier documentId,
      List<TextDocumentContentChangeEvent> changes);
  void textDocumentDidClose(TextDocumentIdentifier documentId);
  Future<CompletionList> textDocumentCompletion(
      TextDocumentIdentifier documentId, Position position);
  Future<Location> textDocumentDefinition(
      TextDocumentIdentifier documentId, Position position);
  Future<List<Location>> textDocumentReferences(
    TextDocumentIdentifier documentId,
    Position position,
    ReferenceContext context,
  );
  Future<List<Location>> textDocumentImplementation(
      TextDocumentIdentifier documentId, Position position);

  Future<List<DocumentHighlight>> textDocumentHighlight(
      TextDocumentIdentifier documentId, Position position);

  Future<List<SymbolInformation>> textDocumentSymbols(
    TextDocumentIdentifier documentId,
  );

  Future<List<SymbolInformation>> workspaceSymbol(String query);

  Future<dynamic> textDocumentHover(
      TextDocumentIdentifier documentId, Position position);

  Future<List<dynamic /*Command|CodeAction*/ >> textDocumentCodeAction(
    TextDocumentIdentifier documentId,
    Range range,
    CodeActionContext context,
  );

  Future<void> workspaceExecuteCommand(String command, List<dynamic> arguments);

  Future<WorkspaceEdit> textDocumentRename(
    TextDocumentIdentifier documentId,
    Position position,
    String newName,
  );

  Stream<Diagnostics> get diagnostics;
  Stream<ApplyWorkspaceEditParams> get workspaceEdits;
  Stream<ShowMessageParams> get showMessages;
  Stream<ShowMessageParams> get logMessages;

  void setupExtraMethods(Server server) {}
}
