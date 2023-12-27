// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptChatCompletion _$GptChatCompletionFromJson(Map<String, dynamic> json) =>
    GptChatCompletion(
      id: json['id'] as String,
      object: json['object'] as String,
      choices: (json['choices'] as List<dynamic>)
          .map((e) => GptChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: json['created'] as int,
      usage: GptUsage.fromJson(json['usage'] as Map<String, dynamic>),
      model: json['model'] as String,
      systemFingerprint: json['system_fingerprint'] as String?,
    );

Map<String, dynamic> _$GptChatCompletionToJson(GptChatCompletion instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'object': instance.object,
    'created': instance.created,
    'choices': instance.choices,
    'usage': instance.usage,
    'model': instance.model,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('system_fingerprint', instance.systemFingerprint);
  return val;
}

GptChatCompletionRequest _$GptChatCompletionRequestFromJson(
        Map<String, dynamic> json) =>
    GptChatCompletionRequest(
      model: json['model'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => GptMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      temperature: (json['temperature'] as num?)?.toDouble(),
      user: json['user'] as String?,
      stream: json['stream'] as bool?,
      frequencyPenalty: json['frequency_penalty'] as int?,
      maxTokens: json['max_tokens'] as int?,
      n: json['n'] as int?,
      presencePenalty: json['presence_penalty'] as int?,
      topP: (json['top_p'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GptChatCompletionRequestToJson(
    GptChatCompletionRequest instance) {
  final val = <String, dynamic>{
    'model': instance.model,
    'messages': instance.messages,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('temperature', instance.temperature);
  writeNotNull('top_p', instance.topP);
  writeNotNull('n', instance.n);
  writeNotNull('stream', instance.stream);
  writeNotNull('max_tokens', instance.maxTokens);
  writeNotNull('presence_penalty', instance.presencePenalty);
  writeNotNull('frequency_penalty', instance.frequencyPenalty);
  writeNotNull('user', instance.user);
  return val;
}

GptFunction _$GptFunctionFromJson(Map<String, dynamic> json) => GptFunction(
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$GptFunctionToJson(GptFunction instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  return val;
}
