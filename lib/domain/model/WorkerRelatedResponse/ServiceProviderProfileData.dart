/// status : null
/// isError : false
/// message : "Success"
/// errors : []
/// payload : {"FirstName":"WORKER","LastName":"WORKER","UserName":"WORKER","Email":"eslamelmoataz7@gmail.com","PhoneNumber":"WORKER","Services":[{"serviceID":"fb473c78-8a16-4e49-b178-0ae53cf51079","serviceName":"Roof Painting","parentServiceID":null,"parentServiceName":null,"criteriaID":"de43f9c0-3801-4ec3-959d-d3c5ad10efad","criteriaName":"Home Criteria"}],"NationalID":"WORKER","CriminalRecord":"WORKER"}

class ServiceProviderProfileData {
  ServiceProviderProfileData({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  ServiceProviderProfileData.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? WorkerPersonalDetails.fromJson(json['payload']) : null;
  }
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  WorkerPersonalDetails? payload;
ServiceProviderProfileData copyWith({  dynamic status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  WorkerPersonalDetails? payload,
}) => ServiceProviderProfileData(  status: status ?? this.status,
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

/// FirstName : "WORKER"
/// LastName : "WORKER"
/// UserName : "WORKER"
/// Email : "eslamelmoataz7@gmail.com"
/// PhoneNumber : "WORKER"
/// Services : [{"serviceID":"fb473c78-8a16-4e49-b178-0ae53cf51079","serviceName":"Roof Painting","parentServiceID":null,"parentServiceName":null,"criteriaID":"de43f9c0-3801-4ec3-959d-d3c5ad10efad","criteriaName":"Home Criteria"}]
/// NationalID : "WORKER"
/// CriminalRecord : "WORKER"

class WorkerPersonalDetails {
  WorkerPersonalDetails({
      this.firstName, 
      this.lastName, 
      this.userName, 
      this.email, 
      this.phoneNumber, 
      this.services, 
      this.nationalID, 
      this.criminalRecord,});

  WorkerPersonalDetails.fromJson(dynamic json) {
    firstName = json['FirstName'];
    lastName = json['LastName'];
    userName = json['UserName'];
    email = json['Email'];
    phoneNumber = json['PhoneNumber'];
    if (json['Services'] != null) {
      services = [];
      json['Services'].forEach((v) {
        services?.add(Services.fromJson(v));
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
  List<Services>? services;
  String? nationalID;
  String? criminalRecord;
WorkerPersonalDetails copyWith({  String? firstName,
  String? lastName,
  String? userName,
  String? email,
  String? phoneNumber,
  List<Services>? services,
  String? nationalID,
  String? criminalRecord,
}) => WorkerPersonalDetails(  firstName: firstName ?? this.firstName,
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

}

/// serviceID : "fb473c78-8a16-4e49-b178-0ae53cf51079"
/// serviceName : "Roof Painting"
/// parentServiceID : null
/// parentServiceName : null
/// criteriaID : "de43f9c0-3801-4ec3-959d-d3c5ad10efad"
/// criteriaName : "Home Criteria"

class Services {
  Services({
      this.serviceID, 
      this.serviceName, 
      this.parentServiceID, 
      this.parentServiceName, 
      this.criteriaID, 
      this.criteriaName,});

  Services.fromJson(dynamic json) {
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
Services copyWith({  String? serviceID,
  String? serviceName,
  dynamic parentServiceID,
  dynamic parentServiceName,
  String? criteriaID,
  String? criteriaName,
}) => Services(  serviceID: serviceID ?? this.serviceID,
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

}