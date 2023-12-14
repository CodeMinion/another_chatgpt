// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGptListRequest _$GetGptListRequestFromJson(Map<String, dynamic> json) =>
    GetGptListRequest(
      limit: json['limit'] as int? ?? 20,
      order: $enumDecodeNullable(_$GptOrderEnumMap, json['order']) ??
          GptOrder.desc,
      after: json['after'] as String?,
      before: json['before'] as String?,
    );

Map<String, dynamic> _$GetGptListRequestToJson(GetGptListRequest instance) {
  final val = <String, dynamic>{
    'limit': instance.limit,
    'order': _$GptOrderEnumMap[instance.order]!,
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

const _$GptOrderEnumMap = {
  GptOrder.asc: 'asc',
  GptOrder.desc: 'desc',
};

GptList<T> _$GptListFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    GptList<T>(
      object: json['object'] as String,
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$GptListToJson<T>(
  GptList<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data.map(toJsonT).toList(),
    };
