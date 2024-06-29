/// status : null
/// isError : false
/// message : "Service Request is added successfully to the cart"
/// errors : []
/// payload : {"requestId":"3d715bdd-066c-4cc1-9949-7839752078a3","requestDay":"2024-02-05T00:00:00Z","requestTime":"05:00:00","serviceName":"Roof Painting","providerName":"WORKER WORKER","price":99.99,"problemDescription":"string"}

class AddToCartResponse {
  AddToCartResponse({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  AddToCartResponse.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? RequestDetails.fromJson(json['payload']) : null;
  }
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  RequestDetails? payload;
AddToCartResponse copyWith({  dynamic status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  RequestDetails? payload,
}) => AddToCartResponse(  status: status ?? this.status,
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

/// requestId : "3d715bdd-066c-4cc1-9949-7839752078a3"
/// requestDay : "2024-02-05T00:00:00Z"
/// requestTime : "05:00:00"
/// serviceName : "Roof Painting"
/// providerName : "WORKER WORKER"
/// price : 99.99
/// problemDescription : "string"

class RequestDetails {
  RequestDetails({
      this.requestId, 
      this.requestDay, 
      this.requestTime, 
      this.serviceName, 
      this.providerName, 
      this.price, 
      this.problemDescription,});

  RequestDetails.fromJson(dynamic json) {
    requestId = json['requestId'];
    requestDay = json['requestDay'];
    requestTime = json['requestTime'];
    serviceName = json['serviceName'];
    providerName = json['providerName'];
    price = json['price'];
    problemDescription = json['problemDescription'];
  }
  String? requestId;
  String? requestDay;
  String? requestTime;
  String? serviceName;
  String? providerName;
  double? price;
  String? problemDescription;
RequestDetails copyWith({  String? requestId,
  String? requestDay,
  String? requestTime,
  String? serviceName,
  String? providerName,
  double? price,
  String? problemDescription,
}) => RequestDetails(  requestId: requestId ?? this.requestId,
  requestDay: requestDay ?? this.requestDay,
  requestTime: requestTime ?? this.requestTime,
  serviceName: serviceName ?? this.serviceName,
  providerName: providerName ?? this.providerName,
  price: price ?? this.price,
  problemDescription: problemDescription ?? this.problemDescription,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['requestId'] = requestId;
    map['requestDay'] = requestDay;
    map['requestTime'] = requestTime;
    map['serviceName'] = serviceName;
    map['providerName'] = providerName;
    map['price'] = price;
    map['problemDescription'] = problemDescription;
    return map;
  }

}