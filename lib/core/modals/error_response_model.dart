class ErrorResponseModel {
  String? status;
  Error? error;
  String? message;
  String? stack;

  ErrorResponseModel({this.status, this.error, this.message, this.stack});

  ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    message = json['message'];
    stack = json['stack'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    data['message'] = message;
    data['stack'] = stack;
    return data;
  }
}

class Error {
  int? statusCode;
  bool? isOperational;
  String? status;

  Error({this.statusCode, this.isOperational, this.status});

  Error.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isOperational = json['isOperational'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['isOperational'] = isOperational;
    data['status'] = status;
    return data;
  }
}
