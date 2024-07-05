import 'dart:convert';
/// status : null
/// isError : false
/// message : "User Registered Successfully , Verification Email sent to St@example.com "
/// errors : []
/// payload : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJmNjczZWQ0Ni1kZjgwLTRkZDctYmI1Yy04ZmYwNDk2MmRlYTkiLCJSb2xlIjoic2VydmljZVByb3ZpZGVyIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiU2VydmljZVByb3ZpZGVyIiwiZXhwIjoxNzIwMjgxMDY0LCJpc3MiOiJTZXJ2aWNueS5jb20iLCJhdWQiOiJTZXJ2aWNueS5jb20ifQ.kNQNi3a3q9f6QD6nk3QbF3R7kmtlPFIr0vmkOOO0Yuw"

WorkerRegisterResponseDto workerRegisterResponseDtoFromJson(String str) => WorkerRegisterResponseDto.fromJson(json.decode(str));
String workerRegisterResponseDtoToJson(WorkerRegisterResponseDto data) => json.encode(data.toJson());
class WorkerRegisterResponseDto {
  WorkerRegisterResponseDto({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  WorkerRegisterResponseDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'];
  }
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  String? payload;
WorkerRegisterResponseDto copyWith({  dynamic status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  String? payload,
}) => WorkerRegisterResponseDto(  status: status ?? this.status,
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
    map['payload'] = payload;
    return map;
  }

}