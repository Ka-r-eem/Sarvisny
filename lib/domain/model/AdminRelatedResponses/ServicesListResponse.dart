class ServicesListResponse {
  String? status;
  bool? isError;
  String? message;
  List<ServiceObject>? payload;

  ServicesListResponse({this.isError , this.payload , this.status ,this.message});

  ServicesListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['payload'] != null) {
      payload = <ServiceObject>[];
      json['payload'].forEach((v) {
        payload?.add(ServiceObject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['isError'] = isError;
    data['message'] = message;
    if (payload != null) {
      data['payload'] = payload?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceObject {
  String? serviceID;
  String? serviceName;
  String? availabilityStatus;
  String? criteriaName;

  ServiceObject(
      {this.serviceID, this.criteriaName, this.serviceName, this.availabilityStatus});

  ServiceObject.fromJson(Map<String, dynamic> json) {
    serviceID = json['serviceID'];
    serviceName = json['serviceName'];
    availabilityStatus = json['availabilityStatus'];
    criteriaName = json['criteriaName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['serviceID'] = serviceID;
    data['serviceName'] = serviceName;
    data['availabilityStatus'] = availabilityStatus;
    data['criteriaName'] = criteriaName;
    return data;
  }
}
