import '../../../domain/model/WorkerRelatedResponse/ServiceProviderProfileData.dart';

/// status : null
/// isError : false
/// message : "Success"
/// errors : []
/// payload : {"FirstName":"WORKER","LastName":"WORKER","UserName":"WORKER","Email":"eslamelmoataz7@gmail.com","PhoneNumber":"WORKER","Services":[{"serviceID":"fb473c78-8a16-4e49-b178-0ae53cf51079","serviceName":"Roof Painting","parentServiceID":null,"parentServiceName":null,"criteriaID":"de43f9c0-3801-4ec3-959d-d3c5ad10efad","criteriaName":"Home Criteria"}],"NationalID":"WORKER","CriminalRecord":"WORKER"}

class ServiceProviderProfileDataDto {
  ServiceProviderProfileDataDto({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  ServiceProviderProfileDataDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? WorkerPersonalDetailsDto.fromJson(json['payload']) : null;
  }
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  WorkerPersonalDetailsDto? payload;
ServiceProviderProfileDataDto copyWith({  dynamic status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  WorkerPersonalDetailsDto? payload,
}) => ServiceProviderProfileDataDto(  status: status ?? this.status,
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
  ServiceProviderProfileData toServiceProviderProfileData() => ServiceProviderProfileData(
    status: status,
    isError: isError,
    message: message,
    errors: errors,
    payload: payload?.toWorkerPersonalDetails()
  );

}

/// FirstName : "WORKER"
/// LastName : "WORKER"
/// UserName : "WORKER"
/// Email : "eslamelmoataz7@gmail.com"
/// PhoneNumber : "WORKER"
/// Services : [{"serviceID":"fb473c78-8a16-4e49-b178-0ae53cf51079","serviceName":"Roof Painting","parentServiceID":null,"parentServiceName":null,"criteriaID":"de43f9c0-3801-4ec3-959d-d3c5ad10efad","criteriaName":"Home Criteria"}]
/// NationalID : "WORKER"
/// CriminalRecord : "WORKER"

class WorkerPersonalDetailsDto {
  WorkerPersonalDetailsDto({
      this.firstName, 
      this.lastName, 
      this.userName, 
      this.email, 
      this.phoneNumber, 
      this.services, 
      this.nationalID, 
      this.criminalRecord,});

  WorkerPersonalDetailsDto.fromJson(dynamic json) {
    firstName = json['FirstName'];
    lastName = json['LastName'];
    userName = json['UserName'];
    email = json['Email'];
    phoneNumber = json['PhoneNumber'];
    if (json['Services'] != null) {
      services = [];
      json['Services'].forEach((v) {
        services?.add(ServicesDto.fromJson(v));
      });
    }
    nationalID = json['NationalID'];
    criminalRecord = json['CriminalRecord'];
  }
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? phoneNumber;
  List<ServicesDto>? services;
  String? nationalID;
  String? criminalRecord;
WorkerPersonalDetailsDto copyWith({  String? firstName,
  String? lastName,
  String? userName,
  String? email,
  String? phoneNumber,
  List<ServicesDto>? services,
  String? nationalID,
  String? criminalRecord,
}) => WorkerPersonalDetailsDto(  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  userName: userName ?? this.userName,
  email: email ?? this.email,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  services: services ?? this.services,
  nationalID: nationalID ?? this.nationalID,
  criminalRecord: criminalRecord ?? this.criminalRecord,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FirstName'] = firstName;
    map['LastName'] = lastName;
    map['UserName'] = userName;
    map['Email'] = email;
    map['PhoneNumber'] = phoneNumber;
    if (services != null) {
      map['Services'] = services?.map((v) => v.toJson()).toList();
    }
    map['NationalID'] = nationalID;
    map['CriminalRecord'] = criminalRecord;
    return map;
  }

  WorkerPersonalDetails toWorkerPersonalDetails() => WorkerPersonalDetails(
    firstName: firstName,
    lastName: lastName,
    userName: userName,
    email: email,
    phoneNumber: phoneNumber,
    services: services?.map((dto) => dto.toService()).toList(),
    nationalID: nationalID,
    criminalRecord: criminalRecord
  );

}

/// serviceID : "fb473c78-8a16-4e49-b178-0ae53cf51079"
/// serviceName : "Roof Painting"
/// parentServiceID : null
/// parentServiceName : null
/// criteriaID : "de43f9c0-3801-4ec3-959d-d3c5ad10efad"
/// criteriaName : "Home Criteria"

class ServicesDto {
  ServicesDto({
      this.serviceID, 
      this.serviceName, 
      this.parentServiceID, 
      this.parentServiceName, 
      this.criteriaID, 
      this.criteriaName,});

  ServicesDto.fromJson(dynamic json) {
    serviceID = json['serviceID'];
    serviceName = json['serviceName'];
    parentServiceID = json['parentServiceID'];
    parentServiceName = json['parentServiceName'];
    criteriaID = json['criteriaID'];
    criteriaName = json['criteriaName'];
  }
  String? serviceID;
  String? serviceName;
  dynamic parentServiceID;
  dynamic parentServiceName;
  String? criteriaID;
  String? criteriaName;
ServicesDto copyWith({  String? serviceID,
  String? serviceName,
  dynamic parentServiceID,
  dynamic parentServiceName,
  String? criteriaID,
  String? criteriaName,
}) => ServicesDto(  serviceID: serviceID ?? this.serviceID,
  serviceName: serviceName ?? this.serviceName,
  parentServiceID: parentServiceID ?? this.parentServiceID,
  parentServiceName: parentServiceName ?? this.parentServiceName,
  criteriaID: criteriaID ?? this.criteriaID,
  criteriaName: criteriaName ?? this.criteriaName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceID'] = serviceID;
    map['serviceName'] = serviceName;
    map['parentServiceID'] = parentServiceID;
    map['parentServiceName'] = parentServiceName;
    map['criteriaID'] = criteriaID;
    map['criteriaName'] = criteriaName;
    return map;
  }

  Services toService() => Services(
    serviceID: serviceID,
    serviceName: serviceName,
    parentServiceID: parentServiceID,
    parentServiceName: parentServiceName,
    criteriaID: criteriaID,
    criteriaName: criteriaName
  );

}