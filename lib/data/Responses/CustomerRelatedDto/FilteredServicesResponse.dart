
import 'package:sarvisny/domain/model/CustomerRelatedResponses/FilteredServicesResponse.dart';

import 'CustomerServicesListResponse.dart';

class FilteredServicesResponseDto {
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  FilterCriteriaDto? payload;

  FilteredServicesResponseDto({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  factory FilteredServicesResponseDto.fromJson(Map<String, dynamic> json) {
    return FilteredServicesResponseDto(
      status: json['status'],
      isError: json['isError'],
      message: json['message'],
      errors: json['errors'],
      payload: FilterCriteriaDto.fromJson(json['payload']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'isError': isError,
      'message': message,
      'errors': errors,
      'payload': payload?.toJson(),
    };
  }
  FilteredServicesResponse toFilteredServicesResponse(){
    return FilteredServicesResponse(
      errors: errors,
      isError: isError,
      message: message,
      status: status,
      payload: payload?.toFilteredCriteria()
    );
  }
}

class FilterCriteriaDto {
  String? criteriaID;
  String? criteriaName;
  String? description;
  List<CustomerServiceItemDto>? services;

  FilterCriteriaDto({
    this.criteriaID,
    this.criteriaName,
    this.description,
    this.services,
  });

  factory FilterCriteriaDto.fromJson(Map<String, dynamic> json) {
    return FilterCriteriaDto(
      criteriaID: json['criteriaID'],
      criteriaName: json['criteriaName'],
      description: json['description'],
      services: _getServices(json['services']),
    );
  }

  static List<CustomerServiceItemDto>? _getServices(dynamic json) {
    if (json != null) {
      return List<CustomerServiceItemDto>.from(json.map((item) => CustomerServiceItemDto.fromJson(item)));
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'criteriaID': criteriaID,
      'criteriaName': criteriaName,
      'description': description,
      'services': services?.map((item) => item.toJson()).toList(),
    };
  }

  FilterCriteria toFilteredCriteria(){
    return FilterCriteria(
      criteriaID: criteriaID,
      criteriaName: criteriaName,
      description: description,
      services: services?.map((dto) => dto.toCustomerServiceItem()).toList()
    );
  }
}

