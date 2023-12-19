// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fine_tuning_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FineTuningJob _$FineTuningJobFromJson(Map<String, dynamic> json) =>
    FineTuningJob(
      id: json['id'] as String,
      object: json['object'] as String,
      createdAt: json['created_at'] as int,
      status: $enumDecode(_$FineTuningStatusEnumMap, json['status']),
      model: json['model'] as String,
      error: json['error'] == null
          ? null
          : FineTuningError.fromJson(json['error'] as Map<String, dynamic>),
      organizationId: json['organization_id'] as String,
      fineTunedModel: json['fine_tuned_model'] as String?,
      finishedAt: json['finished_at'] as int?,
      hyperParameters: const FineTuningHyperParamConverter()
          .fromJson(json['hyperparameters'] as Object),
      resultFiles: (json['result_files'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      trainedTokens: json['trained_tokens'] as int?,
      trainingFile: json['training_file'] as String,
      validationFile: json['validation_file'] as String?,
    );

Map<String, dynamic> _$FineTuningJobToJson(FineTuningJob instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'created_at': instance.createdAt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error', instance.error);
  writeNotNull('fine_tuned_model', instance.fineTunedModel);
  writeNotNull('finished_at', instance.finishedAt);
  val['hyperparameters'] =
      const FineTuningHyperParamConverter().toJson(instance.hyperParameters);
  val['model'] = instance.model;
  val['object'] = instance.object;
  val['organization_id'] = instance.organizationId;
  val['result_files'] = instance.resultFiles;
  val['status'] = _$FineTuningStatusEnumMap[instance.status]!;
  writeNotNull('trained_tokens', instance.trainedTokens);
  val['training_file'] = instance.trainingFile;
  writeNotNull('validation_file', instance.validationFile);
  return val;
}

const _$FineTuningStatusEnumMap = {
  FineTuningStatus.validatingFiles: 'validating_files',
  FineTuningStatus.queued: 'queued',
  FineTuningStatus.running: 'running',
  FineTuningStatus.succeeded: 'succeeded',
  FineTuningStatus.failed: 'failed',
  FineTuningStatus.cancelled: 'cancelled',
};

FineTuningError _$FineTuningErrorFromJson(Map<String, dynamic> json) =>
    FineTuningError(
      code: json['code'] as String,
      message: json['message'] as String,
      param: json['param'] as String,
    );

Map<String, dynamic> _$FineTuningErrorToJson(FineTuningError instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'param': instance.param,
    };

FineTuningHyperParam _$FineTuningHyperParamFromJson(
        Map<String, dynamic> json) =>
    FineTuningHyperParam(
      nEpochs: json['n_epochs'],
    );

Map<String, dynamic> _$FineTuningHyperParamToJson(
    FineTuningHyperParam instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('n_epochs', instance.nEpochs);
  return val;
}
