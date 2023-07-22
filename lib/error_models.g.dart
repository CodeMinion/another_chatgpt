// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorMessage _$ErrorMessageFromJson(Map<String, dynamic> json) => ErrorMessage(
      message: json['message'] as String,
      type: json['type'] as String,
      code: json['code'] as String?,
      param: json['param'] as String?,
    );

Map<String, dynamic> _$ErrorMessageToJson(ErrorMessage instance) {
  final val = <String, dynamic>{
    'message': instance.message,
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('param', instance.param);
  writeNotNull('code', instance.code);
  return val;
}
