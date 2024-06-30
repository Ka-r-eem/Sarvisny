import 'package:sarvisny/domain/model/AdminRelatedResponses/ParentsServicesResponse.dart';

/// status : null
/// isError : false
/// message : "Action Done succesfully"
/// errors : []
/// payload : [{"serviceId":"6cf42b08-a87f-402a-858c-99328602df13","serviceName":"Roof Painting","criteriaID":"d2efd197-4a64-448e-b416-001fbad7d48f","criteriaName":"Home Criteria"}]

class ParentsServicesDto {
  ParentsServicesDto({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  ParentsServicesDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    if (json['payload'] != null) {
      payload = [];
      json['payload'].forEach((v) {
        payload?.add(ParentServiceDto.fromJson(v));
      });
    }
  }
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  List<ParentServiceDto>? payload;
ParentsServicesDto copyWith({  dynamic status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  List<ParentServiceDto>? payload,
}) => ParentsServicesDto(  status: status ?? this.status,
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
  ParentsServicesResponse toParentsServicesResponse() => ParentsServicesResponse(
    status: status,
    isError: isError,
    message: message,
    errors: errors,
    payload: payload?.map((e) => e.toParentService()).toList(),
  );

}

/// serviceId : "6cf42b08-a87f-402a-858c-99328602df13"
/// serviceName : "Roof Painting"
/// criteriaID : "d2efd197-4a64-448e-b416-001fbad7d48f"
/// criteriaName : "Home Criteria"

class ParentServiceDto {
  ParentServiceDto({
      this.serviceId, 
      this.serviceName, 
      this.criteriaID, 
      this.criteriaName,});

  ParentServiceDto.fromJson(dynamic json) {
    serviceId = json['serviceId'];
    serviceName = json['serviceName'];
    criteriaID = json['criteriaID'];
    criteriaName = json['criteriaName'];
  }
  String? serviceId;
  String? serviceName;
  String? criteriaID;
  String? criteriaName;
ParentServiceDto copyWith({  String? serviceId,
  String? serviceName,
  String? criteriaID,
  String? criteriaName,
}) => ParentServiceDto(  serviceId: serviceId ?? this.serviceId,
  serviceName: serviceName ?? this.serviceName,
  criteriaID: criteriaID ?? this.criteriaID,
  criteriaName: criteriaName ?? this.criteriaName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceId'] = serviceId;
    map['serviceName'] = serviceName;
    map['criteriaID'] = criteriaID;
    map['criteriaName'] = criteriaName;
    return map;
  }
  ParentService toParentService() => ParentService(
    serviceId: serviceId,
    serviceName: serviceName,
    criteriaID: criteriaID,
    criteriaName: criteriaName,
  );

}