class GetCartResponse {
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  Payload? payload;

  GetCartResponse({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  factory GetCartResponse.fromJson(Map<String, dynamic> json) {
    try {
      return GetCartResponse(
        status: json['status'],
        isError: json['isError'],
        message: json['message'],
        errors: json['errors'] != null ? List<dynamic>.from(json['errors']) : [],
        payload: json['payload'] != null ? Payload.fromJson(json['payload']) : null,
      );
    } catch (e) {
      print('Error parsing GetCartResponse JSON: $e');
      rethrow; // Rethrow the exception to propagate it further
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['isError'] = this.isError;
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.map((v) => v).toList();
    }
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    return data;
  }
}

class Payload {
  String? cartID;
  List<RequestedServices>? requestedServices;

  Payload({
    this.cartID,
    this.requestedServices,
  });

  factory Payload.fromJson(Map<String, dynamic> json) {
    try {
      return Payload(
        cartID: json['cartID'],
        requestedServices: json['requestedServices'] != null
            ? List<RequestedServices>.from(json['requestedServices'].map((x) => RequestedServices.fromJson(x)))
            : [],
      );
    } catch (e) {
      print('Error parsing Payload JSON: $e');
      rethrow; // Rethrow the exception to propagate it further
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cartID'] = this.cartID;
    if (this.requestedServices != null) {
      data['requestedServices'] = this.requestedServices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RequestedServices {
  String? cartServiceRequestID;
  String? providerId;
  String? firstName;
  String? lastName;
  List<Services>? services;
  String? slotID;
  String? requestedDate;
  String? dayOfWeek;
  String? startTime;
  String? districtID;
  String? districtName;
  String? address;
  num? price; // Change type to num? to accept both int and double
  String? problemDescription;

  RequestedServices({
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
    this.problemDescription,
  });

  factory RequestedServices.fromJson(Map<String, dynamic> json) {
    try {
      return RequestedServices(
        cartServiceRequestID: json['cartServiceRequestID'],
        providerId: json['providerId'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        services: json['services'] != null ? List<Services>.from(json['services'].map((x) => Services.fromJson(x))) : [],
        slotID: json['slotID'],
        requestedDate: json['requestedDate'],
        dayOfWeek: json['dayOfWeek'],
        startTime: json['startTime'],
        districtID: json['districtID'],
        districtName: json['districtName'],
        address: json['address'],
        price: json['price'], // Automatically handles int and double due to nullable num?
        problemDescription: json['problemDescription'],
      );
    } catch (e) {
      print('Error parsing RequestedServices JSON: $e');
      rethrow; // Rethrow the exception to propagate it further
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cartServiceRequestID'] = this.cartServiceRequestID;
    data['providerId'] = this.providerId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    data['slotID'] = this.slotID;
    data['requestedDate'] = this.requestedDate;
    data['dayOfWeek'] = this.dayOfWeek;
    data['startTime'] = this.startTime;
    data['districtID'] = this.districtID;
    data['districtName'] = this.districtName;
    data['address'] = this.address;
    data['price'] = this.price;
    data['problemDescription'] = this.problemDescription;
    return data;
  }
}

class Services {
  String? serviceId;
  String? serviceName;
  String? parentServiceID;
  String? parentServiceName;
  dynamic criteriaID;
  dynamic criteriaName;
  num? price; // Change type to num? to accept both int and double

  Services({
    this.serviceId,
    this.serviceName,
    this.parentServiceID,
    this.parentServiceName,
    this.criteriaID,
    this.criteriaName,
    this.price,
  });

  factory Services.fromJson(Map<String, dynamic> json) {
    try {
      return Services(
        serviceId: json['serviceId'],
        serviceName: json['serviceName'],
        parentServiceID: json['parentServiceID'],
        parentServiceName: json['parentServiceName'],
        criteriaID: json['criteriaID'],
        criteriaName: json['criteriaName'],
        price: json['price'], // Automatically handles int and double due to nullable num?
      );
    } catch (e) {
      print('Error parsing Services JSON: $e');
      rethrow; // Rethrow the exception to propagate it further
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceId'] = this.serviceId;
    data['serviceName'] = this.serviceName;
    data['parentServiceID'] = this.parentServiceID;
    data['parentServiceName'] = this.parentServiceName;
    data['criteriaID'] = this.criteriaID;
    data['criteriaName'] = this.criteriaName;
    data['price'] = this.price;
    return data;
  }
}
