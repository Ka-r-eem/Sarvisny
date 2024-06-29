import 'package:sarvisny/domain/model/AdminRelatedResponses/ServicesListResponse.dart';

class ServicesListResponseDto {
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors; // Added errors field
  List<ServiceObjectDto>? payload;

  ServicesListResponseDto({this.isError, this.status
    , this.message,
    this.errors, // Added errors field
    this.payload});

  ServicesListResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    errors = json['errors']; // Included errors field
    if (json['payload'] != null) {
      payload = <ServiceObjectDto>[];
      json['payload'].forEach((v) {
        payload?.add(ServiceObjectDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['isError'] = isError;
    data['message'] = message;
    data['errors'] = errors; // Included errors field
    if (payload != null) {
      data['payload'] = payload?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  ServicesListResponse toServicesListResponse() {
    return ServicesListResponse(
      isError: isError,
      status: status,
      message: message,
      payload: payload?.map((dto) => dto.toService()).toList()

    );
  }
}

class ServiceObjectDto {
  String? serviceID;
  String? serviceName;
  String? availabilityStatus;
  String? criteriaName;

  ServiceObjectDto({
    this.serviceID,
    this.serviceName,
    this.availabilityStatus,
    this.criteriaName,
  });

  ServiceObjectDto.fromJson(Map<String, dynamic> json) {
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

  ServiceObject toService() {
    return ServiceObject(
      serviceID: serviceID,
      serviceName: serviceName,
      availabilityStatus: availabilityStatus,
      criteriaName: criteriaName,
    );
  }
}
