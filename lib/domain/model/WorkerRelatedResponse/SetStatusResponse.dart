import 'dart:convert';
/// status : null
/// isError : false
/// message : "Action Done Successfully"
/// errors : null
/// payload : "Preparing"

SetStatusResponse setStatusResponseFromJson(String str) => SetStatusResponse.fromJson(json.decode(str));
String setStatusResponseToJson(SetStatusResponse data) => json.encode(data.toJson());
class SetStatusResponse {
  SetStatusResponse({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  SetStatusResponse.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    errors = json['errors'];
    payload = json['payload'];
  }
  dynamic status;
  bool? isError;
  String? message;
  dynamic errors;
  String? payload;
SetStatusResponse copyWith({  dynamic status,
  bool? isError,
  String? message,
  dynamic errors,
  String? payload,
}) => SetStatusResponse(  status: status ?? this.status,
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
    map['errors'] = errors;
    map['payload'] = payload;
    return map;
  }

}