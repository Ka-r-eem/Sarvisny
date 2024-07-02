class AddToCartResponse {
  AddToCartResponse({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  AddToCartResponse.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? RequestDetails.fromJson(json['payload']) : null;
  }

  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  RequestDetails? payload;

  AddToCartResponse copyWith({
    dynamic status,
    bool? isError,
    String? message,
    List<dynamic>? errors,
    RequestDetails? payload,
  }) => AddToCartResponse(
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
      map['errors'] = errors;
    }
    if (payload != null) {
      map['payload'] = payload?.toJson();
    }
    return map;
  }
}

/// requestId : "0a5851ca-dad7-4c7f-b3ec-a2c1c589bb80"
/// requestDay : "2024-07-06T12:34:42.942Z"
/// dayOfWeek : "Saturday"
/// requestTime : "03:00:00"
/// district : "Giza"
/// address : "string"
/// providerName : "WORKER WORKER"
/// services : [{"serviceId":"fe7bfa40-e686-4f3e-b484-b9f1ae3b42ea","serviceName":"child service","price":112}]
/// price : 112
/// problemDescription : "string"

class RequestDetails {
  RequestDetails({
    this.requestId,
    this.requestDay,
    this.dayOfWeek,
    this.requestTime,
    this.district,
    this.address,
    this.providerName,
    this.services,
    this.price,
    this.problemDescription,
  });

  RequestDetails.fromJson(dynamic json) {
    requestId = json['requestId'];
    requestDay = json['requestDay'];
    dayOfWeek = json['dayOfWeek'];
    requestTime = json['requestTime'];
    district = json['district'];
    address = json['address'];
    providerName = json['providerName'];
    if (json['services'] != null) {
      services = [];
      json['services'].forEach((v) {
        services?.add(Service.fromJson(v));
      });
    }
    price = json['price'];
    problemDescription = json['problemDescription'];
  }

  String? requestId;
  String? requestDay;
  String? dayOfWeek;
  String? requestTime;
  String? district;
  String? address;
  String? providerName;
  List<Service>? services;
  double? price;
  String? problemDescription;

  RequestDetails copyWith({
    String? requestId,
    String? requestDay,
    String? dayOfWeek,
    String? requestTime,
    String? district,
    String? address,
    String? providerName,
    List<Service>? services,
    double? price,
    String? problemDescription,
  }) => RequestDetails(
    requestId: requestId ?? this.requestId,
    requestDay: requestDay ?? this.requestDay,
    dayOfWeek: dayOfWeek ?? this.dayOfWeek,
    requestTime: requestTime ?? this.requestTime,
    district: district ?? this.district,
    address: address ?? this.address,
    providerName: providerName ?? this.providerName,
    services: services ?? this.services,
    price: price ?? this.price,
    problemDescription: problemDescription ?? this.problemDescription,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['requestId'] = requestId;
    map['requestDay'] = requestDay;
    map['dayOfWeek'] = dayOfWeek;
    map['requestTime'] = requestTime;
    map['district'] = district;
    map['address'] = address;
    map['providerName'] = providerName;
    if (services != null) {
      map['services'] = services?.map((v) => v.toJson()).toList();
    }
    map['price'] = price;
    map['problemDescription'] = problemDescription;
    return map;
  }
}

class Service {
  Service({
    this.serviceId,
    this.serviceName,
    this.price,
  });

  Service.fromJson(dynamic json) {
    serviceId = json['serviceId'];
    serviceName = json['serviceName'];
    price = json['price'];
  }

  String? serviceId;
  String? serviceName;
  double? price;

  Service copyWith({
    String? serviceId,
    String? serviceName,
    double? price,
  }) => Service(
    serviceId: serviceId ?? this.serviceId,
    serviceName: serviceName ?? this.serviceName,
    price: price ?? this.price,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceId'] = serviceId;
    map['serviceName'] = serviceName;
    map['price'] = price;
    return map;
  }
}
