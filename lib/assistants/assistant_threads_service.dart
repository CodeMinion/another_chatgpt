
import 'dart:convert';

import 'package:another_chatgpt/error_models.dart';
import 'package:another_chatgpt/assistants/assistant_threads_dto.dart';
import 'package:http/http.dart' as http;

class AssistantThreadsService {

  final String baseUrl;
  final bool secure;

  AssistantThreadsService({required this.baseUrl, required this.secure});

  /// Create a thread.
  Future<GptThread> createThread({
    required String apiKey,
    required String organizationId,
    required CreateGptThreadRequest request,
  }) async {

    Map<String, String> headers = {
      "Authorization": "Bearer $apiKey",
      "OpenAI-Organization": organizationId,
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "OpenAI-Beta": "assistants=v1"
    };

    Uri endpoint;
    if(secure) {
      endpoint = Uri.https(
          baseUrl, "/v1/threads");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/threads");
    }

    var response = await
    http.post(endpoint, headers: headers, body:jsonEncode(request.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptThread.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw ThreadsException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Retrieves a thread.
  Future<GptThread> retrieveThread({
    required String apiKey,
    required String organizationId,
    required String threadId,
  }) async {

    Map<String, String> headers = {
      "Authorization": "Bearer $apiKey",
      "OpenAI-Organization": organizationId,
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "OpenAI-Beta": "assistants=v1"
    };


    Uri endpoint;
    if(secure) {
      endpoint = Uri.https(
          baseUrl, "/v1/threads/$threadId");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/threads/$threadId");
    }

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptThread.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw ThreadsException(statusCode: response.statusCode, message: error.message);
    }
  }


  /// Modifies a thread.
  Future<GptThread> modifyThread({
    required String apiKey,
    required String organizationId,
    required String threadId,
    required ModifyGptThreadRequest request,
  }) async {

    Map<String, String> headers = {
      "Authorization": "Bearer $apiKey",
      "OpenAI-Organization": organizationId,
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "OpenAI-Beta": "assistants=v1"
    };

    Uri endpoint;
    if(secure) {
      endpoint = Uri.https(
          baseUrl, "/v1/threads");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/threads");
    }

    var response = await
    http.post(endpoint, headers: headers, body:jsonEncode(request.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptThread.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw ThreadsException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Retrieves a thread.
  Future<void> deleteThread({
    required String apiKey,
    required String organizationId,
    required String threadId,
  }) async {

    Map<String, String> headers = {
      "Authorization": "Bearer $apiKey",
      "OpenAI-Organization": organizationId,
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "OpenAI-Beta": "assistants=v1"
    };


    Uri endpoint;
    if(secure) {
      endpoint = Uri.https(
          baseUrl, "/v1/threads/$threadId");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/threads/$threadId");
    }

    var response = await
    http.delete(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw ThreadsException(statusCode: response.statusCode, message: error.message);
    }
  }

}

class ThreadsException implements Exception {
  final String? message;
  final int statusCode;

  ThreadsException({required this.statusCode, this.message});

  @override
  String toString() {
    return "ThreadsException: $statusCode - $message";
  }
}