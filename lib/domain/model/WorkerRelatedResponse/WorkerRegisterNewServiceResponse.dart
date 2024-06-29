class WorkerRegisterNewServiceResponse {
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  Payload? payload;

  WorkerRegisterNewServiceResponse({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  WorkerRegisterNewServiceResponse.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];

    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(v); // Assuming errors can be generic dynamic objects
      });
    }

    payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }

  WorkerRegisterNewServiceResponse copyWith({
    String? status,
    bool? isError,
    String? message,
    List<dynamic>? errors,
    Payload? payload,
  }) =>
      WorkerRegisterNewServiceResponse(
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
      map['errors'] = errors?.toList();
    }

    if (payload != null) {
      map['payload'] = payload?.toJson();
    }

    return map;
  }
}

class Payload {
  String? providerID;
  String? serviceID;
  int? price;

  Payload({
    this.providerID,
    this.serviceID,
    this.price,
  });

  Payload.fromJson(dynamic json) {
    providerID = json['providerID'];
    serviceID = json['serviceID'];
    price = json['price'];
  }

  Payload copyWith({
    String? providerID,
    String? serviceID,
    int? price,
  }) =>
      Payload(
        providerID: providerID ?? this.providerID,
        serviceID: serviceID ?? this.serviceID,
        price: price ?? this.price,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['providerID'] = providerID;
    map['serviceID'] = serviceID;
    map['price'] = price;
    return map;
  }
}
