class CriteriaListResponse {
  String? status;
  bool? isError;
  String? message;
  List<CriteriaObject>? payload;


  CriteriaListResponse ({this.status,this.message,this.isError,this.payload});

  CriteriaListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['payload'] != null) {
      payload = <CriteriaObject>[];
      json['payload'].forEach((v) {
        payload?.add(CriteriaObject.fromJson(v));
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

class CriteriaObject {
  String? criteriaID;
  String? criteriaName;
  String? description;
  List<CriteriaServiceObject>? services;

  CriteriaObject({this.criteriaID , this.criteriaName, this.description});

  CriteriaObject.fromJson(Map<String, dynamic> json) {
    criteriaID = json['criteriaID'];
    criteriaName = json['criteriaName'];
    description = json['description'];
    if (json['services'] != null) {
      services = <CriteriaServiceObject>[];
      json['services'].forEach((v) {
        services?.add(CriteriaServiceObject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['criteriaID'] = criteriaID;
    data['criteriaName'] = criteriaName;
    data['description'] = description;
    if (services != null) {
      data['services'] = services?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CriteriaServiceObject {
  String? serviceID;
  String? serviceName;
  String? description;
  double? price;
  String? availabilityStatus;
  String? criteriaID;
  String? parentServiceID;
  List<dynamic>? childServices; // You might want to replace "dynamic" with the actual type if known
  List<dynamic>? providerServices; // You might want to replace "dynamic" with the actual type if known



  CriteriaServiceObject.fromJson(Map<String, dynamic> json) {
    serviceID = json['serviceID'];
    serviceName = json['serviceName'];
    description = json['description'];
    price = json['price'];
    availabilityStatus = json['availabilityStatus'];
    criteriaID = json['criteriaID'];
    parentServiceID = json['parentServiceID'];
    childServices = json['childServices']; // Replace with the actual field type if known
    providerServices = json['providerServices']; // Replace with the actual field type if known
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['serviceID'] = serviceID;
    data['serviceName'] = serviceName;
    data['description'] = description;
    data['price'] = price;
    data['availabilityStatus'] = availabilityStatus;
    data['criteriaID'] = criteriaID;
    data['parentServiceID'] = parentServiceID;
    data['childServices'] = childServices; // Replace with the actual field type if known
    data['providerServices'] = providerServices; // Replace with the actual field type if known
    return data;
  }
}
