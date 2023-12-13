
import 'dart:convert';

import 'package:another_chatgpt/assistants/assistants_dto.dart';
import 'package:another_chatgpt/error_models.dart';
import 'package:http/http.dart' as http;


class AssistantsService {

  final String baseUrl;
  final bool secure;

  AssistantsService({required this.baseUrl, required this.secure});

  ///
  /// Create an assistant with a model and instructions.
  ///
  Future<GptAssistant> createAssistant({
    required String apiKey,
    required String organizationId,
    required CreateGptAssistantRequest request,
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
          baseUrl, "/v1/chat/assistants");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/chat/assistants");
    }

    var response = await
    http.post(endpoint, headers: headers, body:jsonEncode(request.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptAssistant.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw AssistantException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Retrieves an assistant.
  Future<GptAssistant> retrieveAssistant({
    required String apiKey,
    required String organizationId,
    required String assistantId,
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
          baseUrl, "/v1/chat/assistants/$assistantId");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/chat/assistants/$assistantId");
    }

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptAssistant.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw AssistantException(statusCode: response.statusCode, message: error.message);
    }
  }


  /// Modifies an assistant.
  Future<GptAssistant> modifyAssistant({
    required String apiKey,
    required String organizationId,
    required String assistantId,
    required ModifyGptAssistantRequest request,
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
          baseUrl, "/v1/chat/assistants/$assistantId");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/chat/assistants/$assistantId");
    }

    var response = await
    http.post(endpoint, headers: headers, body:jsonEncode(request.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptAssistant.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw AssistantException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Delete an assistant.
  Future<void> deleteAssistant({
    required String apiKey,
    required String organizationId,
    required String assistantId,
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
          baseUrl, "/v1/chat/assistants/$assistantId");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/chat/assistants/$assistantId");
    }

    var response = await
    http.delete(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw AssistantException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Returns a list of assistants.
  Future<List<GptAssistant>> listAssistants({
    required String apiKey,
    required String organizationId,
    required GetAssistantListRequest request
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
          baseUrl, "/v1/chat/assistants", request.toJson());
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/chat/assistants", request.toJson());
    }

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return AssistantList.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes))).data;
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw AssistantException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Create an assistant file by attaching a File to an assistant.
  Future<AssistantFile> createAssistantFile({
    required String apiKey,
    required String organizationId,
    required String assistantId,
    required CreateAssistantFileRequest request,
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
          baseUrl, "/v1/chat/assistants/$assistantId/files");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/chat/assistants/$assistantId/files");
    }

    var response = await
    http.post(endpoint, headers: headers, body:jsonEncode(request.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return AssistantFile.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw AssistantException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Retrieves an AssistantFile.
  Future<AssistantFile> retrieveAssistantFile({
    required String apiKey,
    required String organizationId,
    required String assistantId,
    required String fileId
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
          baseUrl, "/v1/chat/assistants/$assistantId/files/$fileId");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/chat/assistants/$assistantId/files/$fileId");
    }

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return AssistantFile.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw AssistantException(statusCode: response.statusCode, message: error.message);
    }
  }

  Future<void> deleteAssistantFile({
    required String apiKey,
    required String organizationId,
    required String assistantId,
    required String fileId
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
          baseUrl, "/v1/chat/assistants/$assistantId/files/$fileId");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/chat/assistants/$assistantId/files/$fileId");
    }

    var response = await
    http.delete(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ;
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw AssistantException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Returns a list of assistant files.
  Future<List<AssistantFile>> listAssistantFiles({
    required String apiKey,
    required String organizationId,
    required String assistantId,
    required GetAssistantFileListRequest request
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
          baseUrl, "/v1/chat/assistants/$assistantId/files", request.toJson());
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/chat/assistants/$assistantId/files",request.toJson());
    }

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return AssistantFileList.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes))).data;
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw AssistantException(statusCode: response.statusCode, message: error.message);
    }
  }
}

class AssistantException implements Exception {
  final String? message;
  final int statusCode;

  AssistantException({required this.statusCode, this.message});

  @override
  String toString() {
    return "AssistantException: $statusCode - $message";
  }
}