import '../../../domain/model/AdminRelatedResponses/AddServiceToCriteriaData.dart';

class AddServiceToCriteriaResponseDto {
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  CriteriaPayload? payload;

  AddServiceToCriteriaResponseDto({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  AddServiceToCriteriaResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    errors = json['errors'];
    payload = json['payload'] != null
        ? CriteriaPayload.fromJson(json['payload'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['isError'] = isError;
    data['message'] = message;
    data['errors'] = errors;
    if (payload != null) {
      data['payload'] = payload?.toJson();
    }
    return data;
  }
}

class CriteriaPayload {
  String? criteriaID;
  String? criteriaName;
  String? description;
  List<ServiceAddedToCriteriaDto>? services;

  CriteriaPayload({
    this.criteriaID,
    this.criteriaName,
    this.description,
    this.services,
  });

  CriteriaPayload.fromJson(Map<String, dynamic> json) {
    criteriaID = json['criteriaID'];
    criteriaName = json['criteriaName'];
    description = json['description'];
    if (json['services'] != null) {
      services = [];
      json['services'].forEach((v) {
        services?.add(ServiceAddedToCriteriaDto.fromJson(v));
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

class ServiceAddedToCriteriaDto {
  String? serviceID;
  String? serviceName;
  String? description;
  dynamic price;
  String? availabilityStatus;
  String? criteriaID;
  String? parentServiceID;
  List<dynamic>? childServices;
  List<dynamic>? providerServices;

  ServiceAddedToCriteriaDto({
    this.serviceID,
    this.serviceName,
    this.description,
    this.price,
    this.availabilityStatus,
    this.criteriaID,
    this.parentServiceID,
    this.childServices,
    this.providerServices,
  });

  ServiceAddedToCriteriaDto.fromJson(Map<String, dynamic> json) {
    serviceID = json['serviceID'];
    serviceName = json['serviceName'];
    description = json['description'];
    price = json['price'];
    availabilityStatus = json['availabilityStatus'];
    criteriaID = json['criteriaID'];
    parentServiceID = json['parentServiceID'];
    childServices = json['childServices'];
    providerServices = json['providerServices'];
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
    data['childServices'] = childServices;
    data['providerServices'] = providerServices;
    return data;
  }

  ServiceAddedToCriteria toService() {
    return ServiceAddedToCriteria(
        availabilityStatus: availabilityStatus,
        description: description,
        price: price,
        serviceName: serviceName,
        childServices: childServices,
        criteriaID: criteriaID,
        parentServiceID: parentServiceID,
        providerServices: providerServices,
        serviceID: serviceID);
  }
}
