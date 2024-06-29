
import '../CustomerRelatedResponses/GetServiceWorkersResponse.dart';

class SetAvailabilityResponse {
  dynamic status;
  bool? isError;
  String? message;
  List<String>? errors;
  AvailabilityDetails? payload;

  SetAvailabilityResponse({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  SetAvailabilityResponse.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];

    if (json['errors'] != null) {
      errors = List<String>.from(json['errors']);
    }

    payload = json['payload'] != null ? AvailabilityDetails.fromJson(json['payload']) : null;
  }

  SetAvailabilityResponse copyWith({
    dynamic status,
    bool? isError,
    String? message,
    List<String>? errors,
    AvailabilityDetails? payload,
  }) => SetAvailabilityResponse(
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
      map['errors'] = errors;
    }
    if (payload != null) {
      map['payload'] = payload?.toJson();
    }
    return map;
  }
}

class AvailabilityDetails {
  String? availabilityDate;
  String? dayOfWeek;
  List<Slots>? slots;
  String? serviceProviderID;

  AvailabilityDetails({
    this.availabilityDate,
    this.dayOfWeek,
    this.slots,
    this.serviceProviderID,
  });

  AvailabilityDetails.fromJson(dynamic json) {
    availabilityDate = json['availabilityDate'];
    dayOfWeek = json['dayOfWeek'];
    if (json['slots'] != null) {
      slots = List<Slots>.from(json['slots'].map((x) => Slots.fromJson(x)));
    }
    serviceProviderID = json['serviceProviderID'];
  }

  AvailabilityDetails copyWith({
    String? availabilityDate,
    String? dayOfWeek,
    List<Slots>? slots,
    String? serviceProviderID,
  }) => AvailabilityDetails(
    availabilityDate: availabilityDate ?? this.availabilityDate,
    dayOfWeek: dayOfWeek ?? this.dayOfWeek,
    slots: slots ?? this.slots,
    serviceProviderID: serviceProviderID ?? this.serviceProviderID,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['availabilityDate'] = availabilityDate;
    map['dayOfWeek'] = dayOfWeek;
    if (slots != null) {
      map['slots'] = slots?.map((x) => x.toJson()).toList();
    }
    map['serviceProviderID'] = serviceProviderID;
    return map;
  }
}

