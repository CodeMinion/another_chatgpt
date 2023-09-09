
import 'dart:convert';

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