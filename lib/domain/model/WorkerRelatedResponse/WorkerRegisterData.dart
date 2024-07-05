/// userName : "Worker1"
/// email : "Worker@example.com"
/// password : "Worker123#"
/// firstName : "string"
/// lastName : "string"
/// phoneNumber : "string"
/// nationalID : "string"
/// criminalRecord : "string"

class WorkerRegisterData {
  WorkerRegisterData({
      this.userName, 
      this.email, 
      this.password, 
      this.firstName, 
      this.lastName, 
      this.phoneNumber, 
      this.nationalID,
      this.userType,
      });

  WorkerRegisterData.fromJson(dynamic json) {
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    nationalID = json['nationalID'];
    userType = json['userType'];
  }
  String? userName;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? nationalID;
  String? userType;
WorkerRegisterData copyWith({  String? userName,
  String? email,
  String? password,
  String? firstName,
  String? lastName,
  String? phoneNumber,
  String? nationalID,
}) => WorkerRegisterData(  userName: userName ?? this.userName,
  email: email ?? this.email,
  password: password ?? this.password,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  nationalID: nationalID ?? this.nationalID,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = userName;
    map['email'] = email;
    map['password'] = password;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['phoneNumber'] = phoneNumber;
    map['nationalID'] = nationalID;
    return map;
  }

}