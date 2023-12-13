// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'threads_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptThread _$GptThreadFromJson(Map<String, dynamic> json) => GptThread(
      id: json['id'] as String,
      object: json['object'] as String? ?? "thread",
      createdAt: json['created_at'] as int,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$GptThreadToJson(GptThread instance) {
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

  writeNotNull('metadata', instance.metadata);
  return val;
}

CreateGptThreadRequest _$CreateGptThreadRequestFromJson(
        Map<String, dynamic> json) =>
    CreateGptThreadRequest(
      metadata: json['metadata'] as Map<String, dynamic>?,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => GptThreadMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateGptThreadRequestToJson(
    CreateGptThreadRequest instance) {
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

GptThreadMessage _$GptThreadMessageFromJson(Map<String, dynamic> json) =>
    GptThreadMessage(
      role: $enumDecode(_$GptThreadRoleEnumMap, json['role']),
      content: json['content'] as String,
      fileIds: (json['file_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$GptThreadMessageToJson(GptThreadMessage instance) {
  final val = <String, dynamic>{
    'role': _$GptThreadRoleEnumMap[instance.role]!,
    'content': instance.content,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_ids', instance.fileIds);
  writeNotNull('metadata', instance.metadata);
  return val;
}

const _$GptThreadRoleEnumMap = {
  GptThreadRole.user: 'user',
};

ModifyGptThreadRequest _$ModifyGptThreadRequestFromJson(
        Map<String, dynamic> json) =>
    ModifyGptThreadRequest(
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ModifyGptThreadRequestToJson(
    ModifyGptThreadRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metadata', instance.metadata);
  return val;
}
