
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
part 'image_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class GptImage {

  /// The URL of the generated image, if response_format is url (default).
  String? url;

  /// The base64-encoded JSON of the generated image, if response_format is b64_json.
  @JsonKey(name: "b64_json")
  String? b64Json;

  GptImage({this.url, this.b64Json});

  factory GptImage.fromJson(Map<String, dynamic> json) =>
      _$GptImageFromJson(json);

  Map<String, dynamic> toJson() => _$GptImageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ImageCreateRequest {

  /// A text description of the desired image(s). The maximum length is 1000 characters.
  String prompt;

  /// The model to use for image generation.
  String model;

  /// The number of images to generate. Must be between 1 and 10.
  int? n;

  // The size of the generated images. Must be one of 256x256, 512x512, or 1024x1024.
  ImageSize size;

  @JsonKey(name: "response_format")
  ResponseFormat responseFormat;

  /// The style of the generated images. Must be one of vivid or natural.
  /// Vivid causes the model to lean towards generating hyper-real and dramatic
  /// images. Natural causes the model to produce more natural, less hyper-real
  /// looking images. This param is only supported for dall-e-3.
  ImageStyle? style;

  /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. Learn more.
  String? user;

  ImageCreateRequest({required this.prompt, this.size = ImageSize.size256x256, this.n, this.responseFormat = ResponseFormat.url, this.user, this.model = "dall-e-2", this.style});

  factory ImageCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$ImageCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ImageCreateRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}


@JsonSerializable(includeIfNull: false, createToJson: true, createFactory: false)
class ImageEditRequest {

  /// The image to edit. Must be a valid PNG file, less than 4MB, and square.
  /// If mask is not provided, image must have transparency,
  /// which will be used as the mask.
  @JsonKey(includeFromJson: false, includeToJson: false)
  Uint8List imageBytes;

  /// An additional image whose fully transparent areas (e.g. where alpha is zero)
  /// indicate where image should be edited. Must be a valid PNG file,
  /// less than 4MB, and have the same dimensions as image.
  @JsonKey(includeFromJson: false, includeToJson: false)
  Uint8List? imageMaskBytes;

  /// A text description of the desired image(s). The maximum length is 1000 characters.
  String prompt;

  /// The model to use for image generation.
  String model;

  /// The number of images to generate. Must be between 1 and 10.
  int? n;

  // The size of the generated images. Must be one of 256x256, 512x512, or 1024x1024.
  ImageSize size;

  @JsonKey(name: "response_format")
  ResponseFormat responseFormat;

  /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. Learn more.
  String? user;

  ImageEditRequest({required this.imageBytes, required this.prompt, this.imageMaskBytes, this.size = ImageSize.size256x256, this.n, this.responseFormat = ResponseFormat.url, this.user, this.model = "dall-e-2"});

  Map<String, dynamic> toJson() => _$ImageEditRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, createToJson: true, createFactory: false)
class ImageVariationRequest {

  /// The image to use as the basis for the variation(s). Must be a valid PNG file, less than 4MB, and square.
  @JsonKey(includeFromJson: false, includeToJson: false)
  Uint8List imageBytes;

  /// The model to use for image generation.
  String model;

  /// The number of images to generate. Must be between 1 and 10.
  int? n;

  // The size of the generated images. Must be one of 256x256, 512x512, or 1024x1024.
  ImageSize size;

  @JsonKey(name: "response_format")
  ResponseFormat responseFormat;

  /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. Learn more.
  String? user;

  ImageVariationRequest({required this.imageBytes, this.size = ImageSize.size256x256, this.n, this.responseFormat = ResponseFormat.url, this.user, this.model = "dall-e-2"});

  Map<String, dynamic> toJson() => _$ImageVariationRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptImageResponse {

  int created;
  List<GptImage> data;

  GptImageResponse({required this.data, required this.created});

  factory GptImageResponse.fromJson(Map<String, dynamic> json) =>
      _$GptImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GptImageResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum ResponseFormat {
  url,
  @JsonValue("b64_json")
  b64Json
}

enum ImageSize {
  @JsonValue("256x256")
  size256x256,

  @JsonValue("512x512")
  size512x512,

  @JsonValue("1024x1024")
  size1024x1024,

  @JsonValue("1792x1024")
  size1792x1024,
  
  @JsonValue("1024x1792")
  size1024x1792,

}

enum ImageStyle {
  vivid,
  natural
}