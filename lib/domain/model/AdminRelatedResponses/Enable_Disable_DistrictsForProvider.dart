/// status : "success"
/// isError : false
/// message : "District disabled succesfully from provider"
/// errors : []
/// payload : {"providerDistrictID":"c3a4a8a7-5e27-49ac-83cf-0d6c4fe1346b","enable":false,"districtName":"Maadi"}

class EnableDisableDistrictsForProvider {
  EnableDisableDistrictsForProvider({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  EnableDisableDistrictsForProvider.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? ProviderDistrict.fromJson(json['payload']) : null;
  }
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  ProviderDistrict? payload;
EnableDisableDistrictsForProvider copyWith({  String? status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  ProviderDistrict? payload,
}) => EnableDisableDistrictsForProvider(  status: status ?? this.status,
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

/// providerDistrictID : "c3a4a8a7-5e27-49ac-83cf-0d6c4fe1346b"
/// enable : false
/// districtName : "Maadi"

class ProviderDistrict {
  ProviderDistrict({
      this.providerDistrictID, 
      this.enable, 
      this.districtName,});

  ProviderDistrict.fromJson(dynamic json) {
    providerDistrictID = json['providerDistrictID'];
    enable = json['enable'];
    districtName = json['districtName'];
  }
  String? providerDistrictID;
  bool? enable;
  String? districtName;
ProviderDistrict copyWith({  String? providerDistrictID,
  bool? enable,
  String? districtName,
}) => ProviderDistrict(  providerDistrictID: providerDistrictID ?? this.providerDistrictID,
  enable: enable ?? this.enable,
  districtName: districtName ?? this.districtName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['providerDistrictID'] = providerDistrictID;
    map['enable'] = enable;
    map['districtName'] = districtName;
    return map;
  }

}