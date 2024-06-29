
import 'package:sarvisny/domain/model/WorkerRelatedResponse/SetAvailabilityResponse.dart';
import '../CustomerRelatedDto/GetServiceWorkersResponse.dart';

class SetAvailabilityResponseDto {
  dynamic status;
  bool? isError;
  String? message;
  List<String>? errors;
  AvailabilityDetailsDto? payload;

  SetAvailabilityResponseDto({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  SetAvailabilityResponseDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];

    if (json['errors'] != null) {
      errors = List<String>.from(json['errors']);
    }

    payload = json['payload'] != null ? AvailabilityDetailsDto.fromJson(json['payload']) : null;
  }

  SetAvailabilityResponseDto copyWith({
    dynamic status,
    bool? isError,
    String? message,
    List<String>? errors,
    AvailabilityDetailsDto? payload,
  }) => SetAvailabilityResponseDto(
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
  SetAvailabilityResponse toSetAvailabilityResponse(){
    return SetAvailabilityResponse(
        message: message,
      status: status,
      isError: isError,
      errors: errors,
      payload: payload?.toAvailDetails()
    );
  }
}

class AvailabilityDetailsDto {
  String? availabilityDate;
  String? dayOfWeek;
  List<SlotsDto>? slots;
  String? serviceProviderID;

  AvailabilityDetailsDto({
    this.availabilityDate,
    this.dayOfWeek,
    this.slots,
    this.serviceProviderID,
  });

  AvailabilityDetailsDto.fromJson(dynamic json) {
    availabilityDate = json['availabilityDate'];
    dayOfWeek = json['dayOfWeek'];
    if (json['slots'] != null) {
      slots = List<SlotsDto>.from(json['slots'].map((x) => SlotsDto.fromJson(x)));
    }
    serviceProviderID = json['serviceProviderID'];
  }

  AvailabilityDetailsDto copyWith({
    String? availabilityDate,
    String? dayOfWeek,
    List<SlotsDto>? slots,
    String? serviceProviderID,
  }) => AvailabilityDetailsDto(
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
  AvailabilityDetails toAvailDetails(){
    return AvailabilityDetails(
      dayOfWeek: dayOfWeek,
      availabilityDate: availabilityDate,
      serviceProviderID: serviceProviderID,
      slots: slots?.map((dto) =>dto.toSlot()).toList());
  }

}


