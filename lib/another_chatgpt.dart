library another_chatgpt;

import 'dart:typed_data';

import 'package:another_chatgpt/assistants/assistants_service.dart';
import 'package:another_chatgpt/assistants/runs_service.dart';
import 'package:another_chatgpt/chats/chats_dto.dart';
import 'package:another_chatgpt/chats/chats_service.dart';
import 'package:another_chatgpt/completions/completions_dto.dart';
import 'package:another_chatgpt/completions/completions_service.dart';
import 'package:another_chatgpt/files/files_dto.dart';
import 'package:another_chatgpt/files/files_service.dart';
import 'package:another_chatgpt/images/image_dto.dart';
import 'package:another_chatgpt/images/image_service.dart';
import 'package:another_chatgpt/models/models_dto.dart';
import 'package:another_chatgpt/models/models_service.dart';
import 'package:another_chatgpt/assistants/assistant_threads_dto.dart';
import 'package:another_chatgpt/assistants/assistant_threads_service.dart';

import 'assistants/assistant_messages_service.dart';
import 'assistants/assistants_dto.dart';
import 'assistants/runs_dto.dart';
import 'common/common_dto.dart';
import 'assistants/assistant_messages_dto.dart';

class GptClient {
  final String _baseUrl;
  final String _apiKey;
  final String _organizationId;
  final bool _secured = true;

  late ModelsService _modelsService;
  late ChatsService _chatsService;
  late CompletionsService _completionsService;
  late ImagesService _imagesService;
  late RunsService _runsService;
  late AssistantsService _assistantsService;
  late AssistantThreadsService _threadsService;
  late AssistantMessageService _assistantMessageService;
  late FilesService _filesService;

  GptClient(
      {required String apiKey,
      required String organizationId,
      String baseUrl = "api.openai.com"})
      : _baseUrl = baseUrl,
        _apiKey = apiKey,
        _organizationId = organizationId {
    _modelsService = ModelsService(baseUrl: _baseUrl, secure: _secured);
    _chatsService = ChatsService(baseUrl: _baseUrl, secure: _secured);
    _completionsService =
        CompletionsService(baseUrl: _baseUrl, secure: _secured);
    _imagesService = ImagesService(baseUrl: _baseUrl, secure: _secured);
    _runsService = RunsService(baseUrl: _baseUrl, secure: _secured);
    _assistantsService = AssistantsService(baseUrl: _baseUrl, secure: _secured);
    _threadsService =
        AssistantThreadsService(baseUrl: _baseUrl, secure: _secured);
    _assistantMessageService =
        AssistantMessageService(baseUrl: _baseUrl, secure: _secured);
    _filesService = FilesService(baseUrl: _baseUrl, secure: _secured);
  }

  ///
  /// Lists the currently available models,
  /// and provides basic information about each one such as the
  /// owner and availability.
  ///
  Future<List<GptModelDto>> getModels({
    String? apiKey,
    String? organizationId,
  }) async {
    return _modelsService.getModels(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId);
  }

  ///
  /// Retrieves a model instance, providing basic information
  /// about the model such as the owner and permissioning.
  ///
  Future<GptModelDto> getModelById({
    String? apiKey,
    String? organizationId,
    required String modelId,
  }) async {
    return _modelsService.getModelById(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        modelId: modelId);
  }

  ///
  /// Creates a model response for the given chat conversation.
  ///
  Future<GptChatCompletion> createChatCompletion({
    String? apiKey,
    String? organizationId,
    required GptChatCompletionRequest request,
  }) async {
    return _chatsService.createChatCompletion(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        request: request);
  }

  ///
  /// Creates a completion for the provided prompt and parameters.
  ///
  Future<GptCompletion> createCompletion({
    String? apiKey,
    String? organizationId,
    required GptCompletionRequest request,
  }) async {
    return _completionsService.createCompletion(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        request: request);
  }

  ///// Images

  Future<List<GptImage>> createImage({
    String? apiKey,
    String? organizationId,
    required ImageCreateRequest request,
  }) async {
    return _imagesService.createImage(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        request: request);
  }

  ///
  /// Creates an edited or extended image given an original image and a prompt.
  ///
  Future<List<GptImage>> createImageEdit({
    String? apiKey,
    String? organizationId,
    required ImageEditRequest request,
  }) async {
    return _imagesService.createImageEdit(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        request: request);
  }

  ///
  /// Creates a variation of a given image.
  ///
  Future<List<GptImage>> createImageVariation({
    String? apiKey,
    String? organizationId,
    required ImageVariationRequest request,
  }) async {
    return _imagesService.createImageVariation(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        request: request);
  }

  /// Create a run.
  Future<GptRun> createRun({
    String? apiKey,
    String? organizationId,
    required String threadId,
    required CreateGptRunRequest request,
  }) async {
    return _runsService.createRun(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        threadId: threadId,
        request: request);
  }

  /// Retrieves a run.
  Future<GptRun> retrieveRun(
      {String? apiKey,
      String? organizationId,
      required String threadId,
      required String runId}) async {
    return _runsService.retrieveRun(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        threadId: threadId,
        runId: runId);
  }

  /// Modify a run.
  Future<GptRun> modifyRun({
    String? apiKey,
    String? organizationId,
    required String threadId,
    required String runId,
    required ModifyGptRunRequest request,
  }) async {
    return _runsService.modifyRun(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        threadId: threadId,
        runId: runId,
        request: request);
  }

  /// Lists runs
  Future<List<GptRun>> listRuns({
    String? apiKey,
    String? organizationId,
    required String threadId,
  }) async {
    return _runsService.listRuns(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        threadId: threadId);
  }

  /// When a run has the status: "requires_action" and required_action.type
  /// is submit_tool_outputs, this endpoint can be used to submit the outputs
  /// from the tool calls once they're all completed. All outputs must be
  /// submitted in a single request.
  Future<GptRun> submitToolOutputsToRun({
    String? apiKey,
    String? organizationId,
    required String threadId,
    required String runId,
    required SubmitToolsOutputsRequest request,
  }) async {
    return _runsService.submitToolOutputsToRun(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        threadId: threadId,
        runId: runId,
        request: request);
  }

  /// Cancels a run that is in_progress.
  Future<GptRun> cancelRun({
    String? apiKey,
    String? organizationId,
    required String threadId,
    required String runId,
  }) async {
    return _runsService.cancelRun(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        threadId: threadId,
        runId: runId);
  }

  /// Create a thread and run it in one request.
  Future<GptRun> createThreadAndRun({
    String? apiKey,
    String? organizationId,
    required CreateAndRunThreadRequest request,
  }) async {
    return _runsService.createThreadAndRun(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        request: request);
  }

  ///
  /// Create an assistant with a model and instructions.
  ///
  Future<GptAssistant> createAssistant({
    String? apiKey,
    String? organizationId,
    required CreateGptAssistantRequest request,
  }) async {
    return _assistantsService.createAssistant(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        request: request);
  }

  /// Retrieves an assistant.
  Future<GptAssistant> retrieveAssistant({
    String? apiKey,
    String? organizationId,
    required String assistantId,
  }) async {
    return _assistantsService.retrieveAssistant(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        assistantId: assistantId);
  }

  /// Modifies an assistant.
  Future<GptAssistant> modifyAssistant({
    String? apiKey,
    String? organizationId,
    required String assistantId,
    required ModifyGptAssistantRequest request,
  }) async {
    return _assistantsService.modifyAssistant(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        assistantId: assistantId,
        request: request);
  }

  /// Delete an assistant.
  Future<void> deleteAssistant({
    String? apiKey,
    String? organizationId,
    required String assistantId,
  }) async {
    return _assistantsService.deleteAssistant(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        assistantId: assistantId);
  }

  /// Returns a list of assistants.
  Future<List<GptAssistant>> listAssistants(
      {String? apiKey,
      String? organizationId,
      required GetGptListRequest request}) async {
    return _assistantsService.listAssistants(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        request: request);
  }

  /// Create an assistant file by attaching a File to an assistant.
  Future<AssistantFile> createAssistantFile({
    String? apiKey,
    String? organizationId,
    required String assistantId,
    required CreateAssistantFileRequest request,
  }) async {
    return _assistantsService.createAssistantFile(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        assistantId: assistantId,
        request: request);
  }

  /// Retrieves an AssistantFile.
  Future<AssistantFile> retrieveAssistantFile(
      {String? apiKey,
      String? organizationId,
      required String assistantId,
      required String fileId}) async {
    return _assistantsService.retrieveAssistantFile(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        assistantId: assistantId,
        fileId: fileId);
  }

  Future<void> deleteAssistantFile(
      {String? apiKey,
      String? organizationId,
      required String assistantId,
      required String fileId}) async {
    return _assistantsService.deleteAssistantFile(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        assistantId: assistantId,
        fileId: fileId);
  }

  /// Returns a list of assistant files.
  Future<List<AssistantFile>> listAssistantFiles(
      {String? apiKey,
      String? organizationId,
      required String assistantId,
      required GetGptListRequest request}) async {
    return _assistantsService.listAssistantFiles(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        assistantId: assistantId,
        request: request);
  }

  /// Create a thread.
  Future<GptThread> createThread({
    String? apiKey,
    String? organizationId,
    required CreateGptThreadRequest request,
  }) async {
    return _threadsService.createThread(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        request: request);
  }

  /// Retrieves a thread.
  Future<GptThread> retrieveThread({
    String? apiKey,
    String? organizationId,
    required String threadId,
  }) async {
    return _threadsService.retrieveThread(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        threadId: threadId);
  }

  /// Modifies a thread.
  Future<GptThread> modifyThread({
    String? apiKey,
    String? organizationId,
    required String threadId,
    required ModifyGptThreadRequest request,
  }) async {
    return _threadsService.modifyThread(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        threadId: threadId,
        request: request);
  }

  /// Retrieves a thread.
  Future<void> deleteThread({
    String? apiKey,
    String? organizationId,
    required String threadId,
  }) async {
    return _threadsService.deleteThread(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        threadId: threadId);
  }

  /// Create a message.
  Future<GptAssistantMessage> createMessage({
    String? apiKey,
    String? organizationId,
    required String threadId,
    required CreateGptMessageRequest request,
  }) async {
    return _assistantMessageService.createMessage(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        threadId: threadId,
        request: request);
  }

  /// Retrieves a message.
  Future<GptAssistantMessage> retrieveMessage({
    String? apiKey,
    String? organizationId,
    required String threadId,
    required String messageId,
  }) async {
    return _assistantMessageService.retrieveMessage(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        threadId: threadId,
        messageId: messageId);
  }

  /// Modifies a message.
  Future<GptAssistantMessage> modifyMessage({
    String? apiKey,
    String? organizationId,
    required String threadId,
    required String messageId,
    required CreateGptMessageRequest request,
  }) async {
    return _assistantMessageService.modifyMessage(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        threadId: threadId,
        messageId: messageId,
        request: request);
  }

  Future<List<GptAssistantMessage>> listMessages(
      {String? apiKey,
      String? organizationId,
      required String threadId,
      required GetGptListRequest request}) async {
    return _assistantMessageService.listMessages(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        threadId: threadId,
        request: request);
  }

  /// Retrieves a message file.
  Future<GptMessageFile> retrieveMessageFile(
      {String? apiKey,
      String? organizationId,
      required String threadId,
      required String messageId,
      required String fileId}) async {
    return _assistantMessageService.retrieveMessageFile(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        threadId: threadId,
        messageId: messageId,
        fileId: fileId);
  }

  /// Returns a list of message files.
  Future<List<GptMessageFile>> listMessageFiles(
      {String? apiKey,
      String? organizationId,
      required String threadId,
      required String messageId,
      required GetGptListRequest request}) async {
    return _assistantMessageService.listMessageFiles(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        threadId: threadId,
        messageId: messageId,
        request: request);
  }

  /// Returns a list of files that belong to the user's organization.
  Future<List<GptFile>> listFiles({
    String? apiKey,
    String? organizationId,
    required ListFilesRequest request,
  }) async {
    return _filesService.listFiles(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        request: request);
  }

  /// Upload a file that can be used across various endpoints.
  /// The size of all the files uploaded by one organization can be up to 100 GB.
  ///
  /// The size of individual files can be a maximum of 512 MB or
  /// 2 million tokens for Assistants. See the Assistants Tools guide
  /// to learn more about the types of files supported. The Fine-tuning
  /// API only supports .jsonl files.
  Future<GptFile> uploadFile(
      {String? apiKey,
      String? organizationId,
      required CreateFileRequest request,
      required Uint8List fileBytes}) async {
    return _filesService.uploadFile(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        request: request,
        fileBytes: fileBytes);
  }

  /// Delete a file.
  Future<void> deleteFile({
    String? apiKey,
    String? organizationId,
    required String fileId,
  }) async {
    return _filesService.deleteFile(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        fileId: fileId);
  }

  /// Returns information about a specific file.
  Future<GptFile> retrieveFile({
    String? apiKey,
    String? organizationId,
    required String fileId,
  }) async {
    return _filesService.retrieveFile(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        fileId: fileId);
  }

  /// Returns the contents of the specified file.
  Future<Uint8List> retrieveFileContent({
    String? apiKey,
    String? organizationId,
    required String fileId,
  }) async {
    return _filesService.retrieveFileContent(
        apiKey: apiKey ?? _apiKey,
        organizationId: organizationId ?? _organizationId,
        fileId: fileId);
  }
}
