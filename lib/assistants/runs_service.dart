
import 'dart:convert';

import 'package:another_chatgpt/assistants/runs_dto.dart';
import 'package:another_chatgpt/common/common_dto.dart';
import 'package:http/http.dart' as http;

import '../error_models.dart';

class RunsService {

  final String baseUrl;
  final bool secure;

  RunsService({required this.baseUrl, required this.secure});

  /// Create a run.
  Future<GptRun> createRun({
    required String apiKey,
    required String organizationId,
    required String threadId,
    required CreateGptRunRequest request,
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
          baseUrl, "/v1/threads/$threadId/runs");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/threads/$threadId/runs");
    }

    var response = await
    http.post(endpoint, headers: headers, body:jsonEncode(request.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptRun.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw RunsException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Retrieves a run.
  Future<GptRun> retrieveRun({
    required String apiKey,
    required String organizationId,
    required String threadId,
    required String runId
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
          baseUrl, "/v1/threads/$threadId/runs/$runId");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/threads/$threadId/runs/$runId");
    }

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptRun.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw RunsException(statusCode: response.statusCode, message: error.message);
    }
  }


  /// Modify a run.
  Future<GptRun> modifyRun({
    required String apiKey,
    required String organizationId,
    required String threadId,
    required String runId,
    required ModifyGptRunRequest request,
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
          baseUrl, "/v1/threads/$threadId/runs/$runId");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/threads/$threadId/runs/$runId");
    }

    var response = await
    http.post(endpoint, headers: headers, body:jsonEncode(request.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptRun.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw RunsException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Lists runs
  Future<List<GptRun>> listRuns({
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
          baseUrl, "/v1/threads/$threadId/runs");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/threads/$threadId/runs");
    }

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptList<GptRun>.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)), (data)=> GptRun.fromJson(data as Map<String, dynamic>)).data;
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw RunsException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// When a run has the status: "requires_action" and required_action.type
  /// is submit_tool_outputs, this endpoint can be used to submit the outputs
  /// from the tool calls once they're all completed. All outputs must be
  /// submitted in a single request.
  Future<GptRun> submitToolOutputsToRun({
    required String apiKey,
    required String organizationId,
    required String threadId,
    required String runId,
    required SubmitToolsOutputsRequest request,
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
          baseUrl, "/v1/threads/$threadId/runs/$runId/submit_tool_outputs");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/threads/$threadId/runs/$runId/submit_tool_outputs");
    }

    var response = await
    http.post(endpoint, headers: headers, body:jsonEncode(request.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptRun.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw RunsException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Cancels a run that is in_progress.
  Future<GptRun> cancelRun({
    required String apiKey,
    required String organizationId,
    required String threadId,
    required String runId,
    required SubmitToolsOutputsRequest request,
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
          baseUrl, "/v1/threads/$threadId/runs/$runId/cancel");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/threads/$threadId/runs/$runId/cancel");
    }

    var response = await
    http.post(endpoint, headers: headers, body:jsonEncode(request.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptRun.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw RunsException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Create a thread and run it in one request.
  Future<GptRun> createThreadAndRun({
    required String apiKey,
    required String organizationId,
    required CreateAndRunThreadRequest request,
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
          baseUrl, "/v1/threads/runs");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "/v1/threads/runs");
    }

    var response = await
    http.post(endpoint, headers: headers, body:jsonEncode(request.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptRun.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw RunsException(statusCode: response.statusCode, message: error.message);
    }
  }

}

class RunsException implements Exception {
  final String? message;
  final int statusCode;

  RunsException({required this.statusCode, this.message});

  @override
  String toString() {
    return "RunsException: $statusCode - $message";
  }
}