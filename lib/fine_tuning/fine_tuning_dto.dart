
import 'package:json_annotation/json_annotation.dart';

part 'fine_tuning_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class FineTuningJob {

  String id;

  @JsonKey(name: "created_at")
  int createdAt;

  FineTuningError? error;

  @JsonKey(name: "fine_tuned_model")
  String? fineTunedModel;

  @JsonKey(name: "finished_at")
  int? finishedAt;

  @FineTuningHyperParamConverter()
  @JsonKey(name: "hyperparameters")
  FineTuningHyperParam hyperParameters;

  String model;

  String object;

  @JsonKey(name: "organization_id")
  String organizationId;

  @JsonKey(name: "result_files")
  List<String> resultFiles;

  FineTuningStatus status;

  @JsonKey(name: "trained_tokens")
  int? trainedTokens;

  @JsonKey(name: "training_file")
  String trainingFile;

  @JsonKey(name: "validation_file")
  String? validationFile;

  FineTuningJob({required this.id, required this.object, required this.createdAt, required this.status, required this.model, this.error, required this.organizationId, this.fineTunedModel, this.finishedAt, required this.hyperParameters, required this.resultFiles, this.trainedTokens, required this.trainingFile, this.validationFile});

  factory FineTuningJob.fromJson(Map<String, dynamic> json) =>
      _$FineTuningJobFromJson(json);

  Map<String, dynamic> toJson() => _$FineTuningJobToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class FineTuningError {

  String code;
  String message;
  String param;

  FineTuningError({required this.code, required this.message, required this.param});

  factory FineTuningError.fromJson(Map<String, dynamic> json) =>
      _$FineTuningErrorFromJson(json);

  Map<String, dynamic> toJson() => _$FineTuningErrorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class FineTuningHyperParam {

  @JsonKey(name: "n_epochs")
  dynamic nEpochs;

  FineTuningHyperParam({required this.nEpochs});

  factory FineTuningHyperParam.fromJson(Map<String, dynamic> json) =>
      _$FineTuningHyperParamFromJson(json);

  Map<String, dynamic> toJson() => _$FineTuningHyperParamToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

class FineTuningHyperParamConverter<T extends Object> implements JsonConverter<FineTuningHyperParam, Object> {

  const FineTuningHyperParamConverter();

  @override
  FineTuningHyperParam fromJson(Object json) {
    if(json is String) {
      return FineTuningHyperParam(nEpochs: json);
    }
    else if (json is int) {
      return FineTuningHyperParam(nEpochs: json);
    }

    throw UnimplementedError();
  }

  @override
  Object toJson(FineTuningHyperParam object) {
    if(object.nEpochs is String) {
      return object.toJson();
    }

    if(object.nEpochs is int) {
      return object.toJson();
    }
    throw UnimplementedError();
  }

}

enum FineTuningStatus {

  @JsonValue("validating_files")
  validatingFiles,

  queued,

  running,

  succeeded,

  failed,

  cancelled
}