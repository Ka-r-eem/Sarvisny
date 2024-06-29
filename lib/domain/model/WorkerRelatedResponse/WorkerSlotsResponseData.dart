import '../CustomerRelatedResponses/GetServiceWorkersResponse.dart';

class WorkerSlotsResponseData {
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  List<WorkerSlots>? payload;

  WorkerSlotsResponseData({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  WorkerSlotsResponseData.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = List<dynamic>.from(json['errors']);
    }
    if (json['payload'] != null) {
      payload = List<WorkerSlots>.from(json['payload'].map((x) => WorkerSlots.fromJson(x)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['isError'] = isError;
    data['message'] = message;
    if (errors != null) {
      data['errors'] = errors;
    }
    if (payload != null) {
      data['payload'] = payload!.map((x) => x.toJson()).toList();
    }
    return data;
  }
}

class WorkerSlots {
  String? providerAvailabilityID;
  String? availabilityDate;
  String? dayOfWeek;
  List<Slots>? slots;

  WorkerSlots({
    this.providerAvailabilityID,
    this.availabilityDate,
    this.dayOfWeek,
    this.slots,
  });

  WorkerSlots.fromJson(Map<String, dynamic> json) {
    providerAvailabilityID = json['providerAvailabilityID'];
    availabilityDate = json['availabilityDate'];
    dayOfWeek = json['dayOfWeek'];
    if (json['slots'] != null) {
      slots = List<Slots>.from(json['slots'].map((x) => Slots.fromJson(x)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['providerAvailabilityID'] = providerAvailabilityID;
    data['availabilityDate'] = availabilityDate;
    data['dayOfWeek'] = dayOfWeek;
    if (slots != null) {
      data['slots'] = slots!.map((x) => x.toJson()).toList();
    }
    return data;
  }
}

