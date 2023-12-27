
import 'dart:convert';
import 'dart:typed_data';

import 'package:another_chatgpt/common/common_dto.dart';
import 'package:another_chatgpt/common/extensions.dart';
import 'package:another_chatgpt/error_models.dart';
import 'package:another_chatgpt/files/files_dto.dart';
import 'package:http/http.dart' as http;


class FilesService {

  final String baseUrl;
  final bool secure;

  FilesService({required this.baseUrl, required this.secure});


  /// Returns a list of files that belong to the user's organization.
  Future<List<GptFile>> listFiles({
    required String apiKey,
    required String organizationId,
    required ListFilesRequest request,
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
          baseUrl, "/v1/files", request.toJson().toQueryParam());
    }
    else {
      endpoint = Uri.http(
          baseUrl, "v1/files",request.toJson().toQueryParam());
    }

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptList.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)), (json)=> GptFile.fromJson(json as Map<String, dynamic>)).data;
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw FilesException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Upload a file that can be used across various endpoints.
  /// The size of all the files uploaded by one organization can be up to 100 GB.
  ///
  /// The size of individual files can be a maximum of 512 MB or
  /// 2 million tokens for Assistants. See the Assistants Tools guide
  /// to learn more about the types of files supported. The Fine-tuning
  /// API only supports .jsonl files.
  Future<GptFile> uploadFile({
    required String apiKey,
    required String organizationId,
    required CreateFileRequest request,
    required Uint8List fileBytes
  }) async {

    Map<String, String> headers = {
      "Authorization": "Bearer $apiKey",
      "OpenAI-Organization": organizationId,
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };


    Uri endpoint;
    if (secure) {
      endpoint =
          Uri.https(baseUrl, "/v1/files");
    } else {
      endpoint =
          Uri.http(baseUrl, "/v1/files");
    }

    String? targetFilename = request.fileName;
    request.fileName = null;
    var httpRequest = http.MultipartRequest('POST', endpoint)
      ..headers.addAll(headers)
      ..fields.addAll(
          request.toJson().map((key, value) => MapEntry(key, value.toString())))
      ..files.add(http.MultipartFile.fromBytes("file", fileBytes, filename: targetFilename));

    var response = await httpRequest.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptFile.fromJson(jsonDecode(
          const Utf8Decoder().convert(await response.stream.toBytes())));
    } else {
      var error = ServerError.fromJson(jsonDecode(
          const Utf8Decoder().convert(await response.stream.toBytes())));
      throw FilesException(
          statusCode: response.statusCode, message: error.message);
    }
  }

  /// Delete a file.
  Future<void> deleteFile({
    required String apiKey,
    required String organizationId,
    required String fileId,
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
          baseUrl, "/v1/files/$fileId");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "v1/files/$fileId");
    }

    var response = await
    http.delete(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw FilesException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Returns information about a specific file.
  Future<GptFile> retrieveFile({
    required String apiKey,
    required String organizationId,
    required String fileId,
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
          baseUrl, "/v1/files/$fileId");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "v1/files/$fileId");
    }

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GptFile.fromJson(jsonDecode(const Utf8Decoder().convert(response.bodyBytes)));
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw FilesException(statusCode: response.statusCode, message: error.message);
    }
  }

  /// Returns the contents of the specified file.
  Future<Uint8List> retrieveFileContent({
    required String apiKey,
    required String organizationId,
    required String fileId,
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
          baseUrl, "/v1/files/$fileId/content");
    }
    else {
      endpoint = Uri.http(
          baseUrl, "v1/files/$fileId/content");
    }

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.bodyBytes;
    }
    else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw FilesException(statusCode: response.statusCode, message: error.message);
    }
  }

}

///
/// Exception related to the Files Service
///
class FilesException implements Exception {
  final String? message;
  final int statusCode;

  FilesException({required this.statusCode, this.message});

  @override
  String toString() {
    return "FilesException: $statusCode - $message";
  }
}