// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptMessage _$GptMessageFromJson(Map<String, dynamic> json) => GptMessage(
      role: $enumDecode(_$GptRoleEnumMap, json['role']),
      content: json['content'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GptMessageToJson(GptMessage instance) {
  final val = <String, dynamic>{
    'role': _$GptRoleEnumMap[instance.role]!,
    'content': instance.content,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}

const _$GptRoleEnumMap = {
  GptRole.system: 'system',
  GptRole.user: 'user',
  GptRole.assistant: 'assistant',
};

GptChoice _$GptChoiceFromJson(Map<String, dynamic> json) => GptChoice(
      index: json['index'] as int,
      message: GptMessage.fromJson(json['message'] as Map<String, dynamic>),
      finishReason: json['finish_reason'] as String,
    );

Map<String, dynamic> _$GptChoiceToJson(GptChoice instance) => <String, dynamic>{
      'index': instance.index,
      'message': instance.message,
      'finish_reason': instance.finishReason,
    };

GptUsage _$GptUsageFromJson(Map<String, dynamic> json) => GptUsage(
      completionTokens: json['completion_tokens'] as int,
      promptTokens: json['prompt_tokens'] as int,
      totalTokens: json['total_tokens'] as int,
    );

Map<String, dynamic> _$GptUsageToJson(GptUsage instance) => <String, dynamic>{
      'prompt_tokens': instance.promptTokens,
      'completion_tokens': instance.completionTokens,
      'total_tokens': instance.totalTokens,
    };

GptCompletion _$GptCompletionFromJson(Map<String, dynamic> json) =>
    GptCompletion(
      id: json['id'] as String,
      object: json['object'] as String,
      choices: (json['choices'] as List<dynamic>)
          .map((e) => GptChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: json['created'] as int,
      usage: GptUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GptCompletionToJson(GptCompletion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'choices': instance.choices,
      'usage': instance.usage,
    };

GptCompletionRequest _$GptCompletionRequestFromJson(
        Map<String, dynamic> json) =>
    GptCompletionRequest(
      model: json['model'] as String,
      prompt:
          (json['prompt'] as List<dynamic>).map((e) => e as String).toList(),
      topP: json['top_p'] as int?,
      presencePenalty: json['presence_penalty'] as int?,
      n: json['n'] as int?,
      maxTokens: json['max_tokens'] as int?,
      frequencyPenalty: json['frequency_penalty'] as int?,
    )
      ..suffix = json['suffix'] as String?
      ..temperature = json['temperature'] as int?
      ..logprobs = json['logprobs'] as int?
      ..echo = json['echo'] as bool?
      ..stop =
          (json['stop'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..bestOf = json['best_of'] as int?
      ..user = json['user'] as String?;

Map<String, dynamic> _$GptCompletionRequestToJson(
    GptCompletionRequest instance) {
  final val = <String, dynamic>{
    'model': instance.model,
    'prompt': instance.prompt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('suffix', instance.suffix);
  writeNotNull('max_tokens', instance.maxTokens);
  writeNotNull('temperature', instance.temperature);
  writeNotNull('top_p', instance.topP);
  writeNotNull('n', instance.n);
  writeNotNull('logprobs', instance.logprobs);
  writeNotNull('echo', instance.echo);
  writeNotNull('stop', instance.stop);
  writeNotNull('presence_penalty', instance.presencePenalty);
  writeNotNull('frequency_penalty', instance.frequencyPenalty);
  writeNotNull('best_of', instance.bestOf);
  writeNotNull('user', instance.user);
  return val;
}
