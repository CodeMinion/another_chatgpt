import 'package:json_annotation/json_annotation.dart';

part 'completions_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class GptMessage {
  GptRole role;
  String content;
  String? name;

  GptMessage({required this.role, required this.content, this.name});

  factory GptMessage.fromJson(Map<String, dynamic> json) =>
      _$GptMessageFromJson(json);

  Map<String, dynamic> toJson() => _$GptMessageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptChoice {
  int index;
  GptMessage message;

  @JsonKey(name: "finish_reason")
  String finishReason;

  GptChoice({required this.index, required this.message, required this.finishReason});

  factory GptChoice.fromJson(Map<String, dynamic> json) =>
      _$GptChoiceFromJson(json);

  Map<String, dynamic> toJson() => _$GptChoiceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptUsage {
  @JsonKey(name: "prompt_tokens")
  int promptTokens;

  @JsonKey(name: "completion_tokens")
  int completionTokens;

  @JsonKey(name: "total_tokens")
  int totalTokens;

  GptUsage(
      {required this.completionTokens,
      required this.promptTokens,
      required this.totalTokens});

  factory GptUsage.fromJson(Map<String, dynamic> json) =>
      _$GptUsageFromJson(json);

  Map<String, dynamic> toJson() => _$GptUsageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptCompletion {
  String id;
  String object;
  int created;
  List<GptChoice> choices;
  GptUsage usage;

  GptCompletion(
      {required this.id,
      required this.object,
      required this.choices,
      required this.created,
      required this.usage});

  factory GptCompletion.fromJson(Map<String, dynamic> json) =>
      _$GptCompletionFromJson(json);

  Map<String, dynamic> toJson() => _$GptCompletionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptCompletionRequest {

  ///
  /// ID of the model to use. You can use the List models API to see all
  /// of your available models, or see our Model overview for
  /// descriptions of them.
  ///
  String model;

  ///
  /// The prompt(s) to generate completions for, encoded as a string,
  /// array of strings, array of tokens, or array of token arrays.
  ///
  /// Note that <|endoftext|> is the document separator
  /// that the model sees during training, so if a prompt is
  /// not specified the model will generate as if from the
  /// beginning of a new document
  ///
  List<String> prompt;

  ///
  /// The suffix that comes after a completion of inserted text.
  ///
  String? suffix;

  ///
  /// The maximum number of tokens to generate in the completion.
  ///
  /// The token count of your prompt plus max_tokens cannot
  /// exceed the model's context length.
  ///
  @JsonKey(name: "max_tokens")
  int? maxTokens;

  ///
  /// What sampling temperature to use, between 0 and 2.
  /// Higher values like 0.8 will make the output more random,
  /// while lower values like 0.2 will make it more focused and deterministic.
  ///
  /// We generally recommend altering this or top_p but not both.
  ///
  int? temperature;

  ///
  /// An alternative to sampling with temperature, called nucleus sampling,
  /// where the model considers the results of the tokens with
  /// top_p probability mass. So 0.1 means only the tokens comprising
  /// the top 10% probability mass are considered.
  ///
  /// We generally recommend altering this or temperature but not both.
  ///
  @JsonKey(name: "top_p")
  int? topP;

  ///
  /// How many completions to generate for each prompt.
  ///
  /// Note: Because this parameter generates many completions, it can
  /// quickly consume your token quota. Use carefully and ensure that you
  /// have reasonable settings for max_tokens and stop.
  ///
  int? n;

  ///
  /// Include the log probabilities on the logprobs most likely tokens,
  /// as well the chosen tokens. For example, if logprobs is 5,
  /// the API will return a list of the 5 most likely tokens.
  /// The API will always return the logprob of the sampled token,
  /// so there may be up to logprobs+1 elements in the response.
  ///
  /// The maximum value for logprobs is 5.
  ///
  int? logprobs;

  ///
  /// Echo back the prompt in addition to the completion
  ///
  bool? echo;

  ///
  /// Up to 4 sequences where the API will stop generating further tokens.
  /// The returned text will not contain the stop sequence.
  ///
  List<String>? stop;

  ///
  /// Number between -2.0 and 2.0. Positive values penalize new tokens based
  /// on whether they appear in the text so far, increasing the model's
  /// likelihood to talk about new topics.
  ///
  @JsonKey(name: "presence_penalty")
  int? presencePenalty;

  ///
  /// Number between -2.0 and 2.0. Positive values penalize new tokens
  /// based on their existing frequency in the text so far, decreasing
  /// the model's likelihood to repeat the same line verbatim.
  ///
  @JsonKey(name: "frequency_penalty")
  int? frequencyPenalty;

  ///
  /// Generates best_of completions server-side and returns the "best"
  /// (the one with the highest log probability per token).
  /// Results cannot be streamed.
  ///
  /// When used with n, best_of controls the number of candidate completions
  /// and n specifies how many to return – best_of must be greater than n.
  ///
  /// Note: Because this parameter generates many completions,
  /// it can quickly consume your token quota. Use carefully and ensure
  /// that you have reasonable settings for max_tokens and stop.
  ///
  @JsonKey(name: "best_of")
  int? bestOf;

  ///
  /// A unique identifier representing your end-user,
  /// which can help OpenAI to monitor and detect abuse.
  ///
  String? user;

  GptCompletionRequest({required this.model, required this.prompt, this.topP, this.presencePenalty, this.n, this.maxTokens, this.frequencyPenalty});

  factory GptCompletionRequest.fromJson(Map<String, dynamic> json) =>
      _$GptCompletionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GptCompletionRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum GptRole {
  system,
  user,
  assistant
}
