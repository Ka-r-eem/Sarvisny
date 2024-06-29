
import 'CustomerServicesListResponse.dart';

class FilteredServicesResponse {
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  FilterCriteria? payload;

  FilteredServicesResponse({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  factory FilteredServicesResponse.fromJson(Map<String, dynamic> json) {
    return FilteredServicesResponse(
      status: json['status'],
      isError: json['isError'],
      message: json['message'],
      errors: json['errors'],
      payload: FilterCriteria.fromJson(json['payload']),
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
}

class FilterCriteria {
  String? criteriaID;
  String? criteriaName;
  String? description;
  List<CustomerServiceItem>? services;

  FilterCriteria({
    this.criteriaID,
    this.criteriaName,
    this.description,
    this.services,
  });

  factory FilterCriteria.fromJson(Map<String, dynamic> json) {
    return FilterCriteria(
      criteriaID: json['criteriaID'],
      criteriaName: json['criteriaName'],
      description: json['description'],
      services: _getServices(json['services']),
    );
  }

  static List<CustomerServiceItem>? _getServices(dynamic json) {
    if (json != null) {
      return List<CustomerServiceItem>.from(json.map((item) => CustomerServiceItem.fromJson(item)));
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
}

