import 'package:sarvisny/domain/model/CustomerRelatedResponses/CustomerServicesListResponse.dart';

/// status : null
/// isError : false
/// message : "Action Done succesfully"
/// errors : []
/// payload : [{"serviceId":"6cf42b08-a87f-402a-858c-99328602df13","serviceName":"Roof Painting","criteriaID":"d2efd197-4a64-448e-b416-001fbad7d48f","criteriaName":"Home Criteria"}]

class ParentsServicesResponse {
  ParentsServicesResponse({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  ParentsServicesResponse.fromJson(dynamic json) {
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
        payload?.add(ParentService.fromJson(v));
      });
    }
  }
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  List<ParentService>? payload;
ParentsServicesResponse copyWith({  dynamic status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  List<ParentService>? payload,
}) => ParentsServicesResponse(  status: status ?? this.status,
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

/// serviceId : "6cf42b08-a87f-402a-858c-99328602df13"
/// serviceName : "Roof Painting"
/// criteriaID : "d2efd197-4a64-448e-b416-001fbad7d48f"
/// criteriaName : "Home Criteria"

class ParentService {
  ParentService({
      this.serviceId, 
      this.serviceName, 
      this.criteriaID, 
      this.criteriaName,});

  ParentService.fromJson(dynamic json) {
    serviceId = json['serviceId'];
    serviceName = json['serviceName'];
    criteriaID = json['criteriaID'];
    criteriaName = json['criteriaName'];
  }
  String? serviceId;
  String? serviceName;
  String? criteriaID;
  String? criteriaName;
ParentService copyWith({  String? serviceId,
  String? serviceName,
  String? criteriaID,
  String? criteriaName,
}) => ParentService(  serviceId: serviceId ?? this.serviceId,
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
  CustomerServiceItem toCustomerServiceItem() => CustomerServiceItem(
    serviceID: serviceId,
    serviceName: serviceName,
    criteriaID: criteriaID,
  );

}