
import 'dart:convert';

import 'package:another_chatgpt/error_models.dart';
import 'package:another_chatgpt/models/models_dto.dart';
import 'package:http/http.dart' as http;


class ModelsService {

  final String baseUrl;
  final bool secure;

  ModelsService({required this.baseUrl, required this.secure});

  ///
  /// Lists the currently available models,
  /// and provides basic information about each one such as the
  /// owner and availability.
  ///
  Future<List<GptModelDto>> getModels({
    required String apiKey,
    required String organizationId,
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
          baseUrl, "/v1/models");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/models");
    }

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptModelListDto.fromJson(jsonDecode(response.body)).data;
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw ModelsException(statusCode: response.statusCode, message: error.message);
    }
  }

  ///
  /// Retrieves a model instance, providing basic information
  /// about the model such as the owner and permissioning.
  ///
  Future<GptModelDto> getModelById({
    required String apiKey,
    required String organizationId,
    required String modelId,
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
          baseUrl, "/v1/models/$modelId");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/models/$modelId");
    }

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptModelDto.fromJson(jsonDecode(response.body));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw ModelsException(statusCode: response.statusCode, message: error.message);
    }
  }
}

///
/// Exception related to the Models Service
///
class ModelsException implements Exception {
  final String? message;
  final int statusCode;

  ModelsException({required this.statusCode, this.message});

  @override
  String toString() {
    return "ModelsException: $statusCode - $message";
  }
}