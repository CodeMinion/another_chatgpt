// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptMessage _$GptMessageFromJson(Map<String, dynamic> json) => GptMessage(
      id: json['id'] as String,
      object: json['object'] as String? ?? "thread.message",
      threadId: json['thread_id'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      fileIds:
          (json['file_ids'] as List<dynamic>).map((e) => e as String).toList(),
      content: (json['content'] as List<dynamic>)
          .map((e) => GptThreadContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: $enumDecode(_$GptThreadRoleEnumMap, json['role']),
      createdAt: json['created_at'] as int,
      assistantId: json['assistant_id'] as String?,
      runId: json['run_id'] as String?,
    );

Map<String, dynamic> _$GptMessageToJson(GptMessage instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'object': instance.object,
    'created_at': instance.createdAt,
    'thread_id': instance.threadId,
    'role': _$GptThreadRoleEnumMap[instance.role]!,
    'content': instance.content,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('assistant_id', instance.assistantId);
  writeNotNull('run_id', instance.runId);
  val['file_ids'] = instance.fileIds;
  writeNotNull('metadata', instance.metadata);
  return val;
}

const _$GptThreadRoleEnumMap = {
  GptThreadRole.user: 'user',
  GptThreadRole.assistant: 'assistant',
};

GptThreadContent _$GptThreadContentFromJson(Map<String, dynamic> json) =>
    GptThreadContent(
      type: $enumDecode(_$GptThreadContentTypeEnumMap, json['type']),
      imageFile: json['image_file'] == null
          ? null
          : GptThreadContentImageFile.fromJson(
              json['image_file'] as Map<String, dynamic>),
      text: json['text'] == null
          ? null
          : GptThreadContentText.fromJson(json['text'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GptThreadContentToJson(GptThreadContent instance) {
  final val = <String, dynamic>{
    'type': _$GptThreadContentTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('image_file', instance.imageFile);
  writeNotNull('text', instance.text);
  return val;
}

const _$GptThreadContentTypeEnumMap = {
  GptThreadContentType.imageFile: 'image_file',
  GptThreadContentType.text: 'text',
};

GptThreadContentImageFile _$GptThreadContentImageFileFromJson(
        Map<String, dynamic> json) =>
    GptThreadContentImageFile(
      fileId: json['file_id'] as String,
    );

Map<String, dynamic> _$GptThreadContentImageFileToJson(
        GptThreadContentImageFile instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
    };

GptThreadContentText _$GptThreadContentTextFromJson(
        Map<String, dynamic> json) =>
    GptThreadContentText(
      value: json['value'] as String,
      annotations: (json['annotations'] as List<dynamic>)
          .map((e) => GptThreadAnnotation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GptThreadContentTextToJson(
        GptThreadContentText instance) =>
    <String, dynamic>{
      'value': instance.value,
      'annotations': instance.annotations,
    };

GptThreadAnnotation _$GptThreadAnnotationFromJson(Map<String, dynamic> json) =>
    GptThreadAnnotation(
      type: $enumDecode(_$GptContentTextTypeEnumMap, json['type']),
      startIndex: json['start_index'] as int,
      endIndex: json['end_index'] as int,
      text: json['text'] as String,
      fileCitation: json['file_citation'] == null
          ? null
          : GptThreadAnnotationFileCitation.fromJson(
              json['file_citation'] as Map<String, dynamic>),
      filePath: json['file_path'] == null
          ? null
          : GptThreadAnnotationFilePath.fromJson(
              json['file_path'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GptThreadAnnotationToJson(GptThreadAnnotation instance) {
  final val = <String, dynamic>{
    'type': _$GptContentTextTypeEnumMap[instance.type]!,
    'text': instance.text,
    'start_index': instance.startIndex,
    'end_index': instance.endIndex,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_citation', instance.fileCitation);
  writeNotNull('file_path', instance.filePath);
  return val;
}

const _$GptContentTextTypeEnumMap = {
  GptContentTextType.fileCitation: 'file_citation',
  GptContentTextType.filePath: 'file_path',
};

GptThreadAnnotationFileCitation _$GptThreadAnnotationFileCitationFromJson(
        Map<String, dynamic> json) =>
    GptThreadAnnotationFileCitation(
      fileId: json['file_id'] as String,
      quote: json['quote'] as String,
    );

Map<String, dynamic> _$GptThreadAnnotationFileCitationToJson(
        GptThreadAnnotationFileCitation instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
      'quote': instance.quote,
    };

GptThreadAnnotationFilePath _$GptThreadAnnotationFilePathFromJson(
        Map<String, dynamic> json) =>
    GptThreadAnnotationFilePath(
      fileId: json['file_id'] as String,
    );

Map<String, dynamic> _$GptThreadAnnotationFilePathToJson(
        GptThreadAnnotationFilePath instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
    };
