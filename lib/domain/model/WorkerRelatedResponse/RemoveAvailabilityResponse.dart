/// status : null
/// isError : false
/// message : "provider availability is removed successfully"
/// errors : []
/// payload : {"providerAvailabilityID":"44cd473d-3d83-4b3a-adc3-9f23c39626b9","serviceProviderID":"a9448c34-6c23-43f1-88b5-a2435095c34a","dayOfWeek":"Saturday","slots":[{"timeSlotID":"02038fd1-a486-41d3-9601-b8a8f14990fd","startTime":"05:00:00","endTime":"06:00:00","isActive":true,"providerAvailabilityID":"44cd473d-3d83-4b3a-adc3-9f23c39626b9","providerAvailability":null},{"timeSlotID":"332098ec-9fd6-47da-8df6-c4fc8d0c3145","startTime":"07:00:00","endTime":"08:00:00","isActive":true,"providerAvailabilityID":"44cd473d-3d83-4b3a-adc3-9f23c39626b9","providerAvailability":null},{"timeSlotID":"4331f11b-5f5e-45a0-a5c7-ba085c43ff32","startTime":"04:00:00","endTime":"05:00:00","isActive":true,"providerAvailabilityID":"44cd473d-3d83-4b3a-adc3-9f23c39626b9","providerAvailability":null},{"timeSlotID":"44dd57b8-4a65-47d5-a5e1-ae772903ac28","startTime":"06:00:00","endTime":"07:00:00","isActive":true,"providerAvailabilityID":"44cd473d-3d83-4b3a-adc3-9f23c39626b9","providerAvailability":null},{"timeSlotID":"ff7454ec-f44e-41f7-9c86-3d9ded223622","startTime":"03:00:00","endTime":"04:00:00","isActive":true,"providerAvailabilityID":"44cd473d-3d83-4b3a-adc3-9f23c39626b9","providerAvailability":null}]}

class RemoveAvailabilityResponse {
  RemoveAvailabilityResponse({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  RemoveAvailabilityResponse.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? providerData.fromJson(json['payload']) : null;
  }
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  providerData? payload;
RemoveAvailabilityResponse copyWith({  dynamic status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  providerData? payload,
}) => RemoveAvailabilityResponse(  status: status ?? this.status,
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

/// providerAvailabilityID : "44cd473d-3d83-4b3a-adc3-9f23c39626b9"
/// serviceProviderID : "a9448c34-6c23-43f1-88b5-a2435095c34a"
/// dayOfWeek : "Saturday"
/// slots : [{"timeSlotID":"02038fd1-a486-41d3-9601-b8a8f14990fd","startTime":"05:00:00","endTime":"06:00:00","isActive":true,"providerAvailabilityID":"44cd473d-3d83-4b3a-adc3-9f23c39626b9","providerAvailability":null},{"timeSlotID":"332098ec-9fd6-47da-8df6-c4fc8d0c3145","startTime":"07:00:00","endTime":"08:00:00","isActive":true,"providerAvailabilityID":"44cd473d-3d83-4b3a-adc3-9f23c39626b9","providerAvailability":null},{"timeSlotID":"4331f11b-5f5e-45a0-a5c7-ba085c43ff32","startTime":"04:00:00","endTime":"05:00:00","isActive":true,"providerAvailabilityID":"44cd473d-3d83-4b3a-adc3-9f23c39626b9","providerAvailability":null},{"timeSlotID":"44dd57b8-4a65-47d5-a5e1-ae772903ac28","startTime":"06:00:00","endTime":"07:00:00","isActive":true,"providerAvailabilityID":"44cd473d-3d83-4b3a-adc3-9f23c39626b9","providerAvailability":null},{"timeSlotID":"ff7454ec-f44e-41f7-9c86-3d9ded223622","startTime":"03:00:00","endTime":"04:00:00","isActive":true,"providerAvailabilityID":"44cd473d-3d83-4b3a-adc3-9f23c39626b9","providerAvailability":null}]

class providerData {
  providerData({
      this.providerAvailabilityID, 
      this.serviceProviderID, 
      this.dayOfWeek, 
      this.slots,});

  providerData.fromJson(dynamic json) {
    providerAvailabilityID = json['providerAvailabilityID'];
    serviceProviderID = json['serviceProviderID'];
    dayOfWeek = json['dayOfWeek'];
    if (json['slots'] != null) {
      slots = [];
      json['slots'].forEach((v) {
        slots?.add(Slots.fromJson(v));
      });
    }
  }
  String? providerAvailabilityID;
  String? serviceProviderID;
  String? dayOfWeek;
  List<Slots>? slots;
providerData copyWith({  String? providerAvailabilityID,
  String? serviceProviderID,
  String? dayOfWeek,
  List<Slots>? slots,
}) => providerData(  providerAvailabilityID: providerAvailabilityID ?? this.providerAvailabilityID,
  serviceProviderID: serviceProviderID ?? this.serviceProviderID,
  dayOfWeek: dayOfWeek ?? this.dayOfWeek,
  slots: slots ?? this.slots,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['providerAvailabilityID'] = providerAvailabilityID;
    map['serviceProviderID'] = serviceProviderID;
    map['dayOfWeek'] = dayOfWeek;
    if (slots != null) {
      map['slots'] = slots?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// timeSlotID : "02038fd1-a486-41d3-9601-b8a8f14990fd"
/// startTime : "05:00:00"
/// endTime : "06:00:00"
/// isActive : true
/// providerAvailabilityID : "44cd473d-3d83-4b3a-adc3-9f23c39626b9"
/// providerAvailability : null

class Slots {
  Slots({
      this.timeSlotID, 
      this.startTime, 
      this.endTime, 
      this.isActive, 
      this.providerAvailabilityID, 
      this.providerAvailability,});

  Slots.fromJson(dynamic json) {
    timeSlotID = json['timeSlotID'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    isActive = json['isActive'];
    providerAvailabilityID = json['providerAvailabilityID'];
    providerAvailability = json['providerAvailability'];
  }
  String? timeSlotID;
  String? startTime;
  String? endTime;
  bool? isActive;
  String? providerAvailabilityID;
  dynamic providerAvailability;
Slots copyWith({  String? timeSlotID,
  String? startTime,
  String? endTime,
  bool? isActive,
  String? providerAvailabilityID,
  dynamic providerAvailability,
}) => Slots(  timeSlotID: timeSlotID ?? this.timeSlotID,
  startTime: startTime ?? this.startTime,
  endTime: endTime ?? this.endTime,
  isActive: isActive ?? this.isActive,
  providerAvailabilityID: providerAvailabilityID ?? this.providerAvailabilityID,
  providerAvailability: providerAvailability ?? this.providerAvailability,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timeSlotID'] = timeSlotID;
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    map['isActive'] = isActive;
    map['providerAvailabilityID'] = providerAvailabilityID;
    map['providerAvailability'] = providerAvailability;
    return map;
  }

}