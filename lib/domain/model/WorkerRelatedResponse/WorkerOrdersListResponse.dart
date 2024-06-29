import 'ShowOrderDetailsResponse.dart';

class WorkerOrdersListResponse {
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  List<OutSidePayload>? payload;

  WorkerOrdersListResponse({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  WorkerOrdersListResponse.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = List<dynamic>.from(json['errors']);
    }
    if (json['payload'] != null) {
      payload = List<OutSidePayload>.from(json['payload'].map((x) => OutSidePayload.fromJson(x)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['isError'] = isError;
    data['message'] = message;
    if (errors != null) {
      data['errors'] = errors;
    }
    if (payload != null) {
      data['payload'] = payload!.map((x) => x.toJson()).toList();
    }
    return data;
  }
}

class OutSidePayload {
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  orderDetails? payload;

  OutSidePayload({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  OutSidePayload.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = List<dynamic>.from(json['errors']);
    }
    payload = json['payload'] != null ? orderDetails.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['isError'] = isError;
    data['message'] = message;
    if (errors != null) {
      data['errors'] = errors;
    }
    if (payload != null) {
      data['payload'] = payload!.toJson();
    }
    return data;
  }
}


