// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptImage _$GptImageFromJson(Map<String, dynamic> json) => GptImage(
      url: json['url'] as String?,
      b64Json: json['b64_json'] as String?,
    );

Map<String, dynamic> _$GptImageToJson(GptImage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('b64_json', instance.b64Json);
  return val;
}

ImageCreateRequest _$ImageCreateRequestFromJson(Map<String, dynamic> json) =>
    ImageCreateRequest(
      prompt: json['prompt'] as String,
      size: $enumDecodeNullable(_$ImageSizeEnumMap, json['size']) ??
          ImageSize.size256x256,
      n: json['n'] as int?,
      responseFormat: $enumDecodeNullable(
              _$ResponseFormatEnumMap, json['response_format']) ??
          ResponseFormat.url,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$ImageCreateRequestToJson(ImageCreateRequest instance) {
  final val = <String, dynamic>{
    'prompt': instance.prompt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('n', instance.n);
  val['size'] = _$ImageSizeEnumMap[instance.size]!;
  val['response_format'] = _$ResponseFormatEnumMap[instance.responseFormat]!;
  writeNotNull('user', instance.user);
  return val;
}

const _$ImageSizeEnumMap = {
  ImageSize.size256x256: '256x256',
  ImageSize.size512x512: '512x512',
  ImageSize.size1024x1024: '1024x1024',
};

const _$ResponseFormatEnumMap = {
  ResponseFormat.url: 'url',
  ResponseFormat.b64Json: 'b64_json',
};

Map<String, dynamic> _$ImageEditRequestToJson(ImageEditRequest instance) {
  final val = <String, dynamic>{
    'prompt': instance.prompt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('n', instance.n);
  val['size'] = _$ImageSizeEnumMap[instance.size]!;
  val['response_format'] = _$ResponseFormatEnumMap[instance.responseFormat]!;
  writeNotNull('user', instance.user);
  return val;
}

Map<String, dynamic> _$ImageVariationRequestToJson(
    ImageVariationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('n', instance.n);
  val['size'] = _$ImageSizeEnumMap[instance.size]!;
  val['response_format'] = _$ResponseFormatEnumMap[instance.responseFormat]!;
  writeNotNull('user', instance.user);
  return val;
}

GptImageResponse _$GptImageResponseFromJson(Map<String, dynamic> json) =>
    GptImageResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => GptImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: json['created'] as int,
    );

Map<String, dynamic> _$GptImageResponseToJson(GptImageResponse instance) =>
    <String, dynamic>{
      'created': instance.created,
      'data': instance.data,
    };
