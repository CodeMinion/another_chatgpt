
import 'package:json_annotation/json_annotation.dart';

part 'models_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class GptModelDto {

  String id;
  @JsonKey(name: "owned_by")
  String ownedBy;
  List<String> permission;
  String object;

  GptModelDto({required this.id, required this.ownedBy, required this.permission, required this.object});

  factory GptModelDto.fromJson(Map<String, dynamic> json) =>
      _$GptModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GptModelDtoToJson(this);

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

