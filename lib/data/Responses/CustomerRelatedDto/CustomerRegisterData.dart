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
    this.userType,
    this.address,
    this.districtName
  });

  CustomerRegisterDataDto.fromJson(dynamic json) {
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    userType = json['userType'];
    address = json['address'];
    districtName = json['districtName'];
  }

  String? userName;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? userType;
  String? address;
  String? districtName;

  CustomerRegisterDataDto copyWith({
    String? userName,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? userType,
    String? address,
    String? districtName,
  }) => CustomerRegisterDataDto(
    userName: userName ?? this.userName,
    email: email ?? this.email,
    password: password ?? this.password,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    userType: userType ?? this.userType,
    address: address ?? this.address,
    districtName: districtName ?? this.districtName,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = userName;
    map['email'] = email;
    map['password'] = password;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['phoneNumber'] = phoneNumber;
    map['userType'] = userType;
    map['address'] = address;
    map['districtName'] = districtName;
    return map;
  }
}
