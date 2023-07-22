
import 'dart:convert';

import 'package:another_chatgpt/error_models.dart';
import 'package:http/http.dart' as http;

import 'package:another_chatgpt/completions/completions_dto.dart';

class CompletionsService {

  final String baseUrl;
  final bool secure;

  CompletionsService({required this.baseUrl, required this.secure});

  ///
  /// Creates a completion for the provided prompt and parameters.
  ///
  Future<GptCompletion> createCompletion({
    required String apiKey,
    required String organizationId,
    required GptCompletionRequest request,
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
          baseUrl, "/v1/completions");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/completions");
    }

    var response = await
    http.post(endpoint, headers: headers, body:jsonEncode(request.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptCompletion.fromJson(jsonDecode(response.body));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CompletionsException(statusCode: response.statusCode, message: error.message);
    }
  }
}

///
/// Exception related to the Completions Service
///
class CompletionsException implements Exception {
  final String? message;
  final int statusCode;

  CompletionsException({required this.statusCode, this.message});

  @override
  String toString() {
    return "CompletionsException: $statusCode - $message";
  }
}