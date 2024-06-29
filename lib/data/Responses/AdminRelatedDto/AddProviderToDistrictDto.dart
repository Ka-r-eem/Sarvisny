import '../../../domain/model/AdminRelatedResponses/AddProviderToDistrict.dart';

/// status : "success"
/// isError : false
/// message : "District added succesfully to provider"
/// errors : []
/// payload : {"providerDistrictID":"c3a4a8a7-5e27-49ac-83cf-0d6c4fe1346b","enable":true,"districtName":"Maadi"}

class AddProviderToDistrictDto {
  AddProviderToDistrictDto({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  AddProviderToDistrictDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? ProviderDistrictDto.fromJson(json['payload']) : null;
  }
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  ProviderDistrictDto? payload;
AddProviderToDistrictDto copyWith({  String? status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  ProviderDistrictDto? payload,
}) => AddProviderToDistrictDto(  status: status ?? this.status,
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
  AddProviderToDistrict toDistrict() => AddProviderToDistrict(status: status, isError: isError, message: message, errors: errors, payload: payload?.toDistrict(),);

}

/// providerDistrictID : "c3a4a8a7-5e27-49ac-83cf-0d6c4fe1346b"
/// enable : true
/// districtName : "Maadi"

class ProviderDistrictDto {
  ProviderDistrictDto({
      this.providerDistrictID, 
      this.enable, 
      this.districtName,});

  ProviderDistrictDto.fromJson(dynamic json) {
    providerDistrictID = json['providerDistrictID'];
    enable = json['enable'];
    districtName = json['districtName'];
  }
  String? providerDistrictID;
  bool? enable;
  String? districtName;
ProviderDistrictDto copyWith({  String? providerDistrictID,
  bool? enable,
  String? districtName,
}) => ProviderDistrictDto(  providerDistrictID: providerDistrictID ?? this.providerDistrictID,
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
  ProviderDistrict toDistrict() => ProviderDistrict(providerDistrictID: providerDistrictID, enable: enable, districtName: districtName,);

}