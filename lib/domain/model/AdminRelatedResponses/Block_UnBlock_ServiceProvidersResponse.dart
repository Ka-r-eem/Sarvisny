/// status : "Success"
/// isError : false
/// message : "Provider Blocked Successfully"
/// errors : []
/// payload : true

class BlockUnBlockServiceProvidersResponse {
  BlockUnBlockServiceProvidersResponse({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  BlockUnBlockServiceProvidersResponse.fromJson(dynamic json) {
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
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  bool? payload;
BlockUnBlockServiceProvidersResponse copyWith({  String? status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  bool? payload,
}) => BlockUnBlockServiceProvidersResponse(  status: status ?? this.status,
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