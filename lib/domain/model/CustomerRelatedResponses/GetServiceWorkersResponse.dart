class GetServiceWorkersResponse {
  GetServiceWorkersResponse({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  GetServiceWorkersResponse.fromJson(dynamic json) {
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
        payload?.add(WorkerData.fromJson(v));
      });
    }
  }

  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  List<WorkerData>? payload;

  GetServiceWorkersResponse copyWith({
    dynamic status,
    bool? isError,
    String? message,
    List<dynamic>? errors,
    List<WorkerData>? payload,
  }) =>
      GetServiceWorkersResponse(
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
}

class WorkerData {
  WorkerData({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.availabilities,
  });

  WorkerData.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    if (json['availabilities'] != null) {
      availabilities = [];
      json['availabilities'].forEach((v) {
        availabilities?.add(Availabilities.fromJson(v));
      });
    }
  }

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  List<Availabilities>? availabilities;

  WorkerData copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    List<Availabilities>? availabilities,
  }) =>
      WorkerData(
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
}

class Availabilities {
  Availabilities({
    this.dayOfWeek,
    this.slots,
  });

  Availabilities.fromJson(dynamic json) {
    dayOfWeek = json['dayOfWeek'];
    if (json['slots'] != null) {
      slots = [];
      json['slots'].forEach((v) {
        slots?.add(Slots.fromJson(v));
      });
    }
  }

  String? dayOfWeek;
  List<Slots>? slots;

  Availabilities copyWith({
    String? dayOfWeek,
    List<Slots>? slots,
  }) =>
      Availabilities(
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
}

class Slots {
  Slots({
    this.timeSlotID,
    this.startTime,
    this.endTime,
  });

  Slots.fromJson(dynamic json) {
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
}
