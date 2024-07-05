import 'dart:convert';

import 'package:sarvisny/domain/model/WorkerRelatedResponse/ServiceProviderProfileData.dart';
/// status : null
/// isError : false
/// message : "Success"
/// errors : []
/// payload : {"FirstName":"WORKER","LastName":"WORKER","UserName":"WORKER","Email":"eslamelmoataz7@gmail.com","PhoneNumber":"WORKER","Services":[{"serviceID":"7aa2c8ad-d52d-4156-9c94-45fbdf81d2a8","serviceName":"child service","parentServiceID":"da0e4f59-ee9d-4256-bacc-62039d716dfc","parentServiceName":"Roof Painting","criteriaID":null,"criteriaName":null}],"Wallet":{"walletId":"69ccab65-06ea-40a4-abd4-bc5d95040f18","providerId":"585e0d66-d1f2-4fab-a9c6-c11c8724380a","pendingBalance":0,"handedBalance":0,"totalBalance":0},"CompletedOrdersCount":0,"AvgCustomerRate":null,"NationalID":"WORKER","CriminalRecord":"WORKER"}

ServiceProviderProfileDataDto serviceProviderProfileDataDtoFromJson(String str) => ServiceProviderProfileDataDto.fromJson(json.decode(str));
String serviceProviderProfileDataDtoToJson(ServiceProviderProfileDataDto data) => json.encode(data.toJson());
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
/// Services : [{"serviceID":"7aa2c8ad-d52d-4156-9c94-45fbdf81d2a8","serviceName":"child service","parentServiceID":"da0e4f59-ee9d-4256-bacc-62039d716dfc","parentServiceName":"Roof Painting","criteriaID":null,"criteriaName":null}]
/// Wallet : {"walletId":"69ccab65-06ea-40a4-abd4-bc5d95040f18","providerId":"585e0d66-d1f2-4fab-a9c6-c11c8724380a","pendingBalance":0,"handedBalance":0,"totalBalance":0}
/// CompletedOrdersCount : 0
/// AvgCustomerRate : null
/// NationalID : "WORKER"
/// CriminalRecord : "WORKER"

WorkerPersonalDetailsDto payloadFromJson(String str) => WorkerPersonalDetailsDto.fromJson(json.decode(str));
String payloadToJson(WorkerPersonalDetailsDto data) => json.encode(data.toJson());
class WorkerPersonalDetailsDto {
  WorkerPersonalDetailsDto({
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
    wallet = json['Wallet'] != null ? WalletDto.fromJson(json['Wallet']) : null;
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
  List<ServicesDto>? services;
  WalletDto? wallet;
  num? completedOrdersCount;
  dynamic avgCustomerRate;
  String? nationalID;
  String? criminalRecord;
WorkerPersonalDetailsDto copyWith({  String? firstName,
  String? lastName,
  String? userName,
  String? email,
  String? phoneNumber,
  List<ServicesDto>? services,
  WalletDto? wallet,
  num? completedOrdersCount,
  dynamic avgCustomerRate,
  String? nationalID,
  String? criminalRecord,
}) => WorkerPersonalDetailsDto(  firstName: firstName ?? this.firstName,
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
  WorkerPersonalDetails toWorkerPersonalDetails() => WorkerPersonalDetails(
    firstName: firstName,
    lastName: lastName,
    userName: userName,
    email: email,
    phoneNumber: phoneNumber,
    services: services?.map((v) => v.toServices()).toList(),
    wallet: wallet?.toWallet(),
    completedOrdersCount: completedOrdersCount,
    avgCustomerRate: avgCustomerRate,
    nationalID: nationalID,
    criminalRecord: criminalRecord,
  );

}

/// walletId : "69ccab65-06ea-40a4-abd4-bc5d95040f18"
/// providerId : "585e0d66-d1f2-4fab-a9c6-c11c8724380a"
/// pendingBalance : 0
/// handedBalance : 0
/// totalBalance : 0

WalletDto walletFromJson(String str) => WalletDto.fromJson(json.decode(str));
String walletToJson(WalletDto data) => json.encode(data.toJson());
class WalletDto {
  WalletDto({
      this.walletId, 
      this.providerId, 
      this.pendingBalance, 
      this.handedBalance, 
      this.totalBalance,});

  WalletDto.fromJson(dynamic json) {
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
WalletDto copyWith({  String? walletId,
  String? providerId,
  num? pendingBalance,
  num? handedBalance,
  num? totalBalance,
}) => WalletDto(  walletId: walletId ?? this.walletId,
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

  Wallet toWallet() => Wallet(walletId: walletId,providerId: providerId,pendingBalance: pendingBalance,handedBalance: handedBalance,totalBalance: totalBalance);

}

/// serviceID : "7aa2c8ad-d52d-4156-9c94-45fbdf81d2a8"
/// serviceName : "child service"
/// parentServiceID : "da0e4f59-ee9d-4256-bacc-62039d716dfc"
/// parentServiceName : "Roof Painting"
/// criteriaID : null
/// criteriaName : null

ServicesDto servicesFromJson(String str) => ServicesDto.fromJson(json.decode(str));
String servicesToJson(ServicesDto data) => json.encode(data.toJson());
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
  String? parentServiceID;
  String? parentServiceName;
  dynamic criteriaID;
  dynamic criteriaName;
ServicesDto copyWith({  String? serviceID,
  String? serviceName,
  String? parentServiceID,
  String? parentServiceName,
  dynamic criteriaID,
  dynamic criteriaName,
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

  Services toServices() => Services(
    serviceID: serviceID,
    serviceName: serviceName,
    parentServiceID: parentServiceID,
    parentServiceName: parentServiceName,
    criteriaID: criteriaID,
    criteriaName: criteriaName,
  );

}