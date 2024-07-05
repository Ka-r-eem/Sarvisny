import 'dart:convert';

UploadFileResponse uploadFileResponseFromJson(String str) =>
    UploadFileResponse.fromJson(json.decode(str));

String uploadFileResponseToJson(UploadFileResponse data) =>
    json.encode(data.toJson());

class UploadFileResponse {
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  Payload? payload;

  UploadFileResponse({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  UploadFileResponse.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(v);
      });
    }
    payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }

  UploadFileResponse copyWith({
    dynamic status,
    bool? isError,
    String? message,
    List<dynamic>? errors,
    Payload? payload,
  }) =>
      UploadFileResponse(
        status: status ?? this.status,
        isError: isError ?? this.isError,
        message: message ?? this.message,
        errors: errors ?? this.errors,
        payload: payload ?? this.payload,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['isError'] = isError;
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    if (payload != null) {
      map['payload'] = payload?.toJson();
    }
    return map;
  }
}

class Payload {
  String? fileName;
  int? imageLength;

  Payload({
    this.fileName,
    this.imageLength,
  });

  Payload.fromJson(dynamic json) {
    fileName = json['fileName'];
    imageLength = json['imageLength'];
  }

  Payload copyWith({
    String? fileName,
    int? imageLength,
  }) =>
      Payload(
        fileName: fileName ?? this.fileName,
        imageLength: imageLength ?? this.imageLength,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fileName'] = fileName;
    map['imageLength'] = imageLength;
    return map;
  }
}