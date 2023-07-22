
import 'package:json_annotation/json_annotation.dart';

part 'error_models.g.dart';

class ServerError {
  String? timestamp;
  int? status;
  ErrorMessage? error;
  String? message;
  String? path;

  ServerError(
      {this.timestamp, this.status, this.error, this.message, this.path});

  ServerError.fromJson(Map<String, dynamic> json) {
    error = ErrorMessage.fromJson(json['error']);

    //timestamp = json['timestamp'];
    //status = json['status'];
    //error = json['error'];
    message = error!.message;//json['message'];
    //path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['status'] = status;
    data['error'] = error;
    data['message'] = message;
    data['path'] =path;
    return data;
  }
}
@JsonSerializable(includeIfNull: false)
class ErrorMessage {
  String message;
  String type;
  String? param;
  String? code;

  ErrorMessage({required this.message, required this.type, this.code, this.param});

  factory ErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$ErrorMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorMessageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
