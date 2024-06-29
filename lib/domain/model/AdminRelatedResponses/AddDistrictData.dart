/// status : "Success"
/// isError : false
/// message : "District added succesfully"
/// errors : []
/// payload : {"districtID":"e575de97-6f25-4835-a403-5ce26fff9f07","districtName":"Maadi","providerDistricts":null,"availability":true}

class AddDistrictData {
  AddDistrictData({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  AddDistrictData.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? DistrictPayload.fromJson(json['payload']) : null;
  }
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  DistrictPayload? payload;
AddDistrictData copyWith({  String? status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  DistrictPayload? payload,
}) => AddDistrictData(  status: status ?? this.status,
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

/// districtID : "e575de97-6f25-4835-a403-5ce26fff9f07"
/// districtName : "Maadi"
/// providerDistricts : null
/// availability : true

class DistrictPayload {
  DistrictPayload({
      this.districtID, 
      this.districtName, 
      this.providerDistricts, 
      this.availability,});

  DistrictPayload.fromJson(dynamic json) {
    districtID = json['districtID'];
    districtName = json['districtName'];
    providerDistricts = json['providerDistricts'];
    availability = json['availability'];
  }
  String? districtID;
  String? districtName;
  dynamic providerDistricts;
  bool? availability;
DistrictPayload copyWith({  String? districtID,
  String? districtName,
  dynamic providerDistricts,
  bool? availability,
}) => DistrictPayload(  districtID: districtID ?? this.districtID,
  districtName: districtName ?? this.districtName,
  providerDistricts: providerDistricts ?? this.providerDistricts,
  availability: availability ?? this.availability,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['districtID'] = districtID;
    map['districtName'] = districtName;
    map['providerDistricts'] = providerDistricts;
    map['availability'] = availability;
    return map;
  }

}