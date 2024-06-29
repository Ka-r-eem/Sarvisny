/// status : "Success"
/// isError : false
/// message : "Action Done Successfully"
/// errors : [{"errorField": "fieldName", "errorMessage": "error message"}]
/// payload : [{"serviceID":"9e6bd48c-f616-4e7a-aca6-1b7a0cb1fd44","serviceName":"Roof Painting","criteriaID":"c33a58f2-5613-471a-b5ef-483bd8c85ddc","criteriaName":"Home Criteria","price":99.99}]

class WorkerRegisteredServicesResponse {
  WorkerRegisteredServicesResponse({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  WorkerRegisteredServicesResponse.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(Error.fromJson(v));
      });
    }
    if (json['payload'] != null) {
      payload = [];
      json['payload'].forEach((v) {
        payload?.add(RegisteredService.fromJson(v));
      });
    }
  }

  String? status;
  bool? isError;
  String? message;
  List<Error>? errors;
  List<RegisteredService>? payload;

  WorkerRegisteredServicesResponse copyWith({
    String? status,
    bool? isError,
    String? message,
    List<Error>? errors,
    List<RegisteredService>? payload,
  }) =>
      WorkerRegisteredServicesResponse(
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
      map['payload'] = payload?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// errorField : "fieldName"
/// errorMessage : "error message"

class Error {
  String? errorField;
  String? errorMessage;

  Error.fromJson(dynamic json) {
    errorField = json['errorField'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['errorField'] = errorField;
    map['errorMessage'] = errorMessage;
    return map;
  }
}

/// serviceID : "9e6bd48c-f616-4e7a-aca6-1b7a0cb1fd44"
/// serviceName : "Roof Painting"
/// criteriaID : "c33a58f2-5613-471a-b5ef-483bd8c85ddc"
/// criteriaName : "Home Criteria"
/// price : 99.99

class RegisteredService {
  RegisteredService({
    this.serviceID,
    this.serviceName,
    this.criteriaID,
    this.criteriaName,
    this.price,
  });

  RegisteredService.fromJson(dynamic json) {
    serviceID = json['serviceID'];
    serviceName = json['serviceName'];
    criteriaID = json['criteriaID'];
    criteriaName = json['criteriaName'];
    price = json['price'];
  }

  String? serviceID;
  String? serviceName;
  String? criteriaID;
  String? criteriaName;
  double? price;

  RegisteredService copyWith({
    String? serviceID,
    String? serviceName,
    String? criteriaID,
    String? criteriaName,
    double? price,
  }) =>
      RegisteredService(
        serviceID: serviceID ?? this.serviceID,
        serviceName: serviceName ?? this.serviceName,
        criteriaID: criteriaID ?? this.criteriaID,
        criteriaName: criteriaName ?? this.criteriaName,
        price: price ?? this.price,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceID'] = serviceID;
    map['serviceName'] = serviceName;
    map['criteriaID'] = criteriaID;
    map['criteriaName'] = criteriaName;
    map['price'] = price;
    return map;
  }
}
