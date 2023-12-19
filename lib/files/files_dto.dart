
import 'package:json_annotation/json_annotation.dart';

part 'files_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class GptFile {
  String id;

  int bytes;

  @JsonKey(name: "created_at")
  int createdAt;

  String filename;

  String object;

  GptFilePurpose purpose;

  GptFile({required this.id, required this.bytes, required this.createdAt, required this.filename, required this.object, required this.purpose});

  factory GptFile.fromJson(Map<String, dynamic> json) =>
      _$GptFileFromJson(json);

  Map<String, dynamic> toJson() => _$GptFileToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

@JsonSerializable(includeIfNull: false)
class ListFilesRequest {
  GptFilePurpose purpose;

  ListFilesRequest({required this.purpose});

  factory ListFilesRequest.fromJson(Map<String, dynamic> json) =>
      _$ListFilesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ListFilesRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CreateFileRequest {
  GptFilePurpose purpose;
  String? fileName;

  CreateFileRequest({required this.purpose, this.fileName});

  factory CreateFileRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateFileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFileRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum GptFilePurpose {

  @JsonValue("fine-tune")
  fineTune,

  @JsonValue("fine-tune-results")
  fineTuneResults,

  assistants,

  @JsonValue("assistants_output")
  assistantsOutput,
}

