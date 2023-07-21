
class ServerError {
  String? timestamp;
  int? status;
  String? error;
  String? message;
  String? path;

  ServerError(
      {this.timestamp, this.status, this.error, this.message, this.path});

  ServerError.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    status = json['status'];
    error = json['error'];
    message = json['message'];
    path = json['path'];
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
