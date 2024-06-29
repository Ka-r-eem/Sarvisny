import 'package:sarvisny/domain/model/AdminRelatedResponses/GetProviderDistricts.dart';

/// status : "success"
/// isError : false
/// message : ""
/// errors : []
/// payload : [{"districtID":"e575de97-6f25-4835-a403-5ce26fff9f07","districtName":"Maadi","enable":true}]

class GetProviderDistrictsDto {
  GetProviderDistrictsDto({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  GetProviderDistrictsDto.fromJson(dynamic json) {
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
        payload?.add(ProviderDistrictDto.fromJson(v));
      });
    }
  }
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  List<ProviderDistrictDto>? payload;
GetProviderDistrictsDto copyWith({  String? status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  List<ProviderDistrictDto>? payload,
}) => GetProviderDistrictsDto(  status: status ?? this.status,
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
  GetProviderDistricts toProviderDistricts() => GetProviderDistricts(
    status: status,
    isError: isError,
    message: message,
    errors: errors,
    payload: payload?.map((e) => e.toProviderDistrict()).toList(),
  );

}

/// districtID : "e575de97-6f25-4835-a403-5ce26fff9f07"
/// districtName : "Maadi"
/// enable : true

class ProviderDistrictDto {
  ProviderDistrictDto({
      this.districtID, 
      this.districtName, 
      this.enable,});

  ProviderDistrictDto.fromJson(dynamic json) {
    districtID = json['districtID'];
    districtName = json['districtName'];
    enable = json['enable'];
  }
  String? districtID;
  String? districtName;
  bool? enable;
ProviderDistrictDto copyWith({  String? districtID,
  String? districtName,
  bool? enable,
}) => ProviderDistrictDto(  districtID: districtID ?? this.districtID,
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
  ProviderDistrict toProviderDistrict() => ProviderDistrict(
    districtID: districtID,
    districtName: districtName,
    enable: enable,
  );

}