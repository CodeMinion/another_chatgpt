
import 'package:json_annotation/json_annotation.dart';

import '../threads/threads_dto.dart';
import 'assistants_dto.dart';

part 'runs_dto.g.dart';

/// Represents an execution run on a thread.
@JsonSerializable(includeIfNull: false)
class GptRun {

  /// The identifier, which can be referenced in API endpoints.
  String id;

  /// The object type, which is always thread.run.
  String object;

  /// The Unix timestamp (in seconds) for when the run was created.
  @JsonKey(name: "created_at")
  int createdAt;

  /// The ID of the thread that was executed on as a part of this run.
  @JsonKey(name: "thread_id")
  String threadId;

  /// The ID of the assistant used for execution of this run.
  @JsonKey(name: "assistant_id")
  String assistantId;

  /// The status of the run,
  GptRunStatus status;

  @JsonKey(name: "required_action")
  GptRunRequiredAction? requiredAction;

  @JsonKey(name: "last_error")
  GptRunError? lastError;

  @JsonKey(name: "expires_at")
  int? expiresAt;

  @JsonKey(name: "started_at")
  int? startedAt;

  @JsonKey(name: "cancelled_at")
  int? cancelledAt;

  @JsonKey(name: "failed_at")
  int? failedAt;

  @JsonKey(name: "completed_at")
  int? completedAt;

  String model;

  String instructions;

  List<AssistantTool> tools;

  @JsonKey(name: "file_ids")
  List<String> fileIds;

  /// Set of 16 key-value pairs that can be attached to an object.
  /// This can be useful for storing additional information about
  /// the object in a structured format. Keys can be a maximum of
  /// 64 characters long and values can be a maxium of 512 characters long.
  Map<String, dynamic> metadata;

  GptRun({ required this.id, this.object = "thread.run", required this.threadId, required this.assistantId, required this.createdAt, required this.fileIds, required this.metadata, this.requiredAction, required this.instructions, required this.model, required this.status, this.cancelledAt, this.completedAt, this.expiresAt, this.failedAt, this.lastError, this.startedAt, required this.tools});

  factory GptRun.fromJson(Map<String, dynamic> json) =>
      _$GptRunFromJson(json);

  Map<String, dynamic> toJson() => _$GptRunToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptRunRequiredAction {

  String type;

  @JsonKey(name: "submit_tool_outputs")
  GptSubmitToolsOutputs submitToolOutputs;

  GptRunRequiredAction({required this.type, required this.submitToolOutputs});

  factory GptRunRequiredAction.fromJson(Map<String, dynamic> json) =>
      _$GptRunRequiredActionFromJson(json);

  Map<String, dynamic> toJson() => _$GptRunRequiredActionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptSubmitToolsOutputs {
  @JsonKey(name: "tool_calls")
  List<GptRunToolCall> toolCalls;

  GptSubmitToolsOutputs({required this.toolCalls});

  factory GptSubmitToolsOutputs.fromJson(Map<String, dynamic> json) =>
      _$GptSubmitToolsOutputsFromJson(json);

  Map<String, dynamic> toJson() => _$GptSubmitToolsOutputsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptRunToolCall {
  String id;
  String type;
  GptRunFunction function;

  GptRunToolCall({required this.id, required this.type, required this.function});

  factory GptRunToolCall.fromJson(Map<String, dynamic> json) =>
      _$GptRunToolCallFromJson(json);

  Map<String, dynamic> toJson() => _$GptRunToolCallToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}


@JsonSerializable(includeIfNull: false)
class GptRunFunction {
  String name;
  String arguments;

  GptRunFunction({required this.name, required this.arguments});

  factory GptRunFunction.fromJson(Map<String, dynamic> json) =>
      _$GptRunFunctionFromJson(json);

  Map<String, dynamic> toJson() => _$GptRunFunctionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptRunError {

  GptRunErrorCode code;
  String message;

  GptRunError({required this.message, required this.code});

  factory GptRunError.fromJson(Map<String, dynamic> json) =>
      _$GptRunErrorFromJson(json);

  Map<String, dynamic> toJson() => _$GptRunErrorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}


@JsonSerializable(includeIfNull: false)
class CreateGptRunRequest {

  /// The ID of the assistant used for execution of this run.
  @JsonKey(name: "assistant_id")
  String assistantId;

  String model;

  String instructions;

  List<AssistantTool> tools;

  /// Set of 16 key-value pairs that can be attached to an object.
  /// This can be useful for storing additional information about
  /// the object in a structured format. Keys can be a maximum of
  /// 64 characters long and values can be a maxium of 512 characters long.
  Map<String, dynamic> metadata;

  CreateGptRunRequest({ required this.assistantId, required this.metadata, required this.instructions, required this.model, required this.tools});

  factory CreateGptRunRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateGptRunRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGptRunRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ModifyGptRunRequest {

  /// Set of 16 key-value pairs that can be attached to an object.
  /// This can be useful for storing additional information about
  /// the object in a structured format. Keys can be a maximum of
  /// 64 characters long and values can be a maxium of 512 characters long.
  Map<String, dynamic> metadata;

  ModifyGptRunRequest({required this.metadata});

  factory ModifyGptRunRequest.fromJson(Map<String, dynamic> json) =>
      _$ModifyGptRunRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ModifyGptRunRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class SubmitToolsOutputsRequest {

  @JsonKey(name: "tool_outputs")
  List<GptSubmitToolsOutputs> toolOutputs;

  SubmitToolsOutputsRequest({required this.toolOutputs});

  factory SubmitToolsOutputsRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitToolsOutputsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitToolsOutputsRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CreateAndRunThreadRequest {

  @JsonKey(name: "assistant_id")
  String assistantId;

  GptRunThread? thread;

  String? model;

  String? instructions;

  // TODO tools

  /// Set of 16 key-value pairs that can be attached to an object.
  /// This can be useful for storing additional information about
  /// the object in a structured format. Keys can be a maximum of
  /// 64 characters long and values can be a maxium of 512 characters long.
  Map<String, dynamic>? metadata;

  CreateAndRunThreadRequest({required this.assistantId, this.metadata, this.model, this.instructions, this.thread});

  factory CreateAndRunThreadRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAndRunThreadRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAndRunThreadRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptRunThread {

  /// A list of messages to start the thread with.
  List<GptThreadMessage>? messages;

  /// Set of 16 key-value pairs that can be attached to an object.
  /// This can be useful for storing additional information about
  /// the object in a structured format. Keys can be a maximum of
  /// 64 characters long and values can be a maxium of 512 characters long.
  Map<String, dynamic>? metadata;

  GptRunThread({this.metadata, this.messages});

  factory GptRunThread.fromJson(Map<String, dynamic> json) =>
  _$GptRunThreadFromJson(json);

  Map<String, dynamic> toJson() => _$GptRunThreadToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Represents a step in execution of a run.
@JsonSerializable(includeIfNull: false)
class GptRunStep {

  /// The identifier, which can be referenced in API endpoints.
  String id;

  /// The object type, which is always thread.run.
  String object;

  /// The Unix timestamp (in seconds) for when the run was created.
  @JsonKey(name: "created_at")
  int createdAt;

  /// The ID of the assistant used for execution of this run.
  @JsonKey(name: "assistant_id")
  String assistantId;

  /// The ID of the thread that was executed on as a part of this run.
  @JsonKey(name: "thread_id")
  String threadId;

  @JsonKey(name: "run_id")
  String runId;

  GptRunStepType type;

  /// The status of the run,
  GptRunStatus status;

  // TODO step_details

  @JsonKey(name: "last_error")
  GptRunError? lastError;

  @JsonKey(name: "expires_at")
  int? expiresAt;

  @JsonKey(name: "started_at")
  int? startedAt;

  @JsonKey(name: "cancelled_at")
  int? cancelledAt;

  @JsonKey(name: "failed_at")
  int? failedAt;

  @JsonKey(name: "completed_at")
  int? completedAt;


  /// Set of 16 key-value pairs that can be attached to an object.
  /// This can be useful for storing additional information about
  /// the object in a structured format. Keys can be a maximum of
  /// 64 characters long and values can be a maxium of 512 characters long.
  Map<String, dynamic> metadata;

  GptRunStep({ required this.id, this.object = "thread.run.step", required this.threadId, required this.assistantId, required this.createdAt,  required this.metadata, required this.status, this.cancelledAt, this.completedAt, this.expiresAt, this.failedAt, this.lastError, this.startedAt, required this.runId, required this.type});

  factory GptRunStep.fromJson(Map<String, dynamic> json) =>
      _$GptRunStepFromJson(json);

  Map<String, dynamic> toJson() => _$GptRunStepToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum GptRunStatus {
  queued,

  @JsonValue("in_progress")
  inProgress,

  @JsonValue("requires_action")
  requiresAction,

  cancelling,

  cancelled,

  failed,

  completed,

  expired

}

enum GptRunErrorCode {
  @JsonValue("server_error")
  serverError,

  @JsonValue("rate_limit_exceeded")
  rateLimitExceeded
}

enum GptRunStepType {
  @JsonValue("message_creation")
  messageCreation,

  @JsonValue("tool_calls")
  toolCalls
}