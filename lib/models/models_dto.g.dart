// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptModelDto _$GptModelDtoFromJson(Map<String, dynamic> json) => GptModelDto(
      id: json['id'] as String,
      ownedBy: json['owned_by'] as String,
      permission: (json['permission'] as List<dynamic>)
          .map((e) => GptPermission.fromJson(e as Map<String, dynamic>))
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

GptPermission _$GptPermissionFromJson(Map<String, dynamic> json) =>
    GptPermission(
      created: json['created'] as int,
      object: json['object'] as String,
      id: json['id'] as String,
      group: json['group'] as String?,
      allowCreateEngine: json['allow_create_engine'] as bool,
      allowFineTuning: json['allow_fine_tuning'] as bool,
      allowLogprobs: json['allow_logprobs'] as bool,
      allowSampling: json['allow_sampling'] as bool,
      allowSearchIndices: json['allow_search_indices'] as bool,
      allowView: json['allow_view'] as bool,
      isBlocking: json['is_blocking'] as bool,
      organization: json['organization'] as String,
    );

Map<String, dynamic> _$GptPermissionToJson(GptPermission instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'object': instance.object,
    'created': instance.created,
    'allow_create_engine': instance.allowCreateEngine,
    'allow_sampling': instance.allowSampling,
    'allow_logprobs': instance.allowLogprobs,
    'allow_search_indices': instance.allowSearchIndices,
    'allow_view': instance.allowView,
    'allow_fine_tuning': instance.allowFineTuning,
    'organization': instance.organization,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('group', instance.group);
  val['is_blocking'] = instance.isBlocking;
  return val;
}

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
