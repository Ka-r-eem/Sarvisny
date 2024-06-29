import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';

class GetServiceWorkersResponseDto {
  GetServiceWorkersResponseDto({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  GetServiceWorkersResponseDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(v);
      });
    }
    if (json['payload'] != null) {
      payload = [];
      json['payload'].forEach((v) {
        payload?.add(WorkerDataDto.fromJson(v));
      });
    }
  }

  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  List<WorkerDataDto>? payload;

  GetServiceWorkersResponseDto copyWith({
    dynamic status,
    bool? isError,
    String? message,
    List<dynamic>? errors,
    List<WorkerDataDto>? payload,
  }) =>
      GetServiceWorkersResponseDto(
        status: status ?? this.status,
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
  GetServiceWorkersResponse toServiceWorkersResponse(){
    return GetServiceWorkersResponse(
      status: status,
      message: message,
      isError: isError,
      errors: errors,
      payload: payload?.map((dto) => dto.toServiceWorker()).toList()
    );
  }
}

class WorkerDataDto {
  WorkerDataDto({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.availabilities,
  });

  WorkerDataDto.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    if (json['availabilities'] != null) {
      availabilities = [];
      json['availabilities'].forEach((v) {
        availabilities?.add(AvailabilitiesDto.fromJson(v));
      });
    }
  }

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  List<AvailabilitiesDto>? availabilities;

  WorkerDataDto copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    List<AvailabilitiesDto>? availabilities,
  }) =>
      WorkerDataDto(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        availabilities: availabilities ?? this.availabilities,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    if (availabilities != null) {
      map['availabilities'] = availabilities?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  WorkerData toServiceWorker() {
    return WorkerData(
        firstName: firstName,
        lastName: lastName,
        availabilities: availabilities?.map((dto) => dto.toAvail()).toList(),
        email: email,
        id: id);
  }
}

class AvailabilitiesDto {
  AvailabilitiesDto({
    this.dayOfWeek,
    this.slots,
  });

  AvailabilitiesDto.fromJson(dynamic json) {
    dayOfWeek = json['dayOfWeek'];
    if (json['slots'] != null) {
      slots = [];
      json['slots'].forEach((v) {
        slots?.add(SlotsDto.fromJson(v));
      });
    }
  }

  String? dayOfWeek;
  List<SlotsDto>? slots;

  AvailabilitiesDto copyWith({
    String? dayOfWeek,
    List<SlotsDto>? slots,
  }) =>
      AvailabilitiesDto(
        dayOfWeek: dayOfWeek ?? this.dayOfWeek,
        slots: slots ?? this.slots,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dayOfWeek'] = dayOfWeek;
    if (slots != null) {
      map['slots'] = slots?.map((v) => v.toJson()).toList();
    }
    return map;
  }
  Availabilities toAvail(){
    return Availabilities(slots: slots?.map((dto) => dto.toSlot()).toList() ,dayOfWeek: dayOfWeek);
  }
}

class SlotsDto {
  SlotsDto({
    this.timeSlotID,
    this.startTime,
    this.endTime,
  });

  SlotsDto.fromJson(dynamic json) {
    timeSlotID = json['timeSlotID'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  String? timeSlotID;
  String? startTime;
  String? endTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timeSlotID'] = timeSlotID;
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    return map;
  }
  Slots toSlot(){
    return Slots(startTime: startTime,endTime: endTime,timeSlotID: timeSlotID);
  }
}
