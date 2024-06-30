import 'package:sarvisny/domain/model/AdminRelatedResponses/childrenServicesResponse.dart';

/// status : "Success"
/// isError : false
/// message : "Action Done Successfully"
/// errors : []
/// payload : {"serviceId":"6cf42b08-a87f-402a-858c-99328602df13","serviceName":"Roof Painting","criteriaID":"d2efd197-4a64-448e-b416-001fbad7d48f","criteriaName":"Home Criteria","parentServiceId":null,"parentServiceName":null,"children":[{"childServiceID":"e9a52043-a172-41e1-97d3-c9635ce9613b","childServiceName":"child service"}]}

class ChildrenServicesDto {
  ChildrenServicesDto({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  ChildrenServicesDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? ServiceChildrenDto.fromJson(json['payload']) : null;
  }
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  ServiceChildrenDto? payload;
ChildrenServicesDto copyWith({  String? status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  ServiceChildrenDto? payload,
}) => ChildrenServicesDto(  status: status ?? this.status,
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
  ChildrenServicesResponse toChildrenServicesResponse() => ChildrenServicesResponse(
    status: status,
    isError: isError,
    message: message,
    errors: errors,
    payload: payload?.toServiceChildren(),
  );

}

/// serviceId : "6cf42b08-a87f-402a-858c-99328602df13"
/// serviceName : "Roof Painting"
/// criteriaID : "d2efd197-4a64-448e-b416-001fbad7d48f"
/// criteriaName : "Home Criteria"
/// parentServiceId : null
/// parentServiceName : null
/// children : [{"childServiceID":"e9a52043-a172-41e1-97d3-c9635ce9613b","childServiceName":"child service"}]

class ServiceChildrenDto {
  ServiceChildrenDto({
      this.serviceId, 
      this.serviceName, 
      this.criteriaID, 
      this.criteriaName, 
      this.parentServiceId, 
      this.parentServiceName, 
      this.children,});

  ServiceChildrenDto.fromJson(dynamic json) {
    serviceId = json['serviceId'];
    serviceName = json['serviceName'];
    criteriaID = json['criteriaID'];
    criteriaName = json['criteriaName'];
    parentServiceId = json['parentServiceId'];
    parentServiceName = json['parentServiceName'];
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children?.add(ChildrenDto.fromJson(v));
      });
    }
  }
  String? serviceId;
  String? serviceName;
  String? criteriaID;
  String? criteriaName;
  dynamic parentServiceId;
  dynamic parentServiceName;
  List<ChildrenDto>? children;
ServiceChildrenDto copyWith({  String? serviceId,
  String? serviceName,
  String? criteriaID,
  String? criteriaName,
  dynamic parentServiceId,
  dynamic parentServiceName,
  List<ChildrenDto>? children,
}) => ServiceChildrenDto(  serviceId: serviceId ?? this.serviceId,
  serviceName: serviceName ?? this.serviceName,
  criteriaID: criteriaID ?? this.criteriaID,
  criteriaName: criteriaName ?? this.criteriaName,
  parentServiceId: parentServiceId ?? this.parentServiceId,
  parentServiceName: parentServiceName ?? this.parentServiceName,
  children: children ?? this.children,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceId'] = serviceId;
    map['serviceName'] = serviceName;
    map['criteriaID'] = criteriaID;
    map['criteriaName'] = criteriaName;
    map['parentServiceId'] = parentServiceId;
    map['parentServiceName'] = parentServiceName;
    if (children != null) {
      map['children'] = children?.map((v) => v.toJson()).toList();
    }
    return map;
  }
  ServiceChildren toServiceChildren() => ServiceChildren(
    serviceId: serviceId,
    serviceName: serviceName,
    criteriaID: criteriaID,
    criteriaName: criteriaName,
    parentServiceId: parentServiceId,
    parentServiceName: parentServiceName,
    children: children?.map((dto) => dto.toChildren()).toList(),
  );

}

/// childServiceID : "e9a52043-a172-41e1-97d3-c9635ce9613b"
/// childServiceName : "child service"

class ChildrenDto {
  ChildrenDto({
      this.childServiceID, 
      this.childServiceName,});

  ChildrenDto.fromJson(dynamic json) {
    childServiceID = json['childServiceID'];
    childServiceName = json['childServiceName'];
  }
  String? childServiceID;
  String? childServiceName;
ChildrenDto copyWith({  String? childServiceID,
  String? childServiceName,
}) => ChildrenDto(  childServiceID: childServiceID ?? this.childServiceID,
  childServiceName: childServiceName ?? this.childServiceName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['childServiceID'] = childServiceID;
    map['childServiceName'] = childServiceName;
    return map;
  }
  Children toChildren() => Children(
    childServiceID: childServiceID,
    childServiceName: childServiceName,
  );

}