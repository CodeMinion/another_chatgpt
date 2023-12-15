
import 'dart:convert';

import 'package:another_chatgpt/common/extensions.dart';
import 'package:http/http.dart' as http;

import '../common/common_dto.dart';
import '../error_models.dart';
import '../assistants/assistant_messages_dto.dart';

class AssistantMessageService {

  final String baseUrl;
  final bool secure;

  AssistantMessageService({required this.baseUrl, required this.secure});

  /// Create a message.
  Future<GptAssistantMessage> createMessage({
    required String apiKey,
    required String organizationId,
    required String threadId,
    required CreateGptMessageRequest request,
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
          baseUrl, "/v1/threads/$threadId/messages");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/threads/$threadId/messages");
    }

    var response = await
    http.post(endpoint, headers: headers, body:jsonEncode(request.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptAssistantMessage.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw MessagesException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Retrieves a message.
  Future<GptAssistantMessage> retrieveMessage({
    required String apiKey,
    required String organizationId,
    required String threadId,
    required String messageId,
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
          baseUrl, "/v1/threads/$threadId/messages/$messageId");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/threads/$threadId/messages/$messageId");
    }

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptAssistantMessage.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw MessagesException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Modifies a message.
  Future<GptAssistantMessage> modifyMessage({
    required String apiKey,
    required String organizationId,
    required String threadId,
    required String messageId,
    required CreateGptMessageRequest request,
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
          baseUrl, "/v1/threads/$threadId/messages/$messageId");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/threads/$threadId/messages/$messageId");
    }

    var response = await
    http.post(endpoint, headers: headers, body:jsonEncode(request.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptAssistantMessage.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw MessagesException(statusCode: response.statusCode, message: error.message);
    }
  }

  Future<List<GptAssistantMessage>> listMessages({
    required String apiKey,
    required String organizationId,
    required String threadId,
    required GetGptListRequest request
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
          baseUrl, "/v1/threads/$threadId/messages", request.toJson().toQueryParam());
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/threads/$threadId/messages",request.toJson().toQueryParam());
    }

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptList<GptAssistantMessage>.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)), (data)=> GptAssistantMessage.fromJson(data as Map<String, dynamic>)).data;
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw MessagesException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Retrieves a message file.
  Future<GptMessageFile> retrieveMessageFile({
    required String apiKey,
    required String organizationId,
    required String threadId,
    required String messageId,
    required String fileId
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
          baseUrl, "/v1/threads/$threadId/messages/$messageId/files/$fileId");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/threads/$threadId/messages/$messageId/files/$fileId");
    }

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptMessageFile.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw MessagesException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Returns a list of message files.
  Future<List<GptMessageFile>> listMessageFiles({
    required String apiKey,
    required String organizationId,
    required String threadId,
    required String messageId,
    required GetGptListRequest request
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
          baseUrl, "/v1/threads/$threadId/messages/$messageId/files", request.toJson().toQueryParam());
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/threads/$threadId/messages/$messageId/files",request.toJson().toQueryParam());
    }

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptMessageFileList.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes))).data;
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw MessagesException(statusCode: response.statusCode, message: error.message);
    }
  }


}

class MessagesException implements Exception {
  final String? message;
  final int statusCode;

  MessagesException({required this.statusCode, this.message});

  @override
  String toString() {
    return "MessagesException: $statusCode - $message";
  }
}