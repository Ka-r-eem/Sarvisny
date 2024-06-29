/// status : "success"
/// isError : false
/// message : ""
/// errors : []
/// payload : [{"districtID":"e575de97-6f25-4835-a403-5ce26fff9f07","districtName":"Maadi","enable":true}]

class GetProviderDistricts {
  GetProviderDistricts({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  GetProviderDistricts.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    if (json['payload'] != null) {
      payload = [];
      json['payload'].forEach((v) {
        payload?.add(ProviderDistrict.fromJson(v));
      });
    }
  }
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  List<ProviderDistrict>? payload;
GetProviderDistricts copyWith({  String? status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  List<ProviderDistrict>? payload,
}) => GetProviderDistricts(  status: status ?? this.status,
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
      map['payload'] = payload?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// districtID : "e575de97-6f25-4835-a403-5ce26fff9f07"
/// districtName : "Maadi"
/// enable : true

class ProviderDistrict {
  ProviderDistrict({
      this.districtID, 
      this.districtName, 
      this.enable,});

  ProviderDistrict.fromJson(dynamic json) {
    districtID = json['districtID'];
    districtName = json['districtName'];
    enable = json['enable'];
  }
  String? districtID;
  String? districtName;
  bool? enable;
ProviderDistrict copyWith({  String? districtID,
  String? districtName,
  bool? enable,
}) => ProviderDistrict(  districtID: districtID ?? this.districtID,
  districtName: districtName ?? this.districtName,
  enable: enable ?? this.enable,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['districtID'] = districtID;
    map['districtName'] = districtName;
    map['enable'] = enable;
    return map;
  }

}