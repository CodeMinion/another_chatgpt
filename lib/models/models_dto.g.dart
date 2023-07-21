// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptModelDto _$GptModelDtoFromJson(Map<String, dynamic> json) => GptModelDto(
      id: json['id'] as String,
      ownedBy: json['owned_by'] as String,
      permission: (json['permission'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      object: json['object'] as String,
    );

Map<String, dynamic> _$GptModelDtoToJson(GptModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owned_by': instance.ownedBy,
      'permission': instance.permission,
      'object': instance.object,
    };

GptModelListDto _$GptModelListDtoFromJson(Map<String, dynamic> json) =>
    GptModelListDto(
      data: (json['data'] as List<dynamic>)
          .map((e) => GptModelDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      object: json['object'] as String,
    );

Map<String, dynamic> _$GptModelListDtoToJson(GptModelListDto instance) =>
    <String, dynamic>{
      'data': instance.data,
      'object': instance.object,
    };
