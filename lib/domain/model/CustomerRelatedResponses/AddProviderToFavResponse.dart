import 'dart:convert';
/// status : null
/// isError : false
/// message : "Action Done Successfully"
/// errors : null
/// payload : null

AddProviderToFavResponse addProviderToFavResponseFromJson(String str) => AddProviderToFavResponse.fromJson(json.decode(str));
String addProviderToFavResponseToJson(AddProviderToFavResponse data) => json.encode(data.toJson());
class AddProviderToFavResponse {
  AddProviderToFavResponse({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  AddProviderToFavResponse.fromJson(dynamic json) {
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
  dynamic payload;
AddProviderToFavResponse copyWith({  dynamic status,
  bool? isError,
  String? message,
  dynamic errors,
  dynamic payload,
}) => AddProviderToFavResponse(  status: status ?? this.status,
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