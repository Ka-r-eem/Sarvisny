import 'dart:convert';
/// status : null
/// isError : false
/// message : "Action Done Successfully"
/// errors : null
/// payload : [{"providerId":"acff76a2-1c72-4c5a-9131-34cf7e2e1d8f","providerFName":"WORKER","providerLName":"WORKER","providerCompletedOrdersCount":0,"providerAvgCustomerRate":null}]

GetCustomerFavResponse getCustomerFavResponseFromJson(String str) => GetCustomerFavResponse.fromJson(json.decode(str));
String getCustomerFavResponseToJson(GetCustomerFavResponse data) => json.encode(data.toJson());
class GetCustomerFavResponse {
  GetCustomerFavResponse({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  GetCustomerFavResponse.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    errors = json['errors'];
    if (json['payload'] != null) {
      payload = [];
      json['payload'].forEach((v) {
        payload?.add(FavProvider.fromJson(v));
      });
    }
  }
  dynamic status;
  bool? isError;
  String? message;
  dynamic errors;
  List<FavProvider>? payload;
GetCustomerFavResponse copyWith({  dynamic status,
  bool? isError,
  String? message,
  dynamic errors,
  List<FavProvider>? payload,
}) => GetCustomerFavResponse(  status: status ?? this.status,
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
    if (payload != null) {
      map['payload'] = payload?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// providerId : "acff76a2-1c72-4c5a-9131-34cf7e2e1d8f"
/// providerFName : "WORKER"
/// providerLName : "WORKER"
/// providerCompletedOrdersCount : 0
/// providerAvgCustomerRate : null

FavProvider payloadFromJson(String str) => FavProvider.fromJson(json.decode(str));
String payloadToJson(FavProvider data) => json.encode(data.toJson());
class FavProvider {
  FavProvider({
      this.providerId, 
      this.providerFName, 
      this.providerLName, 
      this.providerCompletedOrdersCount, 
      this.providerAvgCustomerRate,});

  FavProvider.fromJson(dynamic json) {
    providerId = json['providerId'];
    providerFName = json['providerFName'];
    providerLName = json['providerLName'];
    providerCompletedOrdersCount = json['providerCompletedOrdersCount'];
    providerAvgCustomerRate = json['providerAvgCustomerRate'];
  }
  String? providerId;
  String? providerFName;
  String? providerLName;
  int? providerCompletedOrdersCount;
  dynamic providerAvgCustomerRate;
FavProvider copyWith({  String? providerId,
  String? providerFName,
  String? providerLName,
  int? providerCompletedOrdersCount,
  dynamic providerAvgCustomerRate,
}) => FavProvider(  providerId: providerId ?? this.providerId,
  providerFName: providerFName ?? this.providerFName,
  providerLName: providerLName ?? this.providerLName,
  providerCompletedOrdersCount: providerCompletedOrdersCount ?? this.providerCompletedOrdersCount,
  providerAvgCustomerRate: providerAvgCustomerRate ?? this.providerAvgCustomerRate,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['providerId'] = providerId;
    map['providerFName'] = providerFName;
    map['providerLName'] = providerLName;
    map['providerCompletedOrdersCount'] = providerCompletedOrdersCount;
    map['providerAvgCustomerRate'] = providerAvgCustomerRate;
    return map;
  }

}