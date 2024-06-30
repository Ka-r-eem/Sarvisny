/// status : "Success"
/// isError : false
/// message : "Action Done Successfully"
/// errors : []
/// payload : {"serviceId":"6cf42b08-a87f-402a-858c-99328602df13","serviceName":"Roof Painting","criteriaID":"d2efd197-4a64-448e-b416-001fbad7d48f","criteriaName":"Home Criteria","parentServiceId":null,"parentServiceName":null,"children":[{"childServiceID":"e9a52043-a172-41e1-97d3-c9635ce9613b","childServiceName":"child service"}]}

class ChildrenServicesResponse {
  ChildrenServicesResponse({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  ChildrenServicesResponse.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? ServiceChildren.fromJson(json['payload']) : null;
  }
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  ServiceChildren? payload;
ChildrenServicesResponse copyWith({  String? status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  ServiceChildren? payload,
}) => ChildrenServicesResponse(  status: status ?? this.status,
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

}

/// serviceId : "6cf42b08-a87f-402a-858c-99328602df13"
/// serviceName : "Roof Painting"
/// criteriaID : "d2efd197-4a64-448e-b416-001fbad7d48f"
/// criteriaName : "Home Criteria"
/// parentServiceId : null
/// parentServiceName : null
/// children : [{"childServiceID":"e9a52043-a172-41e1-97d3-c9635ce9613b","childServiceName":"child service"}]

class ServiceChildren {
  ServiceChildren({
      this.serviceId, 
      this.serviceName, 
      this.criteriaID, 
      this.criteriaName, 
      this.parentServiceId, 
      this.parentServiceName, 
      this.children,});

  ServiceChildren.fromJson(dynamic json) {
    serviceId = json['serviceId'];
    serviceName = json['serviceName'];
    criteriaID = json['criteriaID'];
    criteriaName = json['criteriaName'];
    parentServiceId = json['parentServiceId'];
    parentServiceName = json['parentServiceName'];
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children?.add(Children.fromJson(v));
      });
    }
  }
  String? serviceId;
  String? serviceName;
  String? criteriaID;
  String? criteriaName;
  dynamic parentServiceId;
  dynamic parentServiceName;
  List<Children>? children;
ServiceChildren copyWith({  String? serviceId,
  String? serviceName,
  String? criteriaID,
  String? criteriaName,
  dynamic parentServiceId,
  dynamic parentServiceName,
  List<Children>? children,
}) => ServiceChildren(  serviceId: serviceId ?? this.serviceId,
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

}

/// childServiceID : "e9a52043-a172-41e1-97d3-c9635ce9613b"
/// childServiceName : "child service"

class Children {
  Children({
      this.childServiceID, 
      this.childServiceName,});

  Children.fromJson(dynamic json) {
    childServiceID = json['childServiceID'];
    childServiceName = json['childServiceName'];
  }
  String? childServiceID;
  String? childServiceName;
Children copyWith({  String? childServiceID,
  String? childServiceName,
}) => Children(  childServiceID: childServiceID ?? this.childServiceID,
  childServiceName: childServiceName ?? this.childServiceName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['childServiceID'] = childServiceID;
    map['childServiceName'] = childServiceName;
    return map;
  }

}