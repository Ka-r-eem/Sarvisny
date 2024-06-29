import 'package:sarvisny/data/Responses/AdminRelatedDto/AddServiceData.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/CriteriasListResponse.dart';

class CriteriaListResponseDto {
  String? status;
  bool? isError;
  String? message;
  List<CriteriaObjectDto>? payload;


  CriteriaListResponseDto ({this.status,this.message,this.isError,this.payload});

  CriteriaListResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['payload'] != null) {
      payload = <CriteriaObjectDto>[];
      json['payload'].forEach((v) {
        payload?.add(CriteriaObjectDto.fromJson(v));
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

class CriteriaObjectDto {
  String? criteriaID;
  String? criteriaName;
  String? description;
  List<ServiceToBeAddedDto>? services;

  CriteriaObjectDto({this.criteriaID , this.criteriaName, this.description});

  CriteriaObjectDto.fromJson(Map<String, dynamic> json) {
    criteriaID = json['criteriaID'];
    criteriaName = json['criteriaName'];
    description = json['description'];
    if (json['services'] != null) {
      services = <ServiceToBeAddedDto>[];
      json['services'].forEach((v) {
        services?.add(ServiceToBeAddedDto.fromJson(v));
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
  CriteriaObject toCriteria(){
    return CriteriaObject(criteriaName: criteriaName,description: description,criteriaID: criteriaID);
  }
}

