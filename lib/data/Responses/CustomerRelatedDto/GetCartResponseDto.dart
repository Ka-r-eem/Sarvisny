import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetCartResponse.dart';

/// status : null
/// isError : false
/// message : "Success"
/// errors : []
/// payload : {"cartID":"12cf28cc-215e-49b7-8318-b9ee1ebce7d9","requestedServices":[{"cartServiceRequestID":"79975712-d083-44ff-8dd1-3b1593a400f0","providerId":"a89c7aa9-0ec4-4836-9784-4d0f49e9aa92","firstName":"WORKER","lastName":"WORKER","services":[{"serviceId":"fe7bfa40-e686-4f3e-b484-b9f1ae3b42ea","serviceName":"child service","parentServiceID":"56ec1262-fb8f-4209-96cd-7a78523693af","parentServiceName":"Roof Painting","criteriaID":null,"criteriaName":null,"price":112}],"slotID":"137f37ef-e3db-4503-9522-aab3ab897e3b","requestedDate":"2024-07-06T17:34:37.657565","dayOfWeek":"Saturday","startTime":"03:00:00","districtID":"d6c63188-be23-4430-b118-2175ee6d40b2","districtName":"Maadi","address":"Maadi","price":112,"problemDescription":""},{"cartServiceRequestID":"8aafc656-d080-4b1c-8f5b-2c74d3d8da71","providerId":"a89c7aa9-0ec4-4836-9784-4d0f49e9aa92","firstName":"WORKER","lastName":"WORKER","services":[{"serviceId":"fe7bfa40-e686-4f3e-b484-b9f1ae3b42ea","serviceName":"child service","parentServiceID":"56ec1262-fb8f-4209-96cd-7a78523693af","parentServiceName":"Roof Painting","criteriaID":null,"criteriaName":null,"price":112}],"slotID":"4871a7aa-84e5-4bd6-964a-6257ebcccdb6","requestedDate":"2024-07-06T12:34:42.942","dayOfWeek":"Saturday","startTime":"04:00:00","districtID":"d6c63188-be23-4430-b118-2175ee6d40b2","districtName":"Maadi","address":"string","price":112,"problemDescription":""}]}

class GetCartResponseDto {
  GetCartResponseDto({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

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
    payload = json['payload'] != null ? CartDto.fromJson(json['payload']) : null;
  }
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  CartDto? payload;
GetCartResponseDto copyWith({  dynamic status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  CartDto? payload,
}) => GetCartResponseDto(  status: status ?? this.status,
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
  GetCartResponse toGetCartResponse() => GetCartResponse(
    status: status,
    isError: isError,
    message: message,
    errors: errors,
    payload: payload?.toCart(),
  );

}

/// cartID : "12cf28cc-215e-49b7-8318-b9ee1ebce7d9"
/// requestedServices : [{"cartServiceRequestID":"79975712-d083-44ff-8dd1-3b1593a400f0","providerId":"a89c7aa9-0ec4-4836-9784-4d0f49e9aa92","firstName":"WORKER","lastName":"WORKER","services":[{"serviceId":"fe7bfa40-e686-4f3e-b484-b9f1ae3b42ea","serviceName":"child service","parentServiceID":"56ec1262-fb8f-4209-96cd-7a78523693af","parentServiceName":"Roof Painting","criteriaID":null,"criteriaName":null,"price":112}],"slotID":"137f37ef-e3db-4503-9522-aab3ab897e3b","requestedDate":"2024-07-06T17:34:37.657565","dayOfWeek":"Saturday","startTime":"03:00:00","districtID":"d6c63188-be23-4430-b118-2175ee6d40b2","districtName":"Maadi","address":"Maadi","price":112,"problemDescription":""},{"cartServiceRequestID":"8aafc656-d080-4b1c-8f5b-2c74d3d8da71","providerId":"a89c7aa9-0ec4-4836-9784-4d0f49e9aa92","firstName":"WORKER","lastName":"WORKER","services":[{"serviceId":"fe7bfa40-e686-4f3e-b484-b9f1ae3b42ea","serviceName":"child service","parentServiceID":"56ec1262-fb8f-4209-96cd-7a78523693af","parentServiceName":"Roof Painting","criteriaID":null,"criteriaName":null,"price":112}],"slotID":"4871a7aa-84e5-4bd6-964a-6257ebcccdb6","requestedDate":"2024-07-06T12:34:42.942","dayOfWeek":"Saturday","startTime":"04:00:00","districtID":"d6c63188-be23-4430-b118-2175ee6d40b2","districtName":"Maadi","address":"string","price":112,"problemDescription":""}]

class CartDto {
  CartDto({
      this.cartID, 
      this.requestedServices,});

  CartDto.fromJson(dynamic json) {
    cartID = json['cartID'];
    if (json['requestedServices'] != null) {
      requestedServices = [];
      json['requestedServices'].forEach((v) {
        requestedServices?.add(RequestedServicesDto.fromJson(v));
      });
    }
  }
  String? cartID;
  List<RequestedServicesDto>? requestedServices;
CartDto copyWith({  String? cartID,
  List<RequestedServicesDto>? requestedServices,
}) => CartDto(  cartID: cartID ?? this.cartID,
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
  Cart toCart() => Cart(
    cartID: cartID,
    requestedServices: requestedServices?.map((e) => e.toRequestedServices()).toList(),
  );

}

/// cartServiceRequestID : "79975712-d083-44ff-8dd1-3b1593a400f0"
/// providerId : "a89c7aa9-0ec4-4836-9784-4d0f49e9aa92"
/// firstName : "WORKER"
/// lastName : "WORKER"
/// services : [{"serviceId":"fe7bfa40-e686-4f3e-b484-b9f1ae3b42ea","serviceName":"child service","parentServiceID":"56ec1262-fb8f-4209-96cd-7a78523693af","parentServiceName":"Roof Painting","criteriaID":null,"criteriaName":null,"price":112}]
/// slotID : "137f37ef-e3db-4503-9522-aab3ab897e3b"
/// requestedDate : "2024-07-06T17:34:37.657565"
/// dayOfWeek : "Saturday"
/// startTime : "03:00:00"
/// districtID : "d6c63188-be23-4430-b118-2175ee6d40b2"
/// districtName : "Maadi"
/// address : "Maadi"
/// price : 112
/// problemDescription : ""

class RequestedServicesDto {
  RequestedServicesDto({
      this.cartServiceRequestID, 
      this.providerId, 
      this.firstName, 
      this.lastName, 
      this.services, 
      this.slotID, 
      this.requestedDate, 
      this.dayOfWeek, 
      this.startTime, 
      this.districtID, 
      this.districtName, 
      this.address, 
      this.price, 
      this.problemDescription,});

  RequestedServicesDto.fromJson(dynamic json) {
    cartServiceRequestID = json['cartServiceRequestID'];
    providerId = json['providerId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    if (json['services'] != null) {
      services = [];
      json['services'].forEach((v) {
        services?.add(ServicesDto.fromJson(v));
      });
    }
    slotID = json['slotID'];
    requestedDate = json['requestedDate'];
    dayOfWeek = json['dayOfWeek'];
    startTime = json['startTime'];
    districtID = json['districtID'];
    districtName = json['districtName'];
    address = json['address'];
    price = json['price'];
    problemDescription = json['problemDescription'];
  }
  String? cartServiceRequestID;
  String? providerId;
  String? firstName;
  String? lastName;
  List<ServicesDto>? services;
  String? slotID;
  String? requestedDate;
  String? dayOfWeek;
  String? startTime;
  String? districtID;
  String? districtName;
  String? address;
  int? price;
  String? problemDescription;
RequestedServicesDto copyWith({  String? cartServiceRequestID,
  String? providerId,
  String? firstName,
  String? lastName,
  List<ServicesDto>? services,
  String? slotID,
  String? requestedDate,
  String? dayOfWeek,
  String? startTime,
  String? districtID,
  String? districtName,
  String? address,
  int? price,
  String? problemDescription,
}) => RequestedServicesDto(  cartServiceRequestID: cartServiceRequestID ?? this.cartServiceRequestID,
  providerId: providerId ?? this.providerId,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  services: services ?? this.services,
  slotID: slotID ?? this.slotID,
  requestedDate: requestedDate ?? this.requestedDate,
  dayOfWeek: dayOfWeek ?? this.dayOfWeek,
  startTime: startTime ?? this.startTime,
  districtID: districtID ?? this.districtID,
  districtName: districtName ?? this.districtName,
  address: address ?? this.address,
  price: price ?? this.price,
  problemDescription: problemDescription ?? this.problemDescription,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cartServiceRequestID'] = cartServiceRequestID;
    map['providerId'] = providerId;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    if (services != null) {
      map['services'] = services?.map((v) => v.toJson()).toList();
    }
    map['slotID'] = slotID;
    map['requestedDate'] = requestedDate;
    map['dayOfWeek'] = dayOfWeek;
    map['startTime'] = startTime;
    map['districtID'] = districtID;
    map['districtName'] = districtName;
    map['address'] = address;
    map['price'] = price;
    map['problemDescription'] = problemDescription;
    return map;
  }
  RequestedServices toRequestedServices() => RequestedServices(
    cartServiceRequestID: cartServiceRequestID,
    providerId: providerId,
    firstName: firstName,
    lastName: lastName,
    services: services?.map((e) => e.toServices()).toList(),
    slotID: slotID,
    requestedDate: requestedDate,
    dayOfWeek: dayOfWeek,
    startTime: startTime,
    districtID: districtID,
    districtName: districtName,
    address: address,
    price: price,
    problemDescription: problemDescription,
  );

}

/// serviceId : "fe7bfa40-e686-4f3e-b484-b9f1ae3b42ea"
/// serviceName : "child service"
/// parentServiceID : "56ec1262-fb8f-4209-96cd-7a78523693af"
/// parentServiceName : "Roof Painting"
/// criteriaID : null
/// criteriaName : null
/// price : 112

class ServicesDto {
  ServicesDto({
      this.serviceId, 
      this.serviceName, 
      this.parentServiceID, 
      this.parentServiceName, 
      this.criteriaID, 
      this.criteriaName, 
      this.price,});

  ServicesDto.fromJson(dynamic json) {
    serviceId = json['serviceId'];
    serviceName = json['serviceName'];
    parentServiceID = json['parentServiceID'];
    parentServiceName = json['parentServiceName'];
    criteriaID = json['criteriaID'];
    criteriaName = json['criteriaName'];
    price = json['price'];
  }
  String? serviceId;
  String? serviceName;
  String? parentServiceID;
  String? parentServiceName;
  dynamic criteriaID;
  dynamic criteriaName;
  int? price;
ServicesDto copyWith({  String? serviceId,
  String? serviceName,
  String? parentServiceID,
  String? parentServiceName,
  dynamic criteriaID,
  dynamic criteriaName,
  int? price,
}) => ServicesDto(  serviceId: serviceId ?? this.serviceId,
  serviceName: serviceName ?? this.serviceName,
  parentServiceID: parentServiceID ?? this.parentServiceID,
  parentServiceName: parentServiceName ?? this.parentServiceName,
  criteriaID: criteriaID ?? this.criteriaID,
  criteriaName: criteriaName ?? this.criteriaName,
  price: price ?? this.price,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceId'] = serviceId;
    map['serviceName'] = serviceName;
    map['parentServiceID'] = parentServiceID;
    map['parentServiceName'] = parentServiceName;
    map['criteriaID'] = criteriaID;
    map['criteriaName'] = criteriaName;
    map['price'] = price;
    return map;
  }
  Services toServices() => Services(
    serviceId: serviceId,
    serviceName: serviceName,
    parentServiceID: parentServiceID,
    parentServiceName: parentServiceName,
    criteriaID: criteriaID,
    criteriaName: criteriaName,
    price: price,
  );

}