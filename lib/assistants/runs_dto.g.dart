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
      output: json['output'] as String?,
    );

Map<String, dynamic> _$GptRunFunctionToJson(GptRunFunction instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'arguments': instance.arguments,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('output', instance.output);
  return val;
}

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
      metadata: json['metadata'] as Map<String, dynamic>?,
      instructions: json['instructions'] as String?,
      model: json['model'] as String?,
      tools: (json['tools'] as List<dynamic>?)
          ?.map((e) => AssistantTool.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateGptRunRequestToJson(CreateGptRunRequest instance) {
  final val = <String, dynamic>{
    'assistant_id': instance.assistantId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('model', instance.model);
  writeNotNull('instructions', instance.instructions);
  writeNotNull('tools', instance.tools);
  writeNotNull('metadata', instance.metadata);
  return val;
}

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
      stepDetails: const GptRunStepDetailConverter()
          .fromJson(json['step_details'] as Object),
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
    'step_details':
        const GptRunStepDetailConverter().toJson(instance.stepDetails),
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

GptRunMessageCreationStepDetail _$GptRunMessageCreationStepDetailFromJson(
        Map<String, dynamic> json) =>
    GptRunMessageCreationStepDetail(
      type: $enumDecodeNullable(_$GptRunStepTypeEnumMap, json['type']) ??
          GptRunStepType.messageCreation,
      messageCreation: GptRunMessageCreation.fromJson(
          json['message_creation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GptRunMessageCreationStepDetailToJson(
        GptRunMessageCreationStepDetail instance) =>
    <String, dynamic>{
      'type': _$GptRunStepTypeEnumMap[instance.type]!,
      'message_creation': instance.messageCreation,
    };

GptRunMessageCreation _$GptRunMessageCreationFromJson(
        Map<String, dynamic> json) =>
    GptRunMessageCreation(
      messageid: json['message_id'] as String,
    );

Map<String, dynamic> _$GptRunMessageCreationToJson(
        GptRunMessageCreation instance) =>
    <String, dynamic>{
      'message_id': instance.messageid,
    };

GptRunToolCallsStepDetail _$GptRunToolCallsStepDetailFromJson(
        Map<String, dynamic> json) =>
    GptRunToolCallsStepDetail(
      type: $enumDecodeNullable(_$GptRunStepTypeEnumMap, json['type']) ??
          GptRunStepType.toolCalls,
      toolCalls: (json['tool_calls'] as List<dynamic>)
          .map((e) => const GptRunToolCallConverter().fromJson(e as Object))
          .toList(),
    );

Map<String, dynamic> _$GptRunToolCallsStepDetailToJson(
        GptRunToolCallsStepDetail instance) =>
    <String, dynamic>{
      'type': _$GptRunStepTypeEnumMap[instance.type]!,
      'tool_calls': instance.toolCalls
          .map(const GptRunToolCallConverter().toJson)
          .toList(),
    };

GptRunRetrievalToolCall _$GptRunRetrievalToolCallFromJson(
        Map<String, dynamic> json) =>
    GptRunRetrievalToolCall(
      type: $enumDecode(_$GptToolCallTypeEnumMap, json['type']),
      id: json['id'] as String,
    );

Map<String, dynamic> _$GptRunRetrievalToolCallToJson(
        GptRunRetrievalToolCall instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$GptToolCallTypeEnumMap[instance.type]!,
    };

const _$GptToolCallTypeEnumMap = {
  GptToolCallType.codeInterpreter: 'code_interpreter',
  GptToolCallType.retrieval: 'retrieval',
  GptToolCallType.function: 'function',
};

GptRunFunctionToolCall _$GptRunFunctionToolCallFromJson(
        Map<String, dynamic> json) =>
    GptRunFunctionToolCall(
      type: $enumDecode(_$GptToolCallTypeEnumMap, json['type']),
      id: json['id'] as String,
      function:
          GptRunFunction.fromJson(json['function'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GptRunFunctionToolCallToJson(
        GptRunFunctionToolCall instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$GptToolCallTypeEnumMap[instance.type]!,
      'function': instance.function,
    };

GptRunCodeInterpreterToolCall _$GptRunCodeInterpreterToolCallFromJson(
        Map<String, dynamic> json) =>
    GptRunCodeInterpreterToolCall(
      type: $enumDecode(_$GptToolCallTypeEnumMap, json['type']),
      id: json['id'] as String,
      codeInterpreter: GptCodeInterpreter.fromJson(
          json['code_interpreter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GptRunCodeInterpreterToolCallToJson(
        GptRunCodeInterpreterToolCall instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$GptToolCallTypeEnumMap[instance.type]!,
      'code_interpreter': instance.codeInterpreter,
    };

GptCodeInterpreter _$GptCodeInterpreterFromJson(Map<String, dynamic> json) =>
    GptCodeInterpreter(
      input: json['input'] as String,
      outputs: (json['outputs'] as List<dynamic>)
          .map((e) => const CodeInterpreterConverter().fromJson(e as Object))
          .toList(),
    );

Map<String, dynamic> _$GptCodeInterpreterToJson(GptCodeInterpreter instance) =>
    <String, dynamic>{
      'input': instance.input,
      'outputs': instance.outputs
          .map(const CodeInterpreterConverter().toJson)
          .toList(),
    };

GptCodeInterpreterLogOutput _$GptCodeInterpreterLogOutputFromJson(
        Map<String, dynamic> json) =>
    GptCodeInterpreterLogOutput(
      type: $enumDecodeNullable(
              _$GptCodeInterpreterLogTypeEnumMap, json['type']) ??
          GptCodeInterpreterLogType.logs,
      logs: json['logs'] as String,
    );

Map<String, dynamic> _$GptCodeInterpreterLogOutputToJson(
        GptCodeInterpreterLogOutput instance) =>
    <String, dynamic>{
      'type': _$GptCodeInterpreterLogTypeEnumMap[instance.type]!,
      'logs': instance.logs,
    };

const _$GptCodeInterpreterLogTypeEnumMap = {
  GptCodeInterpreterLogType.logs: 'logs',
  GptCodeInterpreterLogType.image: 'image',
};

GptCodeInterpreterImageOutput _$GptCodeInterpreterImageOutputFromJson(
        Map<String, dynamic> json) =>
    GptCodeInterpreterImageOutput(
      type: $enumDecodeNullable(
              _$GptCodeInterpreterLogTypeEnumMap, json['type']) ??
          GptCodeInterpreterLogType.image,
      image: GptRunImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GptCodeInterpreterImageOutputToJson(
        GptCodeInterpreterImageOutput instance) =>
    <String, dynamic>{
      'type': _$GptCodeInterpreterLogTypeEnumMap[instance.type]!,
      'image': instance.image,
    };

GptRunImage _$GptRunImageFromJson(Map<String, dynamic> json) => GptRunImage(
      fileId: json['file_id'] as String,
    );

Map<String, dynamic> _$GptRunImageToJson(GptRunImage instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
    };
