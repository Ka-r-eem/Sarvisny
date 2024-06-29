
import '../../../domain/model/WorkerRelatedResponse/WorkerSlotsResponseData.dart';
import '../CustomerRelatedDto/GetServiceWorkersResponse.dart';

class WorkerSlotsResponseDataDto {
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  List<WorkerSlotsDto>? payload;

  WorkerSlotsResponseDataDto({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  WorkerSlotsResponseDataDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = List<dynamic>.from(json['errors']);
    }
    if (json['payload'] != null) {
      payload = List<WorkerSlotsDto>.from(json['payload'].map((x) => WorkerSlotsDto.fromJson(x)));
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
  WorkerSlotsResponseData toWorkerSlotsResponseData() => WorkerSlotsResponseData(
    status: status,
    isError: isError,
    message: message,
    errors: errors,
    payload: payload?.map((dto) => dto.toWorkerSlots()).toList(),
  );
}

class WorkerSlotsDto {
  String? providerAvailabilityID;
  String? availabilityDate;
  String? dayOfWeek;
  List<SlotsDto>? slots;

  WorkerSlotsDto({
    this.providerAvailabilityID,
    this.availabilityDate,
    this.dayOfWeek,
    this.slots,
  });

  WorkerSlotsDto.fromJson(Map<String, dynamic> json) {
    providerAvailabilityID = json['providerAvailabilityID'];
    availabilityDate = json['availabilityDate'];
    dayOfWeek = json['dayOfWeek'];
    if (json['slots'] != null) {
      slots = List<SlotsDto>.from(json['slots'].map((x) => SlotsDto.fromJson(x)));
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

  WorkerSlots toWorkerSlots() => WorkerSlots(
    providerAvailabilityID: providerAvailabilityID,
    availabilityDate: availabilityDate,
    dayOfWeek: dayOfWeek,
    slots: slots?.map((dto) => dto.toSlot()).toList(),
  );
}

