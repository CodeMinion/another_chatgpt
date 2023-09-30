
import 'dart:convert';

import 'package:another_chatgpt/error_models.dart';
import 'package:http/http.dart' as http;

import 'package:another_chatgpt/chat_service/chats_dto.dart';
import 'package:another_chatgpt/completions/completions_dto.dart';

class ChatsService {

  final String baseUrl;
  final bool secure;

  ChatsService({required this.baseUrl, required this.secure});

  ///
  /// Creates a model response for the given chat conversation.
  ///
  Future<GptCompletion> createChatCompletion({
    required String apiKey,
    required String organizationId,
    required GptChatCompletionRequest request,
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
          baseUrl, "/v1/chat/completions");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/chat/completions");
    }

    var response = await
    http.post(endpoint, headers: headers, body:jsonEncode(request.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      //return GptCompletion.fromJson(jsonDecode(response.body));
      return GptCompletion.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw ChatsException(statusCode: response.statusCode, message: error.message);
    }
  }

}

///
/// Exception related to the Chats Service
///
class ChatsException implements Exception {
  final String? message;
  final int statusCode;

  ChatsException({required this.statusCode, this.message});

  @override
  String toString() {
    return "ChatsException: $statusCode - $message";
  }
}