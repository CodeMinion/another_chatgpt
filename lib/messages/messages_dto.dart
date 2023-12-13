import 'package:json_annotation/json_annotation.dart';

part 'messages_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class GptMessage {
  String id;
  String object;

  @JsonKey(name: "created_at")
  int createdAt;

  @JsonKey(name: "thread_id")
  String threadId;

  GptThreadRole role;

  List<GptThreadContent> content;

  @JsonKey(name: "assistant_id")
  String? assistantId;

  @JsonKey(name: "run_id")
  String? runId;

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