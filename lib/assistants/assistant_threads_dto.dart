
import 'package:json_annotation/json_annotation.dart';

import 'assistant_messages_dto.dart';

part 'assistant_threads_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class GptThread {
  String id;
  String object;

  @JsonKey(name: "created_at")
  int createdAt;

  /// Set of 16 key-value pairs that can be attached to an object.
  /// This can be useful for storing additional information about
  /// the object in a structured format. Keys can be a maximum of
  /// 64 characters long and values can be a maxium of 512 characters long.
  Map<String, dynamic>? metadata;

  GptThread({required this.id, this.object = "thread", required this.createdAt, this.metadata});

  factory GptThread.fromJson(Map<String, dynamic> json) =>
      _$GptThreadFromJson(json);

  Map<String, dynamic> toJson() => _$GptThreadToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CreateGptThreadRequest {

  /// A list of messages to start the thread with.
  List<GptThreadMessage>? messages;

  /// Set of 16 key-value pairs that can be attached to an object.
  /// This can be useful for storing additional information about
  /// the object in a structured format. Keys can be a maximum of
  /// 64 characters long and values can be a maxium of 512 characters long.
  Map<String, dynamic>? metadata;

  CreateGptThreadRequest({this.metadata, this.messages});

  factory CreateGptThreadRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateGptThreadRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGptThreadRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptThreadMessage {

  /// The role of the entity that is creating the message.
  /// Currently only user is supported.
  GptThreadRole role;

  /// The content of the message.
  String content;

  /// A list of File IDs that the message should use.
  /// There can be a maximum of 10 files attached to a message.
  /// Useful for tools like retrieval and code_interpreter that
  /// can access and use files.
  @JsonKey(name: "file_ids")
  List<String>? fileIds;

  /// Set of 16 key-value pairs that can be attached to an object.
  /// This can be useful for storing additional information about
  /// the object in a structured format. Keys can be a maximum of
  /// 64 characters long and values can be a maxium of 512 characters long.
  Map<String, dynamic>? metadata;

  GptThreadMessage({required this.role, required this.content, this.fileIds, this.metadata});

  factory GptThreadMessage.fromJson(Map<String, dynamic> json) =>
      _$GptThreadMessageFromJson(json);

  Map<String, dynamic> toJson() => _$GptThreadMessageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}


@JsonSerializable(includeIfNull: false)
class ModifyGptThreadRequest {

  /// Set of 16 key-value pairs that can be attached to an object.
  /// This can be useful for storing additional information about
  /// the object in a structured format. Keys can be a maximum of
  /// 64 characters long and values can be a maxium of 512 characters long.
  Map<String, dynamic>? metadata;

  ModifyGptThreadRequest({this.metadata});

  factory ModifyGptThreadRequest.fromJson(Map<String, dynamic> json) =>
      _$ModifyGptThreadRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ModifyGptThreadRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
