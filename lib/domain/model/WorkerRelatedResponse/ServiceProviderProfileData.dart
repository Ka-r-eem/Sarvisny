import 'dart:convert';
/// status : null
/// isError : false
/// message : "Success"
/// errors : []
/// payload : {"FirstName":"WORKER","LastName":"WORKER","UserName":"WORKER","Email":"eslamelmoataz7@gmail.com","PhoneNumber":"WORKER","Services":[{"serviceID":"7aa2c8ad-d52d-4156-9c94-45fbdf81d2a8","serviceName":"child service","parentServiceID":"da0e4f59-ee9d-4256-bacc-62039d716dfc","parentServiceName":"Roof Painting","criteriaID":null,"criteriaName":null}],"Wallet":{"walletId":"69ccab65-06ea-40a4-abd4-bc5d95040f18","providerId":"585e0d66-d1f2-4fab-a9c6-c11c8724380a","pendingBalance":0,"handedBalance":0,"totalBalance":0},"CompletedOrdersCount":0,"AvgCustomerRate":null,"NationalID":"WORKER","CriminalRecord":"WORKER"}

ServiceProviderProfileData serviceProviderProfileDataFromJson(String str) => ServiceProviderProfileData.fromJson(json.decode(str));
String serviceProviderProfileDataToJson(ServiceProviderProfileData data) => json.encode(data.toJson());
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
/// Services : [{"serviceID":"7aa2c8ad-d52d-4156-9c94-45fbdf81d2a8","serviceName":"child service","parentServiceID":"da0e4f59-ee9d-4256-bacc-62039d716dfc","parentServiceName":"Roof Painting","criteriaID":null,"criteriaName":null}]
/// Wallet : {"walletId":"69ccab65-06ea-40a4-abd4-bc5d95040f18","providerId":"585e0d66-d1f2-4fab-a9c6-c11c8724380a","pendingBalance":0,"handedBalance":0,"totalBalance":0}
/// CompletedOrdersCount : 0
/// AvgCustomerRate : null
/// NationalID : "WORKER"
/// CriminalRecord : "WORKER"

WorkerPersonalDetails payloadFromJson(String str) => WorkerPersonalDetails.fromJson(json.decode(str));
String payloadToJson(WorkerPersonalDetails data) => json.encode(data.toJson());
class WorkerPersonalDetails {
  WorkerPersonalDetails({
      this.firstName, 
      this.lastName, 
      this.userName, 
      this.email, 
      this.phoneNumber, 
      this.services, 
      this.wallet, 
      this.completedOrdersCount, 
      this.avgCustomerRate, 
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
    wallet = json['Wallet'] != null ? Wallet.fromJson(json['Wallet']) : null;
    completedOrdersCount = json['CompletedOrdersCount'];
    avgCustomerRate = json['AvgCustomerRate'];
    nationalID = json['NationalID'];
    criminalRecord = json['CriminalRecord'];
  }
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? phoneNumber;
  List<Services>? services;
  Wallet? wallet;
  num? completedOrdersCount;
  dynamic avgCustomerRate;
  String? nationalID;
  String? criminalRecord;
WorkerPersonalDetails copyWith({  String? firstName,
  String? lastName,
  String? userName,
  String? email,
  String? phoneNumber,
  List<Services>? services,
  Wallet? wallet,
  num? completedOrdersCount,
  dynamic avgCustomerRate,
  String? nationalID,
  String? criminalRecord,
}) => WorkerPersonalDetails(  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  userName: userName ?? this.userName,
  email: email ?? this.email,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  services: services ?? this.services,
  wallet: wallet ?? this.wallet,
  completedOrdersCount: completedOrdersCount ?? this.completedOrdersCount,
  avgCustomerRate: avgCustomerRate ?? this.avgCustomerRate,
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
    if (wallet != null) {
      map['Wallet'] = wallet?.toJson();
    }
    map['CompletedOrdersCount'] = completedOrdersCount;
    map['AvgCustomerRate'] = avgCustomerRate;
    map['NationalID'] = nationalID;
    map['CriminalRecord'] = criminalRecord;
    return map;
  }

}

/// walletId : "69ccab65-06ea-40a4-abd4-bc5d95040f18"
/// providerId : "585e0d66-d1f2-4fab-a9c6-c11c8724380a"
/// pendingBalance : 0
/// handedBalance : 0
/// totalBalance : 0

Wallet walletFromJson(String str) => Wallet.fromJson(json.decode(str));
String walletToJson(Wallet data) => json.encode(data.toJson());
class Wallet {
  Wallet({
      this.walletId, 
      this.providerId, 
      this.pendingBalance, 
      this.handedBalance, 
      this.totalBalance,});

  Wallet.fromJson(dynamic json) {
    walletId = json['walletId'];
    providerId = json['providerId'];
    pendingBalance = json['pendingBalance'];
    handedBalance = json['handedBalance'];
    totalBalance = json['totalBalance'];
  }
  String? walletId;
  String? providerId;
  num? pendingBalance;
  num? handedBalance;
  num? totalBalance;
Wallet copyWith({  String? walletId,
  String? providerId,
  num? pendingBalance,
  num? handedBalance,
  num? totalBalance,
}) => Wallet(  walletId: walletId ?? this.walletId,
  providerId: providerId ?? this.providerId,
  pendingBalance: pendingBalance ?? this.pendingBalance,
  handedBalance: handedBalance ?? this.handedBalance,
  totalBalance: totalBalance ?? this.totalBalance,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['walletId'] = walletId;
    map['providerId'] = providerId;
    map['pendingBalance'] = pendingBalance;
    map['handedBalance'] = handedBalance;
    map['totalBalance'] = totalBalance;
    return map;
  }

}

/// serviceID : "7aa2c8ad-d52d-4156-9c94-45fbdf81d2a8"
/// serviceName : "child service"
/// parentServiceID : "da0e4f59-ee9d-4256-bacc-62039d716dfc"
/// parentServiceName : "Roof Painting"
/// criteriaID : null
/// criteriaName : null

Services servicesFromJson(String str) => Services.fromJson(json.decode(str));
String servicesToJson(Services data) => json.encode(data.toJson());
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
  String? parentServiceID;
  String? parentServiceName;
  dynamic criteriaID;
  dynamic criteriaName;
Services copyWith({  String? serviceID,
  String? serviceName,
  String? parentServiceID,
  String? parentServiceName,
  dynamic criteriaID,
  dynamic criteriaName,
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