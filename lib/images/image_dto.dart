
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

  /// The number of images to generate. Must be between 1 and 10.
  int? n;

  // The size of the generated images. Must be one of 256x256, 512x512, or 1024x1024.
  ImageSize size;

  @JsonKey(name: "response_format")
  ResponseFormat responseFormat;

  /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. Learn more.
  String? user;

  ImageCreateRequest({required this.prompt, this.size = ImageSize.size256x256, this.n, this.responseFormat = ResponseFormat.url, this.user});

  factory ImageCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$ImageCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ImageCreateRequestToJson(this);

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
  size1024x1024

}