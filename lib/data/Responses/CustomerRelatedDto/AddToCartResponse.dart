import '../../../domain/model/CustomerRelatedResponses/AddToCartResponse.dart';

/// status : null
/// isError : false
/// message : "Service Request is added successfully to the cart"
/// errors : []
/// payload : {"requestId":"3d715bdd-066c-4cc1-9949-7839752078a3","requestDay":"2024-02-05T00:00:00Z","requestTime":"05:00:00","serviceName":"Roof Painting","providerName":"WORKER WORKER","price":99.99,"problemDescription":"string"}

class AddToCartResponseDto {
  AddToCartResponseDto({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  AddToCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? RequestDetailsDto.fromJson(json['payload']) : null;
  }

  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  RequestDetailsDto? payload;

  AddToCartResponseDto copyWith({
    dynamic status,
    bool? isError,
    String? message,
    List<dynamic>? errors,
    RequestDetailsDto? payload,
  }) => AddToCartResponseDto(
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

  AddToCartResponse toAddCartResponse(){
    return AddToCartResponse(
        status: status,
        payload: payload?.toRequestDetails(),
        message: message,
        isError: isError,
        errors: errors
    );
  }
}

/// requestId : "3d715bdd-066c-4cc1-9949-7839752078a3"
/// requestDay : "2024-02-05T00:00:00Z"
/// requestTime : "05:00:00"
/// serviceName : "Roof Painting"
/// providerName : "WORKER WORKER"
/// price : 99.99
/// problemDescription : "string"

class RequestDetailsDto {
  RequestDetailsDto({
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

  RequestDetailsDto.fromJson(dynamic json) {
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
        services?.add(ServiceDto.fromJson(v));
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
  List<ServiceDto>? services;
  double? price;
  String? problemDescription;

  RequestDetailsDto copyWith({
    String? requestId,
    String? requestDay,
    String? dayOfWeek,
    String? requestTime,
    String? district,
    String? address,
    String? providerName,
    List<ServiceDto>? services,
    double? price,
    String? problemDescription,
  }) => RequestDetailsDto(
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

  RequestDetails toRequestDetails() {
    return RequestDetails(
      requestId: requestId,
      requestDay: requestDay,
      dayOfWeek: dayOfWeek,
      requestTime: requestTime,
      district: district,
      address: address,
      providerName: providerName,
      services: services?.map((service) => service.toService()).toList(),
      price: price,
      problemDescription: problemDescription,
    );
  }
}

class ServiceDto {
  ServiceDto({
    this.serviceId,
    this.serviceName,
    this.price,
  });

  ServiceDto.fromJson(dynamic json) {
    serviceId = json['serviceId'];
    serviceName = json['serviceName'];
    price = json['price'];
  }

  String? serviceId;
  String? serviceName;
  double? price;

  ServiceDto copyWith({
    String? serviceId,
    String? serviceName,
    double? price,
  }) => ServiceDto(
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

  Service toService() {
    return Service(
      serviceId: serviceId,
      serviceName: serviceName,
      price: price,
    );
  }
}
