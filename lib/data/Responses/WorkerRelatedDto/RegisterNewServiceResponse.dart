import '../../../domain/model/WorkerRelatedResponse/RegisterNewServiceResponse.dart';

/// status : "Success"
/// isError : false
/// message : "Action Done Successfully"
/// errors : []
/// payload : {"providerID":"db830078-249e-4808-9575-76c56bc51153","serviceID":"116eb294-b8ef-4f26-a3a3-1ab7b42b09d6","price":100}

class RegisterNewServiceResponseDto {
  RegisterNewServiceResponseDto({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  RegisterNewServiceResponseDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? PayloadDto.fromJson(json['payload']) : null;
  }
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  PayloadDto? payload;
RegisterNewServiceResponseDto copyWith({  String? status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  PayloadDto? payload,
}) => RegisterNewServiceResponseDto(  status: status ?? this.status,
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
  RegisterNewServiceResponse toRegisterNewServiceResponse() => RegisterNewServiceResponse(
    status: status,
    isError: isError,
    message: message,
    errors: errors,
    payload: payload?.toPayload(),
  );

}

/// providerID : "db830078-249e-4808-9575-76c56bc51153"
/// serviceID : "116eb294-b8ef-4f26-a3a3-1ab7b42b09d6"
/// price : 100

class PayloadDto {
  PayloadDto({
      this.providerID, 
      this.serviceID, 
      this.price,});

  PayloadDto.fromJson(dynamic json) {
    providerID = json['providerID'];
    serviceID = json['serviceID'];
    price = json['price'];
  }
  String? providerID;
  String? serviceID;
  int? price;
PayloadDto copyWith({  String? providerID,
  String? serviceID,
  int? price,
}) => PayloadDto(  providerID: providerID ?? this.providerID,
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
Payload toPayload() => Payload(
  providerID: providerID,
  serviceID: serviceID,
  price: price,
);

}