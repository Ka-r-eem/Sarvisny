import 'package:sarvisny/domain/model/CustomerRelatedResponses/CustomerProfileData.dart';

/// status : null
/// isError : false
/// message : "Success"
/// errors : []
/// payload : {"firstName":"Customer1111","lastName":"Customer11111","userName":"Customer11111","email":"Customer11111@example.com","address":"Customer"}

class CustomerProfileDataDto {
  CustomerProfileDataDto({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  CustomerProfileDataDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? CustomerProfileDetailsDto.fromJson(json['payload']) : null;
  }
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  CustomerProfileDetailsDto? payload;
CustomerProfileDataDto copyWith({  dynamic status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  CustomerProfileDetailsDto? payload,
}) => CustomerProfileDataDto(  status: status ?? this.status,
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

  CustomerProfileData toCustomerProfileData(){
    return CustomerProfileData(
      errors: errors,
      isError: isError,
      message: message,
      payload: payload?.toCustomerProfileDetails()
    );
  }

}

/// firstName : "Customer1111"
/// lastName : "Customer11111"
/// userName : "Customer11111"
/// email : "Customer11111@example.com"
/// address : "Customer"

class CustomerProfileDetailsDto {
  CustomerProfileDetailsDto({
      this.firstName, 
      this.lastName, 
      this.userName, 
      this.email, 
      this.address,});

  CustomerProfileDetailsDto.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    email = json['email'];
    address = json['address'];
  }
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? address;
CustomerProfileDetailsDto copyWith({  String? firstName,
  String? lastName,
  String? userName,
  String? email,
  String? address,
}) => CustomerProfileDetailsDto(  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  userName: userName ?? this.userName,
  email: email ?? this.email,
  address: address ?? this.address,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['userName'] = userName;
    map['email'] = email;
    map['address'] = address;
    return map;
  }
  CustomerProfileDetails toCustomerProfileDetails(){
    return CustomerProfileDetails(
      firstName: firstName,
      lastName: lastName,
      email: email,
      userName: userName,
      address: address
    );
  }

}