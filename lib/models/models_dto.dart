import 'package:json_annotation/json_annotation.dart';

part 'models_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class GptModelDto {
  String id;
  @JsonKey(name: "owned_by")
  String ownedBy;
  List<GptPermission> permission;
  String object;

  GptModelDto(
      {required this.id,
      required this.ownedBy,
      required this.permission,
      required this.object});

  factory GptModelDto.fromJson(Map<String, dynamic> json) =>
      _$GptModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GptModelDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptPermission {
  /*
  "id": "modelperm-49FUp5v084tBB49tC4z8LPH5",
          "object": "model_permission",
          "created": 1669085501,
          "allow_create_engine": false,
          "allow_sampling": true,
          "allow_logprobs": true,
          "allow_search_indices": false,
          "allow_view": true,
          "allow_fine_tuning": false,
          "organization": "*",
          "group": null,
          "is_blocking": false
   */

  String id;
  String object;
  int created;
  @JsonKey(name: "allow_create_engine")
  bool allowCreateEngine;

  @JsonKey(name: "allow_sampling")
  bool allowSampling;

  @JsonKey(name: "allow_logprobs")
  bool allowLogprobs;

  @JsonKey(name: "allow_search_indices")
  bool allowSearchIndices;

  @JsonKey(name: "allow_view")
  bool allowView;

  @JsonKey(name: "allow_fine_tuning")
  bool allowFineTuning;

  String organization;

  String? group;

  @JsonKey(name: "is_blocking")
  bool isBlocking;

  GptPermission(
      {required this.created,
      required this.object,
      required this.id,
      this.group,
      required this.allowCreateEngine,
      required this.allowFineTuning,
      required this.allowLogprobs,
      required this.allowSampling,
      required this.allowSearchIndices,
      required this.allowView,
      required this.isBlocking,
      required this.organization});

  factory GptPermission.fromJson(Map<String, dynamic> json) =>
      _$GptPermissionFromJson(json);

  Map<String, dynamic> toJson() => _$GptPermissionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class GptModelListDto {
  List<GptModelDto> data;
  String object;

  GptModelListDto({required this.data, required this.object});

  factory GptModelListDto.fromJson(Map<String, dynamic> json) =>
      _$GptModelListDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GptModelListDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
