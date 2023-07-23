library another_chatgpt;

import 'package:another_chatgpt/chat_service.dart/chats_dto.dart';
import 'package:another_chatgpt/chat_service.dart/chats_service.dart';
import 'package:another_chatgpt/completions/completions_dto.dart';
import 'package:another_chatgpt/completions/completions_service.dart';
import 'package:another_chatgpt/models/models_dto.dart';
import 'package:another_chatgpt/models/models_service.dart';

class GptClient {
  final String _baseUrl;
  final String _apiKey;
  final String _organizationId;
  final bool _secured = true;

  late ModelsService _modelsService;
  late ChatsService _chatsService;
  late CompletionsService _completionsService;

  GptClient(
      {required String apiKey,
      required String organizationId,
      String baseUrl = "api.openai.com"})
      : _baseUrl = baseUrl,
        _apiKey = apiKey,
        _organizationId = organizationId {
    _modelsService = ModelsService(baseUrl: baseUrl, secure: _secured);
    _chatsService = ChatsService(baseUrl: baseUrl, secure: _secured);
    _completionsService = CompletionsService(baseUrl: baseUrl, secure: _secured);
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
        apiKey: apiKey ?? _apiKey ?? "",
        organizationId: organizationId ?? _organizationId ?? "");
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
        apiKey: apiKey ?? _apiKey ?? "",
        organizationId: organizationId ?? _organizationId ?? "",
        modelId: modelId);
  }

  ///
  /// Creates a model response for the given chat conversation.
  ///
  Future<GptCompletion> createChatCompletion({
    String? apiKey,
    String? organizationId,
    required GptChatCompletionRequest request,
  }) async {
    return _chatsService.createChatCompletion(apiKey: apiKey ?? _apiKey ?? "",
        organizationId: organizationId ?? _organizationId ?? "", request: request);
  }

  ///
  /// Creates a completion for the provided prompt and parameters.
  ///
  Future<GptCompletion> createCompletion({
    String? apiKey,
    String? organizationId,
    required GptCompletionRequest request,
  }) async {
    return _completionsService.createCompletion(apiKey: apiKey ?? _apiKey ?? "",
        organizationId: organizationId ?? _organizationId ?? "", request: request);
  }
}
