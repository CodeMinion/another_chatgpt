// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptFile _$GptFileFromJson(Map<String, dynamic> json) => GptFile(
      id: json['id'] as String,
      bytes: json['bytes'] as int,
      createdAt: json['created_at'] as int,
      filename: json['filename'] as String,
      object: json['object'] as String,
      purpose: $enumDecode(_$GptFilePurposeEnumMap, json['purpose']),
    );

Map<String, dynamic> _$GptFileToJson(GptFile instance) => <String, dynamic>{
      'id': instance.id,
      'bytes': instance.bytes,
      'created_at': instance.createdAt,
      'filename': instance.filename,
      'object': instance.object,
      'purpose': _$GptFilePurposeEnumMap[instance.purpose]!,
    };

const _$GptFilePurposeEnumMap = {
  GptFilePurpose.fineTune: 'fine-tune',
  GptFilePurpose.fineTuneResults: 'fine-tune-results',
  GptFilePurpose.assistants: 'assistants',
  GptFilePurpose.assistantsOutput: 'assistants_output',
};

ListFilesRequest _$ListFilesRequestFromJson(Map<String, dynamic> json) =>
    ListFilesRequest(
      purpose: $enumDecode(_$GptFilePurposeEnumMap, json['purpose']),
    );

Map<String, dynamic> _$ListFilesRequestToJson(ListFilesRequest instance) =>
    <String, dynamic>{
      'purpose': _$GptFilePurposeEnumMap[instance.purpose]!,
    };

CreateFileRequest _$CreateFileRequestFromJson(Map<String, dynamic> json) =>
    CreateFileRequest(
      purpose: $enumDecode(_$GptFilePurposeEnumMap, json['purpose']),
      fileName: json['fileName'] as String?,
    );

Map<String, dynamic> _$CreateFileRequestToJson(CreateFileRequest instance) {
  final val = <String, dynamic>{
    'purpose': _$GptFilePurposeEnumMap[instance.purpose]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fileName', instance.fileName);
  return val;
}
