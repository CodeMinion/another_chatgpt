import 'package:json_annotation/json_annotation.dart';

part 'assistants_dto.g.dart';

///
/// Represents an assistant that can call the model and use tools.
///
@JsonSerializable(includeIfNull: false)
class GptAssistant {

  /// The identifier, which can be referenced in API endpoints.
  String id;

  /// The object type, which is always assistant.
  final String object;

  /// The Unix timestamp (in seconds) for when the assistant was created.
  @JsonKey(name: "created_at")
  int createdAt;

  /// The name of the assistant. The maximum length is 256 characters.
  String? name;

  /// The description of the assistant. The maximum length is 512 characters.
  String? description;

  /// ID of the model to use. You can use the List models API to see all of
  /// your available models, or see our Model overview for descriptions of them.
  String model;

  /// The system instructions that the assistant uses.
  /// The maximum length is 32768 characters.
  String? instructions;

  /// A list of tool enabled on the assistant. There can be a
  /// maximum of 128 tools per assistant. Tools can be of
  /// types code_interpreter, retrieval, or function.
  List<AssistantTool> tools;

  /// A list of file IDs attached to this assistant. There can be a
  /// maximum of 20 files attached to the assistant. Files are
  /// ordered by their creation date in ascending order.
  @JsonKey(name: "file_ids")
  List<String> fileIds;

  /// Set of 16 key-value pairs that can be attached to an object.
  /// This can be useful for storing additional information about
  /// the object in a structured format. Keys can be a maximum of
  /// 64 characters long and values can be a maxium of 512 characters long.
  Map<String, dynamic> metadata;

  GptAssistant(
      {required this.id,
      this.object = "assistant",
      required this.createdAt,
      this.name,
      this.description,
      required this.model,
      this.instructions,
      required this.tools,
      required this.fileIds,
      required this.metadata});

  factory GptAssistant.fromJson(Map<String, dynamic> json) =>
      _$GptAssistantFromJson(json);

  Map<String, dynamic> toJson() => _$GptAssistantToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// Representation of a tool
@JsonSerializable(includeIfNull: false)
class AssistantTool {
  /// The type of tool being defined:
  AssistantToolType type;
  FunctionTool? function;

  AssistantTool({required this.type, this.function});

  factory AssistantTool.fromJson(Map<String, dynamic> json) =>
      _$AssistantToolFromJson(json);

  Map<String, dynamic> toJson() => _$AssistantToolToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// Representation of a function tool
@JsonSerializable(includeIfNull: false)
class FunctionTool {
  String description;
  String name;
  Map<String, dynamic> paramters;

  FunctionTool(
      {required this.name, required this.description, required this.paramters});

  factory FunctionTool.fromJson(Map<String, dynamic> json) =>
      _$FunctionToolFromJson(json);

  Map<String, dynamic> toJson() => _$FunctionToolToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}


@JsonSerializable(includeIfNull: false)
class CreateGptAssistantRequest {

  ///
  /// ID of the model to use. You can use the List models API to see all
  /// of your available models, or see our Model overview for
  /// descriptions of them.
  String model;

  /// The name of the assistant. The maximum length is 256 characters.
  String? name;

  /// The description of the assistant. The maximum length is 512 characters.
  String? description;

  /// The system instructions that the assistant uses.
  /// The maximum length is 32768 characters.
  String? instructions;

  /// A list of tool enabled on the assistant.
  /// There can be a maximum of 128 tools per assistant.
  /// Tools can be of types code_interpreter, retrieval, or function.
  List<AssistantTool> tools;

  /// A list of file IDs attached to this assistant. There can be a
  /// maximum of 20 files attached to the assistant. Files
  /// are ordered by their creation date in ascending order.
  @JsonKey(name: "file_ids")
  List<String> fileIds;

  /// Set of 16 key-value pairs that can be attached to an object.
  /// This can be useful for storing additional information about
  /// the object in a structured format. Keys can be a maximum of
  /// 64 characters long and values can be a maxium of 512 characters long.
  Map<String, dynamic> metadata;

  CreateGptAssistantRequest(
      { this.name,
        this.description,
        required this.model,
        this.instructions,
        this.tools = const [],
        required this.fileIds,
        required this.metadata});

  factory CreateGptAssistantRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateGptAssistantRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGptAssistantRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ModifyGptAssistantRequest {

  ///
  /// ID of the model to use. You can use the List models API to see all
  /// of your available models, or see our Model overview for
  /// descriptions of them.
  String model;

  /// The name of the assistant. The maximum length is 256 characters.
  String? name;

  /// The description of the assistant. The maximum length is 512 characters.
  String? description;

  /// The system instructions that the assistant uses.
  /// The maximum length is 32768 characters.
  String? instructions;

  /// A list of tool enabled on the assistant.
  /// There can be a maximum of 128 tools per assistant.
  /// Tools can be of types code_interpreter, retrieval, or function.
  List<AssistantTool> tools;

  /// A list of file IDs attached to this assistant. There can be a
  /// maximum of 20 files attached to the assistant. Files
  /// are ordered by their creation date in ascending order.
  @JsonKey(name: "file_ids")
  List<String> fileIds;

  /// Set of 16 key-value pairs that can be attached to an object.
  /// This can be useful for storing additional information about
  /// the object in a structured format. Keys can be a maximum of
  /// 64 characters long and values can be a maxium of 512 characters long.
  Map<String, dynamic> metadata;

  ModifyGptAssistantRequest(
      { this.name,
        this.description,
        required this.model,
        this.instructions,
        this.tools = const [],
        required this.fileIds,
        required this.metadata});

  factory ModifyGptAssistantRequest.fromJson(Map<String, dynamic> json) =>
      _$ModifyGptAssistantRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ModifyGptAssistantRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class AssistantList {
  String object;
  List<GptAssistant> data;

  AssistantList({required this.object, required this.data});

  factory AssistantList.fromJson(Map<String, dynamic> json) =>
      _$AssistantListFromJson(json);

  Map<String, dynamic> toJson() => _$AssistantListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GetAssistantListRequest {

  /// A limit on the number of objects to be returned.
  /// Limit can range between 1 and 100, and the default is 20.
  int limit;

  /// Sort order by the created_at timestamp of the objects.
  /// asc for ascending order and desc for descending order.
  AssistantOrder order;

  /// A cursor for use in pagination. after is an object ID that defines
  /// your place in the list. For instance, if you make a list
  /// request and receive 100 objects, ending with obj_foo,
  /// your subsequent call can include after=obj_foo in order
  /// to fetch the next page of the list.
  String? after;

  /// A cursor for use in pagination. before is an object ID
  /// that defines your place in the list. For instance,
  /// if you make a list request and receive 100 objects,
  /// ending with obj_foo, your subsequent call can include
  /// before=obj_foo in order to fetch the previous page of the list.
  String? before;

  GetAssistantListRequest({this.limit = 20, this.order = AssistantOrder.desc, this.after, this.before});

  factory GetAssistantListRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAssistantListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAssistantListRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class AssistantFile {

  /// The identifier, which can be referenced in API endpoints.
  String id;

  /// The object type, which is always assistant.file.
  String object;

  /// The Unix timestamp (in seconds) for when the assistant file was created.
  @JsonKey(name: "created_at")
  String createdAt;

  /// The assistant ID that the file is attached to.
  @JsonKey(name: "assistant_id")
  String assistantId;

  AssistantFile({required this.id, this.object = "assistant.file", required this.createdAt, required this.assistantId});

  factory AssistantFile.fromJson(Map<String, dynamic> json) =>
      _$AssistantFileFromJson(json);

  Map<String, dynamic> toJson() => _$AssistantFileToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CreateAssistantFileRequest {

  /// A File ID (with purpose="assistants") that the assistant
  /// should use. Useful for tools like retrieval and
  /// code_interpreter that can access files.
  @JsonKey(name: "file_id")
  String fileId;

  CreateAssistantFileRequest({required this.fileId});

  factory CreateAssistantFileRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAssistantFileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAssistantFileRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class AssistantFileList {
  String object;
  List<AssistantFile> data;

  AssistantFileList({required this.object, required this.data});

  factory AssistantFileList.fromJson(Map<String, dynamic> json) =>
      _$AssistantFileListFromJson(json);

  Map<String, dynamic> toJson() => _$AssistantFileListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GetAssistantFileListRequest {

  /// A limit on the number of objects to be returned.
  /// Limit can range between 1 and 100, and the default is 20.
  int limit;

  /// Sort order by the created_at timestamp of the objects.
  /// asc for ascending order and desc for descending order.
  AssistantOrder order;

  /// A cursor for use in pagination. after is an object ID that defines
  /// your place in the list. For instance, if you make a list
  /// request and receive 100 objects, ending with obj_foo,
  /// your subsequent call can include after=obj_foo in order
  /// to fetch the next page of the list.
  String? after;

  /// A cursor for use in pagination. before is an object ID
  /// that defines your place in the list. For instance,
  /// if you make a list request and receive 100 objects,
  /// ending with obj_foo, your subsequent call can include
  /// before=obj_foo in order to fetch the previous page of the list.
  String? before;

  GetAssistantFileListRequest({this.limit = 20, this.order = AssistantOrder.desc, this.after, this.before});

  factory GetAssistantFileListRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAssistantFileListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAssistantFileListRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}


enum AssistantToolType {
  @JsonValue("code_interpreter")
  codeInterpreter,
  retrieval,
  function,
}

enum AssistantOrder {
  asc,
  desc,
}