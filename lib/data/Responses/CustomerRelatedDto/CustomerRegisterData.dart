/// userName : "string"
/// email : "user@example.com"
/// password : "string"
/// firstName : "string"
/// lastName : "string"
/// phoneNumber : "string"
/// address : "string"

class CustomerRegisterDataDto {
  CustomerRegisterDataDto({
      this.userName, 
      this.email, 
      this.password, 
      this.firstName, 
      this.lastName, 
      this.phoneNumber, 
      this.address,});

  CustomerRegisterDataDto.fromJson(dynamic json) {
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
  }
  String? userName;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
CustomerRegisterDataDto copyWith({  String? userName,
  String? email,
  String? password,
  String? firstName,
  String? lastName,
  String? phoneNumber,
  String? address,
}) => CustomerRegisterDataDto(  userName: userName ?? this.userName,
  email: email ?? this.email,
  password: password ?? this.password,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  address: address ?? this.address,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = userName;
    map['email'] = email;
    map['password'] = password;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['phoneNumber'] = phoneNumber;
    map['address'] = address;
    return map;
  }

}