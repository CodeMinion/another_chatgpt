import 'package:json_annotation/json_annotation.dart';

part 'messages_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class GptMessage {

  /// The identifier, which can be referenced in API endpoints.
  String id;

  /// The object type, which is always thread.message.
  String object;

  /// The Unix timestamp (in seconds) for when the message was created.
  @JsonKey(name: "created_at")
  int createdAt;

  /// The thread ID that this message belongs to.
  @JsonKey(name: "thread_id")
  String threadId;

  /// The entity that produced the message. One of user or assistant.
  GptThreadRole role;

  /// The content of the message in array of text and/or images.
  List<GptThreadContent> content;

  /// If applicable, the ID of the assistant that authored this message.
  @JsonKey(name: "assistant_id")
  String? assistantId;

  /// If applicable, the ID of the run associated with the authoring of this message.
  @JsonKey(name: "run_id")
  String? runId;

  /// A list of file IDs that the assistant should use. Useful for tools like
  /// retrieval and code_interpreter that can access files.
  /// A maximum of 10 files can be attached to a message.
  @JsonKey(name: "file_ids")
  List<String> fileIds;

  /// Set of 16 key-value pairs that can be attached to an object.
  /// This can be useful for storing additional information about
  /// the object in a structured format. Keys can be a maximum of
  /// 64 characters long and values can be a maxium of 512 characters long.
  Map<String, dynamic>? metadata;

  GptMessage(
      {required this.id, this.object = "thread.message", required this.threadId, this.metadata, required this.fileIds, required this.content, required this.role, required this.createdAt, this.assistantId, this.runId});

  factory GptMessage.fromJson(Map<String, dynamic> json) =>
      _$GptMessageFromJson(json);

  Map<String, dynamic> toJson() => _$GptMessageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptThreadContent {

  GptThreadContentType type;
  @JsonKey(name: "image_file")
  GptThreadContentImageFile? imageFile;
  GptThreadContentText? text;

  GptThreadContent({required this.type, this.imageFile, this.text});

  factory GptThreadContent.fromJson(Map<String, dynamic> json) =>
      _$GptThreadContentFromJson(json);

  Map<String, dynamic> toJson() => _$GptThreadContentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptThreadContentImageFile {
  @JsonKey(name: "file_id")
  String fileId;

  GptThreadContentImageFile({required this.fileId});

  factory GptThreadContentImageFile.fromJson(Map<String, dynamic> json) =>
      _$GptThreadContentImageFileFromJson(json);

  Map<String, dynamic> toJson() => _$GptThreadContentImageFileToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptThreadContentText {
  String value;
  List<GptThreadAnnotation> annotations;

  GptThreadContentText({required this.value, required this.annotations});

  factory GptThreadContentText.fromJson(Map<String, dynamic> json) =>
      _$GptThreadContentTextFromJson(json);

  Map<String, dynamic> toJson() => _$GptThreadContentTextToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptThreadAnnotation {
  GptContentTextType type;
  String text;

  @JsonKey(name: "start_index")
  int startIndex;

  @JsonKey(name: "end_index")
  int endIndex;

  @JsonKey(name: "file_citation")
  GptThreadAnnotationFileCitation? fileCitation;

  @JsonKey(name: "file_path")
  GptThreadAnnotationFilePath? filePath;

  GptThreadAnnotation(
      {required this.type, required this.startIndex, required this.endIndex, required this.text, this.fileCitation, this.filePath});

  factory GptThreadAnnotation.fromJson(Map<String, dynamic> json) =>
      _$GptThreadAnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$GptThreadAnnotationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptThreadAnnotationFileCitation {
  @JsonKey(name: "file_id")
  String fileId;
  String quote;

  GptThreadAnnotationFileCitation({required this.fileId, required this.quote});

  factory GptThreadAnnotationFileCitation.fromJson(Map<String, dynamic> json) =>
      _$GptThreadAnnotationFileCitationFromJson(json);

  Map<String, dynamic> toJson() => _$GptThreadAnnotationFileCitationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptThreadAnnotationFilePath {
  @JsonKey(name: "file_id")
  String fileId;

  GptThreadAnnotationFilePath({required this.fileId});

  factory GptThreadAnnotationFilePath.fromJson(Map<String, dynamic> json) =>
      _$GptThreadAnnotationFilePathFromJson(json);

  Map<String, dynamic> toJson() => _$GptThreadAnnotationFilePathToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CreateGptMessageRequest {

  /// The role of the entity that is creating the message. Currently only user is supported.
  GptThreadRole role;

  /// The content of the message.
  List<GptThreadContent> content;

  /// A list of File IDs that the message should use.
  /// There can be a maximum of 10 files attached to a message.
  /// Useful for tools like retrieval and code_interpreter that
  /// can access and use files.
  @JsonKey(name: "file_ids")
  List<String> fileIds;

  /// Set of 16 key-value pairs that can be attached to an object.
  /// This can be useful for storing additional information about
  /// the object in a structured format. Keys can be a maximum of
  /// 64 characters long and values can be a maxium of 512 characters long.
  Map<String, dynamic>? metadata;

  CreateGptMessageRequest(
      {this.metadata, required this.fileIds, required this.content, required this.role});

  factory CreateGptMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateGptMessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGptMessageRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ModifyGptMessageRequest {

  /// The role of the entity that is creating the message. Currently only user is supported.
  GptThreadRole role;

  /// The content of the message.
  List<GptThreadContent> content;

  /// A list of File IDs that the message should use.
  /// There can be a maximum of 10 files attached to a message.
  /// Useful for tools like retrieval and code_interpreter that
  /// can access and use files.
  @JsonKey(name: "file_ids")
  List<String> fileIds;

  /// Set of 16 key-value pairs that can be attached to an object.
  /// This can be useful for storing additional information about
  /// the object in a structured format. Keys can be a maximum of
  /// 64 characters long and values can be a maxium of 512 characters long.
  Map<String, dynamic>? metadata;

  ModifyGptMessageRequest(
      {this.metadata, required this.fileIds, required this.content, required this.role});

  factory ModifyGptMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$ModifyGptMessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ModifyGptMessageRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptMessageList {
  String object;
  List<GptMessage> data;

  GptMessageList({required this.object, required this.data});

  factory GptMessageList.fromJson(Map<String, dynamic> json) =>
      _$GptMessageListFromJson(json);

  Map<String, dynamic> toJson() => _$GptMessageListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptMessageFile {
  String id;
  String object;

  @JsonKey(name: "created_at")
  int createdAd;

  @JsonKey(name: "message_id")
  String messageId;

  GptMessageFile({required this.messageId, required this.object, required this.id, required this.createdAd});

  factory GptMessageFile.fromJson(Map<String, dynamic> json) =>
      _$GptMessageFileFromJson(json);

  Map<String, dynamic> toJson() => _$GptMessageFileToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}


@JsonSerializable(includeIfNull: false)
class GptMessageFileList {
  String object;
  List<GptMessageFile> data;

  GptMessageFileList({required this.object, required this.data});

  factory GptMessageFileList.fromJson(Map<String, dynamic> json) =>
      _$GptMessageFileListFromJson(json);

  Map<String, dynamic> toJson() => _$GptMessageFileListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum GptThreadRole {
  user,
  assistant
}

enum GptThreadContentType {
  @JsonValue("image_file")
  imageFile,
  text
}

enum GptContentTextType {
  @JsonValue("file_citation")
  fileCitation,
  @JsonValue("file_path")
  filePath,
}

enum GptMessageOrder {
  asc,
  desc
}