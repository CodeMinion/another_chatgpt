// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'runs_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptRun _$GptRunFromJson(Map<String, dynamic> json) => GptRun(
      id: json['id'] as String,
      object: json['object'] as String? ?? "thread.run",
      threadId: json['thread_id'] as String,
      assistantId: json['assistant_id'] as String,
      createdAt: json['created_at'] as int,
      fileIds:
          (json['file_ids'] as List<dynamic>).map((e) => e as String).toList(),
      metadata: json['metadata'] as Map<String, dynamic>,
      requiredAction: json['required_action'] == null
          ? null
          : GptRunRequiredAction.fromJson(
              json['required_action'] as Map<String, dynamic>),
      instructions: json['instructions'] as String,
      model: json['model'] as String,
      status: $enumDecode(_$GptRunStatusEnumMap, json['status']),
      cancelledAt: json['cancelled_at'] as int?,
      completedAt: json['completed_at'] as int?,
      expiresAt: json['expires_at'] as int?,
      failedAt: json['failed_at'] as int?,
      lastError: json['last_error'] == null
          ? null
          : GptRunError.fromJson(json['last_error'] as Map<String, dynamic>),
      startedAt: json['started_at'] as int?,
      tools: (json['tools'] as List<dynamic>)
          .map((e) => AssistantTool.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GptRunToJson(GptRun instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'object': instance.object,
    'created_at': instance.createdAt,
    'thread_id': instance.threadId,
    'assistant_id': instance.assistantId,
    'status': _$GptRunStatusEnumMap[instance.status]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('required_action', instance.requiredAction);
  writeNotNull('last_error', instance.lastError);
  writeNotNull('expires_at', instance.expiresAt);
  writeNotNull('started_at', instance.startedAt);
  writeNotNull('cancelled_at', instance.cancelledAt);
  writeNotNull('failed_at', instance.failedAt);
  writeNotNull('completed_at', instance.completedAt);
  val['model'] = instance.model;
  val['instructions'] = instance.instructions;
  val['tools'] = instance.tools;
  val['file_ids'] = instance.fileIds;
  val['metadata'] = instance.metadata;
  return val;
}

const _$GptRunStatusEnumMap = {
  GptRunStatus.queued: 'queued',
  GptRunStatus.inProgress: 'in_progress',
  GptRunStatus.requiresAction: 'requires_action',
  GptRunStatus.cancelling: 'cancelling',
  GptRunStatus.cancelled: 'cancelled',
  GptRunStatus.failed: 'failed',
  GptRunStatus.completed: 'completed',
  GptRunStatus.expired: 'expired',
};

GptRunRequiredAction _$GptRunRequiredActionFromJson(
        Map<String, dynamic> json) =>
    GptRunRequiredAction(
      type: json['type'] as String,
      submitToolOutputs: GptSubmitToolsOutputs.fromJson(
          json['submit_tool_outputs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GptRunRequiredActionToJson(
        GptRunRequiredAction instance) =>
    <String, dynamic>{
      'type': instance.type,
      'submit_tool_outputs': instance.submitToolOutputs,
    };

GptSubmitToolsOutputs _$GptSubmitToolsOutputsFromJson(
        Map<String, dynamic> json) =>
    GptSubmitToolsOutputs(
      toolCalls: (json['tool_calls'] as List<dynamic>)
          .map((e) => GptRunToolCall.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GptSubmitToolsOutputsToJson(
        GptSubmitToolsOutputs instance) =>
    <String, dynamic>{
      'tool_calls': instance.toolCalls,
    };

GptRunToolCall _$GptRunToolCallFromJson(Map<String, dynamic> json) =>
    GptRunToolCall(
      id: json['id'] as String,
      type: json['type'] as String,
      function:
          GptRunFunction.fromJson(json['function'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GptRunToolCallToJson(GptRunToolCall instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'function': instance.function,
    };

GptRunFunction _$GptRunFunctionFromJson(Map<String, dynamic> json) =>
    GptRunFunction(
      name: json['name'] as String,
      arguments: json['arguments'] as String,
    );

Map<String, dynamic> _$GptRunFunctionToJson(GptRunFunction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'arguments': instance.arguments,
    };

GptRunError _$GptRunErrorFromJson(Map<String, dynamic> json) => GptRunError(
      message: json['message'] as String,
      code: $enumDecode(_$GptRunErrorCodeEnumMap, json['code']),
    );

Map<String, dynamic> _$GptRunErrorToJson(GptRunError instance) =>
    <String, dynamic>{
      'code': _$GptRunErrorCodeEnumMap[instance.code]!,
      'message': instance.message,
    };

const _$GptRunErrorCodeEnumMap = {
  GptRunErrorCode.serverError: 'server_error',
  GptRunErrorCode.rateLimitExceeded: 'rate_limit_exceeded',
};

CreateGptRunRequest _$CreateGptRunRequestFromJson(Map<String, dynamic> json) =>
    CreateGptRunRequest(
      assistantId: json['assistant_id'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
      instructions: json['instructions'] as String,
      model: json['model'] as String,
      tools: (json['tools'] as List<dynamic>)
          .map((e) => AssistantTool.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateGptRunRequestToJson(
        CreateGptRunRequest instance) =>
    <String, dynamic>{
      'assistant_id': instance.assistantId,
      'model': instance.model,
      'instructions': instance.instructions,
      'tools': instance.tools,
      'metadata': instance.metadata,
    };

ModifyGptRunRequest _$ModifyGptRunRequestFromJson(Map<String, dynamic> json) =>
    ModifyGptRunRequest(
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ModifyGptRunRequestToJson(
        ModifyGptRunRequest instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
    };

SubmitToolsOutputsRequest _$SubmitToolsOutputsRequestFromJson(
        Map<String, dynamic> json) =>
    SubmitToolsOutputsRequest(
      toolOutputs: (json['tool_outputs'] as List<dynamic>)
          .map((e) => GptSubmitToolsOutputs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubmitToolsOutputsRequestToJson(
        SubmitToolsOutputsRequest instance) =>
    <String, dynamic>{
      'tool_outputs': instance.toolOutputs,
    };

CreateAndRunThreadRequest _$CreateAndRunThreadRequestFromJson(
        Map<String, dynamic> json) =>
    CreateAndRunThreadRequest(
      assistantId: json['assistant_id'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      model: json['model'] as String?,
      instructions: json['instructions'] as String?,
      thread: json['thread'] == null
          ? null
          : GptRunThread.fromJson(json['thread'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateAndRunThreadRequestToJson(
    CreateAndRunThreadRequest instance) {
  final val = <String, dynamic>{
    'assistant_id': instance.assistantId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thread', instance.thread);
  writeNotNull('model', instance.model);
  writeNotNull('instructions', instance.instructions);
  writeNotNull('metadata', instance.metadata);
  return val;
}

GptRunThread _$GptRunThreadFromJson(Map<String, dynamic> json) => GptRunThread(
      metadata: json['metadata'] as Map<String, dynamic>?,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => GptThreadMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GptRunThreadToJson(GptRunThread instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('messages', instance.messages);
  writeNotNull('metadata', instance.metadata);
  return val;
}

GptRunStep _$GptRunStepFromJson(Map<String, dynamic> json) => GptRunStep(
      id: json['id'] as String,
      object: json['object'] as String? ?? "thread.run.step",
      threadId: json['thread_id'] as String,
      assistantId: json['assistant_id'] as String,
      createdAt: json['created_at'] as int,
      metadata: json['metadata'] as Map<String, dynamic>,
      status: $enumDecode(_$GptRunStatusEnumMap, json['status']),
      cancelledAt: json['cancelled_at'] as int?,
      completedAt: json['completed_at'] as int?,
      expiresAt: json['expires_at'] as int?,
      failedAt: json['failed_at'] as int?,
      lastError: json['last_error'] == null
          ? null
          : GptRunError.fromJson(json['last_error'] as Map<String, dynamic>),
      startedAt: json['started_at'] as int?,
      runId: json['run_id'] as String,
      type: $enumDecode(_$GptRunStepTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$GptRunStepToJson(GptRunStep instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'object': instance.object,
    'created_at': instance.createdAt,
    'assistant_id': instance.assistantId,
    'thread_id': instance.threadId,
    'run_id': instance.runId,
    'type': _$GptRunStepTypeEnumMap[instance.type]!,
    'status': _$GptRunStatusEnumMap[instance.status]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_error', instance.lastError);
  writeNotNull('expires_at', instance.expiresAt);
  writeNotNull('started_at', instance.startedAt);
  writeNotNull('cancelled_at', instance.cancelledAt);
  writeNotNull('failed_at', instance.failedAt);
  writeNotNull('completed_at', instance.completedAt);
  val['metadata'] = instance.metadata;
  return val;
}

const _$GptRunStepTypeEnumMap = {
  GptRunStepType.messageCreation: 'message_creation',
  GptRunStepType.toolCalls: 'tool_calls',
};
