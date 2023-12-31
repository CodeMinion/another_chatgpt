// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptImage _$GptImageFromJson(Map<String, dynamic> json) => GptImage(
      url: json['url'] as String?,
      b64Json: json['b64_json'] as String?,
    )..revisedPrompt = json['revised_prompt'] as String?;

Map<String, dynamic> _$GptImageToJson(GptImage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('b64_json', instance.b64Json);
  writeNotNull('revised_prompt', instance.revisedPrompt);
  return val;
}

ImageCreateRequest _$ImageCreateRequestFromJson(Map<String, dynamic> json) =>
    ImageCreateRequest(
      prompt: json['prompt'] as String,
      size: $enumDecodeNullable(_$ImageSizeEnumMap, json['size']) ??
          ImageSize.size256x256,
      n: json['n'] as int?,
      quality: $enumDecodeNullable(_$ImageQualityEnumMap, json['quality']),
      responseFormat: $enumDecodeNullable(
              _$ResponseFormatEnumMap, json['response_format']) ??
          ResponseFormat.url,
      user: json['user'] as String?,
      model: json['model'] as String? ?? "dall-e-2",
      style: $enumDecodeNullable(_$ImageStyleEnumMap, json['style']),
    );

Map<String, dynamic> _$ImageCreateRequestToJson(ImageCreateRequest instance) {
  final val = <String, dynamic>{
    'prompt': instance.prompt,
    'model': instance.model,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('n', instance.n);
  writeNotNull('quality', _$ImageQualityEnumMap[instance.quality]);
  val['size'] = _$ImageSizeEnumMap[instance.size]!;
  val['response_format'] = _$ResponseFormatEnumMap[instance.responseFormat]!;
  writeNotNull('style', _$ImageStyleEnumMap[instance.style]);
  writeNotNull('user', instance.user);
  return val;
}

const _$ImageSizeEnumMap = {
  ImageSize.size256x256: '256x256',
  ImageSize.size512x512: '512x512',
  ImageSize.size1024x1024: '1024x1024',
  ImageSize.size1792x1024: '1792x1024',
  ImageSize.size1024x1792: '1024x1792',
};

const _$ImageQualityEnumMap = {
  ImageQuality.standard: 'standard',
  ImageQuality.hd: 'hd',
};

const _$ResponseFormatEnumMap = {
  ResponseFormat.url: 'url',
  ResponseFormat.b64Json: 'b64_json',
};

const _$ImageStyleEnumMap = {
  ImageStyle.vivid: 'vivid',
  ImageStyle.natural: 'natural',
};

Map<String, dynamic> _$ImageEditRequestToJson(ImageEditRequest instance) {
  final val = <String, dynamic>{
    'prompt': instance.prompt,
    'model': instance.model,
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
  final val = <String, dynamic>{
    'model': instance.model,
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
