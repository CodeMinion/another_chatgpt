
import 'package:another_chatgpt/completions/completions_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chats_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class GptChatCompletion {
  String id;
  String object;
  int created;
  List<GptChoice> choices;
  GptUsage usage;
  String model;

  @JsonKey(name: "system_fingerprint")
  String? systemFingerprint;

  GptChatCompletion({required this.id, required this.object, required this.choices, required this.created, required this.usage, required this.model, this.systemFingerprint});

  factory GptChatCompletion.fromJson(Map<String, dynamic> json) =>
      _$GptChatCompletionFromJson(json);

  Map<String, dynamic> toJson() => _$GptChatCompletionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptChatCompletionRequest {

  String model;

  List<GptMessage> messages;

  double? temperature;

  @JsonKey(name: "top_p")
  double? topP;

  int? n;

  bool? stream;

  @JsonKey(name: "max_tokens")
  int? maxTokens;

  @JsonKey(name: "presence_penalty")
  int? presencePenalty;

  @JsonKey(name: "frequency_penalty")
  int? frequencyPenalty;

  String? user;

  GptChatCompletionRequest({required this.model, required this.messages, this.temperature, this.user, this.stream, this.frequencyPenalty, this.maxTokens, this.n, this.presencePenalty, this.topP});

  factory GptChatCompletionRequest.fromJson(Map<String, dynamic> json) =>
      _$GptChatCompletionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GptChatCompletionRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptFunction {

  String name;
  String? description;
  // TODO Add parameter support

  GptFunction({required this.name, this.description});

  factory GptFunction.fromJson(Map<String, dynamic> json) =>
      _$GptFunctionFromJson(json);

  Map<String, dynamic> toJson() => _$GptFunctionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}