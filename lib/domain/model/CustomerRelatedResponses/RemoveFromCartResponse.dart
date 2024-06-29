/// status : null
/// isError : false
/// message : "Sucess"
/// errors : []
/// payload : {"serviceRequestID":"c2907c6a-5e93-49a6-9ea6-26aa75207fbc","slotID":"4de86432-2687-4c05-927b-b92cc0447447","addedTime":"2024-02-05T14:06:36.243851"}

class RemoveFromCartResponse {
  RemoveFromCartResponse({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  RemoveFromCartResponse.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? RemoveFromCartPayload.fromJson(json['payload']) : null;
  }
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  RemoveFromCartPayload? payload;
RemoveFromCartResponse copyWith({  dynamic status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  RemoveFromCartPayload? payload,
}) => RemoveFromCartResponse(  status: status ?? this.status,
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

/// serviceRequestID : "c2907c6a-5e93-49a6-9ea6-26aa75207fbc"
/// slotID : "4de86432-2687-4c05-927b-b92cc0447447"
/// addedTime : "2024-02-05T14:06:36.243851"

class RemoveFromCartPayload {
  RemoveFromCartPayload({
      this.serviceRequestID, 
      this.slotID, 
      this.addedTime,});

  RemoveFromCartPayload.fromJson(dynamic json) {
    serviceRequestID = json['serviceRequestID'];
    slotID = json['slotID'];
    addedTime = json['addedTime'];
  }
  String? serviceRequestID;
  String? slotID;
  String? addedTime;
RemoveFromCartPayload copyWith({  String? serviceRequestID,
  String? slotID,
  String? addedTime,
}) => RemoveFromCartPayload(  serviceRequestID: serviceRequestID ?? this.serviceRequestID,
  slotID: slotID ?? this.slotID,
  addedTime: addedTime ?? this.addedTime,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceRequestID'] = serviceRequestID;
    map['slotID'] = slotID;
    map['addedTime'] = addedTime;
    return map;
  }

}