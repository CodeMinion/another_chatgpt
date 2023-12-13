// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assistants_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptAssistant _$GptAssistantFromJson(Map<String, dynamic> json) => GptAssistant(
      id: json['id'] as String,
      object: json['object'] as String? ?? "assistant",
      createdAt: json['created_at'] as int,
      name: json['name'] as String?,
      description: json['description'] as String?,
      model: json['model'] as String,
      instructions: json['instructions'] as String?,
      tools: (json['tools'] as List<dynamic>)
          .map((e) => AssistantTool.fromJson(e as Map<String, dynamic>))
          .toList(),
      fileIds:
          (json['file_ids'] as List<dynamic>).map((e) => e as String).toList(),
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$GptAssistantToJson(GptAssistant instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'object': instance.object,
    'created_at': instance.createdAt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  val['model'] = instance.model;
  writeNotNull('instructions', instance.instructions);
  val['tools'] = instance.tools;
  val['file_ids'] = instance.fileIds;
  val['metadata'] = instance.metadata;
  return val;
}

AssistantTool _$AssistantToolFromJson(Map<String, dynamic> json) =>
    AssistantTool(
      type: $enumDecode(_$AssistantToolTypeEnumMap, json['type']),
      function: json['function'] == null
          ? null
          : FunctionTool.fromJson(json['function'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssistantToolToJson(AssistantTool instance) {
  final val = <String, dynamic>{
    'type': _$AssistantToolTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('function', instance.function);
  return val;
}

const _$AssistantToolTypeEnumMap = {
  AssistantToolType.codeInterpreter: 'code_interpreter',
  AssistantToolType.retrieval: 'retrieval',
  AssistantToolType.function: 'function',
};

FunctionTool _$FunctionToolFromJson(Map<String, dynamic> json) => FunctionTool(
      name: json['name'] as String,
      description: json['description'] as String,
      paramters: json['paramters'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$FunctionToolToJson(FunctionTool instance) =>
    <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'paramters': instance.paramters,
    };

CreateGptAssistantRequest _$CreateGptAssistantRequestFromJson(
        Map<String, dynamic> json) =>
    CreateGptAssistantRequest(
      name: json['name'] as String?,
      description: json['description'] as String?,
      model: json['model'] as String,
      instructions: json['instructions'] as String?,
      tools: (json['tools'] as List<dynamic>?)
              ?.map((e) => AssistantTool.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      fileIds:
          (json['file_ids'] as List<dynamic>).map((e) => e as String).toList(),
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CreateGptAssistantRequestToJson(
    CreateGptAssistantRequest instance) {
  final val = <String, dynamic>{
    'model': instance.model,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('instructions', instance.instructions);
  val['tools'] = instance.tools;
  val['file_ids'] = instance.fileIds;
  val['metadata'] = instance.metadata;
  return val;
}

ModifyGptAssistantRequest _$ModifyGptAssistantRequestFromJson(
        Map<String, dynamic> json) =>
    ModifyGptAssistantRequest(
      name: json['name'] as String?,
      description: json['description'] as String?,
      model: json['model'] as String,
      instructions: json['instructions'] as String?,
      tools: (json['tools'] as List<dynamic>?)
              ?.map((e) => AssistantTool.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      fileIds:
          (json['file_ids'] as List<dynamic>).map((e) => e as String).toList(),
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ModifyGptAssistantRequestToJson(
    ModifyGptAssistantRequest instance) {
  final val = <String, dynamic>{
    'model': instance.model,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('instructions', instance.instructions);
  val['tools'] = instance.tools;
  val['file_ids'] = instance.fileIds;
  val['metadata'] = instance.metadata;
  return val;
}

AssistantList _$AssistantListFromJson(Map<String, dynamic> json) =>
    AssistantList(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => GptAssistant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AssistantListToJson(AssistantList instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data,
    };

GetAssistantListRequest _$GetAssistantListRequestFromJson(
        Map<String, dynamic> json) =>
    GetAssistantListRequest(
      limit: json['limit'] as int? ?? 20,
      order: $enumDecodeNullable(_$AssistantOrderEnumMap, json['order']) ??
          AssistantOrder.desc,
      after: json['after'] as String?,
      before: json['before'] as String?,
    );

Map<String, dynamic> _$GetAssistantListRequestToJson(
    GetAssistantListRequest instance) {
  final val = <String, dynamic>{
    'limit': instance.limit,
    'order': _$AssistantOrderEnumMap[instance.order]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('after', instance.after);
  writeNotNull('before', instance.before);
  return val;
}

const _$AssistantOrderEnumMap = {
  AssistantOrder.asc: 'asc',
  AssistantOrder.desc: 'desc',
};

AssistantFile _$AssistantFileFromJson(Map<String, dynamic> json) =>
    AssistantFile(
      id: json['id'] as String,
      object: json['object'] as String? ?? "assistant.file",
      createdAt: json['created_at'] as String,
      assistantId: json['assistant_id'] as String,
    );

Map<String, dynamic> _$AssistantFileToJson(AssistantFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created_at': instance.createdAt,
      'assistant_id': instance.assistantId,
    };

CreateAssistantFileRequest _$CreateAssistantFileRequestFromJson(
        Map<String, dynamic> json) =>
    CreateAssistantFileRequest(
      fileId: json['file_id'] as String,
    );

Map<String, dynamic> _$CreateAssistantFileRequestToJson(
        CreateAssistantFileRequest instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
    };

AssistantFileList _$AssistantFileListFromJson(Map<String, dynamic> json) =>
    AssistantFileList(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => AssistantFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AssistantFileListToJson(AssistantFileList instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data,
    };

GetAssistantFileListRequest _$GetAssistantFileListRequestFromJson(
        Map<String, dynamic> json) =>
    GetAssistantFileListRequest(
      limit: json['limit'] as int? ?? 20,
      order: $enumDecodeNullable(_$AssistantOrderEnumMap, json['order']) ??
          AssistantOrder.desc,
      after: json['after'] as String?,
      before: json['before'] as String?,
    );

Map<String, dynamic> _$GetAssistantFileListRequestToJson(
    GetAssistantFileListRequest instance) {
  final val = <String, dynamic>{
    'limit': instance.limit,
    'order': _$AssistantOrderEnumMap[instance.order]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('after', instance.after);
  writeNotNull('before', instance.before);
  return val;
}
