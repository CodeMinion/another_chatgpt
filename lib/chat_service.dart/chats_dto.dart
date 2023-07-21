
import 'package:another_chatgpt/completions/completions_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chats_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class GptChatCompletionRequest {

  String model;

  List<GptMessage> messages;

  int? temperature;

  @JsonKey(name: "top_p")
  int? topP;

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