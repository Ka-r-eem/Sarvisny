/// status : null
/// isError : false
/// message : "Success"
/// errors : []
/// payload : {"firstName":"Customer1111","lastName":"Customer11111","userName":"Customer11111","email":"Customer11111@example.com","address":"Customer"}

class CustomerProfileData {
  CustomerProfileData({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  CustomerProfileData.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? CustomerProfileDetails.fromJson(json['payload']) : null;
  }
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  CustomerProfileDetails? payload;
CustomerProfileData copyWith({  dynamic status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  CustomerProfileDetails? payload,
}) => CustomerProfileData(  status: status ?? this.status,
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

/// firstName : "Customer1111"
/// lastName : "Customer11111"
/// userName : "Customer11111"
/// email : "Customer11111@example.com"
/// address : "Customer"

class CustomerProfileDetails {
  CustomerProfileDetails({
      this.firstName, 
      this.lastName, 
      this.userName, 
      this.email, 
      this.address,});

  CustomerProfileDetails.fromJson(dynamic json) {
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
CustomerProfileDetails copyWith({  String? firstName,
  String? lastName,
  String? userName,
  String? email,
  String? address,
}) => CustomerProfileDetails(  firstName: firstName ?? this.firstName,
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

}