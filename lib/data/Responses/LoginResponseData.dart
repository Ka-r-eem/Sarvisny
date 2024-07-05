import 'dart:convert';
/// status : null
/// isError : false
/// message : "User logged in Successfully"
/// errors : []
/// payload : {"tokenString":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJlNDkwYjFmZC1jMDBhLTRkZTctOWQyOS1hOGQ4MjViNjE2NGIiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJDdXN0b21lciIsImV4cCI6MTcyMDI3ODQyMSwiaXNzIjoiU2VydmljbnkuY29tIiwiYXVkIjoiU2VydmljbnkuY29tIn0.RE-DynkWEQiHTTZ6e4p8psmF3b_GKqinqjOFwMTSJ_w","id":"e490b1fd-c00a-4de7-9d29-a8d825b6164b","role":"Customer"}

LoginResponseData loginResponseDataFromJson(String str) => LoginResponseData.fromJson(json.decode(str));
String loginResponseDataToJson(LoginResponseData data) => json.encode(data.toJson());
class LoginResponseData {
  LoginResponseData({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  LoginResponseData.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  Payload? payload;
LoginResponseData copyWith({  dynamic status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  Payload? payload,
}) => LoginResponseData(  status: status ?? this.status,
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

/// tokenString : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJlNDkwYjFmZC1jMDBhLTRkZTctOWQyOS1hOGQ4MjViNjE2NGIiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJDdXN0b21lciIsImV4cCI6MTcyMDI3ODQyMSwiaXNzIjoiU2VydmljbnkuY29tIiwiYXVkIjoiU2VydmljbnkuY29tIn0.RE-DynkWEQiHTTZ6e4p8psmF3b_GKqinqjOFwMTSJ_w"
/// id : "e490b1fd-c00a-4de7-9d29-a8d825b6164b"
/// role : "Customer"

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));
String payloadToJson(Payload data) => json.encode(data.toJson());
class Payload {
  Payload({
      this.tokenString, 
      this.id, 
      this.role,});

  Payload.fromJson(dynamic json) {
    tokenString = json['tokenString'];
    id = json['id'];
    role = json['role'];
  }
  String? tokenString;
  String? id;
  String? role;
Payload copyWith({  String? tokenString,
  String? id,
  String? role,
}) => Payload(  tokenString: tokenString ?? this.tokenString,
  id: id ?? this.id,
  role: role ?? this.role,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tokenString'] = tokenString;
    map['id'] = id;
    map['role'] = role;
    return map;
  }

}