import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetCartResponse.dart';

class GetCartResponseDto {
  GetCartResponseDto({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  GetCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? CartDetailsDto.fromJson(json['payload']) : null;
  }

  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  CartDetailsDto? payload;

  GetCartResponseDto copyWith({
    dynamic status,
    bool? isError,
    String? message,
    List<dynamic>? errors,
    CartDetailsDto? payload,
  }) =>
      GetCartResponseDto(
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

  GetCartResponse toCartResponse(){
    return GetCartResponse(
      errors: errors,
      isError: isError,
      message: message,
      payload: payload?.toCartDetails(),
      status: status
    );
  }
}

class CartDetailsDto {
  CartDetailsDto({
    this.cartID,
    this.requestedServices,
  });

  CartDetailsDto.fromJson(dynamic json) {
    cartID = json['cartID'];
    if (json['requestedServices'] != null) {
      requestedServices = [];
      json['requestedServices'].forEach((v) {
        requestedServices?.add(RequestedServiceDto.fromJson(v));
      });
    }
  }

  String? cartID;
  List<RequestedServiceDto>? requestedServices;

  CartDetailsDto copyWith({
    String? cartID,
    List<RequestedServiceDto>? requestedServices,
  }) =>
      CartDetailsDto(
        cartID: cartID ?? this.cartID,
        requestedServices: requestedServices ?? this.requestedServices,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cartID'] = cartID;
    if (requestedServices != null) {
      map['requestedServices'] = requestedServices?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  CartDetails toCartDetails(){
    return CartDetails(
      cartID: cartID,
      requestedServices: requestedServices?.map((dto) => dto.toRequestedService()).toList()
    );
  }
}

class RequestedServiceDto {
  RequestedServiceDto({
    this.requestID,
    this.firstName,
    this.lastName,
    this.serviceID,
    this.serviceName,
    this.parentServiceID,
    this.parentServiceName,
    this.criteriaID,
    this.criteriaName,
    this.slotID,
    this.startTime,
    this.price,
    this.problemDescription,
  });

  RequestedServiceDto.fromJson(dynamic json) {
    requestID = json['serviceRequestID'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    serviceID = json['serviceID'];
    serviceName = json['serviceName'];
    parentServiceID = json['parentServiceID'];
    parentServiceName = json['parentServiceName'];
    criteriaID = json['criteriaID'];
    criteriaName = json['criteriaName'];
    slotID = json['slotID'];
    startTime = json['startTime'];
    price = json['price'];
    problemDescription = json['problemDescription'];
  }

  String? requestID;
  String? firstName;
  String? lastName;
  String? serviceID;
  String? serviceName;
  dynamic parentServiceID;
  dynamic parentServiceName;
  String? criteriaID;
  String? criteriaName;
  String? slotID;
  String? startTime;
  double? price;
  String? problemDescription;

  RequestedServiceDto copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? serviceID,
    String? serviceName,
    dynamic parentServiceID,
    dynamic parentServiceName,
    String? criteriaID,
    String? criteriaName,
    String? slotID,
    String? startTime,
    double? price,
    String? problemDescription,
  }) =>
      RequestedServiceDto(
        requestID: id ?? this.requestID,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        serviceID: serviceID ?? this.serviceID,
        serviceName: serviceName ?? this.serviceName,
        parentServiceID: parentServiceID ?? this.parentServiceID,
        parentServiceName: parentServiceName ?? this.parentServiceName,
        criteriaID: criteriaID ?? this.criteriaID,
        criteriaName: criteriaName ?? this.criteriaName,
        slotID: slotID ?? this.slotID,
        startTime: startTime ?? this.startTime,
        price: price ?? this.price,
        problemDescription: problemDescription ?? this.problemDescription,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceRequestID'] = requestID;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['serviceID'] = serviceID;
    map['serviceName'] = serviceName;
    map['parentServiceID'] = parentServiceID;
    map['parentServiceName'] = parentServiceName;
    map['criteriaID'] = criteriaID;
    map['criteriaName'] = criteriaName;
    map['slotID'] = slotID;
    map['startTime'] = startTime;
    map['price'] = price;
    map['problemDescription'] = problemDescription;
    return map;
  }
  RequestedService toRequestedService(){
    return RequestedService(
      serviceName: serviceName,
      price: price,
      problemDescription: problemDescription,
      slotID: slotID,
      parentServiceName: parentServiceName,
      parentServiceID: parentServiceID,
      serviceID: serviceID,
      criteriaName: criteriaName,
      criteriaID: criteriaID,
      lastName: lastName,
      firstName: firstName,
      startTime: startTime,
      requestID: requestID,
    );
  }
}
