import 'package:sarvisny/domain/model/AdminRelatedResponses/GetDistrictsData.dart';

/// status : "Success"
/// isError : false
/// message : ""
/// errors : []
/// payload : [{"districtID":"e575de97-6f25-4835-a403-5ce26fff9f07","districtName":"Maadi","providers":[]}]

class GetDistrictsDataDto {
  GetDistrictsDataDto({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  GetDistrictsDataDto.fromJson(dynamic json) {
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
        payload?.add(DistrictDataDto.fromJson(v));
      });
    }
  }
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  List<DistrictDataDto>? payload;
GetDistrictsDataDto copyWith({  String? status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  List<DistrictDataDto>? payload,
}) => GetDistrictsDataDto(  status: status ?? this.status,
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
  GetDistrictsData toDistricts() => GetDistrictsData(status: status, isError: isError, message: message, errors: errors, payload: payload?.map((e) => e.toDistrict()).toList());

}

/// districtID : "e575de97-6f25-4835-a403-5ce26fff9f07"
/// districtName : "Maadi"
/// providers : []

class DistrictDataDto {
  DistrictDataDto({
      this.districtID, 
      this.districtName, 
      this.providers,});

  DistrictDataDto.fromJson(dynamic json) {
    districtID = json['districtID'];
    districtName = json['districtName'];
    if (json['providers'] != null) {
      providers = [];
      json['providers'].forEach((v) {
        providers?.add((v));
      });
    }
  }
  String? districtID;
  String? districtName;
  List<dynamic>? providers;
DistrictDataDto copyWith({  String? districtID,
  String? districtName,
  List<dynamic>? providers,
}) => DistrictDataDto(  districtID: districtID ?? this.districtID,
  districtName: districtName ?? this.districtName,
  providers: providers ?? this.providers,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['districtID'] = districtID;
    map['districtName'] = districtName;
    if (providers != null) {
      map['providers'] = providers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
  DistrictData toDistrict() => DistrictData(districtID: districtID, districtName: districtName, providers: providers,);

}