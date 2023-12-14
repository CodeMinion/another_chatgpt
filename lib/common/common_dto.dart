
import 'package:json_annotation/json_annotation.dart';

part 'common_dto.g.dart';


enum GptOrder {
  asc,
  desc,
}

@JsonSerializable(includeIfNull: false)
class GetGptListRequest {

  /// A limit on the number of objects to be returned.
  /// Limit can range between 1 and 100, and the default is 20.
  int limit;

  /// Sort order by the created_at timestamp of the objects.
  /// asc for ascending order and desc for descending order.
  GptOrder order;

  /// A cursor for use in pagination. after is an object ID that defines
  /// your place in the list. For instance, if you make a list
  /// request and receive 100 objects, ending with obj_foo,
  /// your subsequent call can include after=obj_foo in order
  /// to fetch the next page of the list.
  String? after;

  /// A cursor for use in pagination. before is an object ID
  /// that defines your place in the list. For instance,
  /// if you make a list request and receive 100 objects,
  /// ending with obj_foo, your subsequent call can include
  /// before=obj_foo in order to fetch the previous page of the list.
  String? before;

  GetGptListRequest({this.limit = 20, this.order = GptOrder.desc, this.after, this.before});

  factory GetGptListRequest.fromJson(Map<String, dynamic> json) =>
      _$GetGptListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetGptListRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false, genericArgumentFactories: true)
class GptList<T> {
  String object;
  List<T> data;

  GptList({required this.object, required this.data});

  factory GptList.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$GptListFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$GptListToJson(this, toJsonT);


}