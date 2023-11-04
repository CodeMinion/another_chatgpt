
import 'dart:convert';
import 'dart:typed_data';

import 'package:another_chatgpt/error_models.dart';
import 'package:another_chatgpt/images/image_dto.dart';
import 'package:http/http.dart' as http;

class ImagesService {

  final String baseUrl;
  final bool secure;

  ImagesService({required this.baseUrl, required this.secure});

  ///
  /// Creates an image given a prompt.
  ///
  Future<List<GptImage>> createImage({
    required String apiKey,
    required String organizationId,
    required ImageCreateRequest request,
  }) async {

    Map<String, String> headers = {
      "Authorization": "Bearer $apiKey",
      "OpenAI-Organization": organizationId,
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };


    Uri endpoint;
    if(secure) {
      endpoint = Uri.https(
          baseUrl, "/v1/images/generations");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/images/generations");
    }

    var response = await
    http.post(endpoint, headers: headers, body:jsonEncode(request.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      //return GptCompletion.fromJson(jsonDecode(response.body));
      GptImageResponse responseDto =  GptImageResponse.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
      return responseDto.data;
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw ImageException(statusCode: response.statusCode, message: error.message);
    }
  }

  ///
  /// Creates an edited or extended image given an original image and a prompt.
  ///
  Future<List<GptImage>> createImageEdit({
    required String apiKey,
    required String organizationId,
    required ImageEditRequest request,
  }) async {

    Map<String, String> headers = {
      "Authorization": "Bearer $apiKey",
      "OpenAI-Organization": organizationId,
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };


    Uri endpoint;
    if(secure) {
      endpoint = Uri.https(
          baseUrl, "/v1/images/edits");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/images/edits");
    }


    Uint8List imageBytes = request.imageBytes;
    Uint8List? maskBytes = request.imageMaskBytes;
    // Remove the image fields, we need to send them as files.
    var jsonRequest = request.toJson()..remove("imageBytes")..remove("imageMaskBytes");

    var requestPost = http.MultipartRequest('POST', endpoint)
      ..headers.addAll(headers)
      ..fields.addAll(
          jsonRequest.map((key, value) => MapEntry(key, value.toString())))
      ..files.add(http.MultipartFile.fromBytes("image", imageBytes, filename: "image.png"));


    if(maskBytes!= null) {
      requestPost.files.add(http.MultipartFile.fromBytes("mask", maskBytes, filename: "mask.png"));
    }

    var response = await requestPost.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      GptImageResponse responseDto =  GptImageResponse.fromJson(jsonDecode(const Utf8Decoder().convert(await response.stream.toBytes())));
      return responseDto.data;
    }
    else {
      var error = ServerError.fromJson(jsonDecode(const Utf8Decoder().convert(await response.stream.toBytes())));
      throw ImageException(statusCode: response.statusCode, message: error.message);
    }
  }

  ///
  /// Creates a variation of a given image.
  ///
  Future<List<GptImage>> createImageVariation({
    required String apiKey,
    required String organizationId,
    required ImageVariationRequest request,
  }) async {

    Map<String, String> headers = {
      "Authorization": "Bearer $apiKey",
      "OpenAI-Organization": organizationId,
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };


    Uri endpoint;
    if(secure) {
      endpoint = Uri.https(
          baseUrl, "/v1/images/variations");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/images/variations");
    }


    Uint8List imageBytes = request.imageBytes;
    // Remove the image fields, we need to send them as files.
    var jsonRequest = request.toJson()..remove("imageBytes");

    var requestPost = http.MultipartRequest('POST', endpoint)
      ..headers.addAll(headers)
      ..fields.addAll(
          jsonRequest.map((key, value) => MapEntry(key, value.toString())))
      ..files.add(http.MultipartFile.fromBytes("image", imageBytes, filename: "image.png"));

    var response = await requestPost.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      GptImageResponse responseDto =  GptImageResponse.fromJson(jsonDecode(const Utf8Decoder().convert(await response.stream.toBytes())));
      return responseDto.data;
    }
    else {
      var error = ServerError.fromJson(jsonDecode(const Utf8Decoder().convert(await response.stream.toBytes())));
      throw ImageException(statusCode: response.statusCode, message: error.message);
    }
  }
}

///
/// Exception related to the Image Service
///
class ImageException implements Exception {
  final String? message;
  final int statusCode;

  ImageException({required this.statusCode, this.message});

  @override
  String toString() {
    return "ImageException: $statusCode - $message";
  }
}