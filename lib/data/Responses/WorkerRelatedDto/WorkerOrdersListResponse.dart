import '../../../domain/model/WorkerRelatedResponse/ShowOrderDetailsResponse.dart';
import '../../../domain/model/WorkerRelatedResponse/WorkerOrdersListResponse.dart';

class WorkerOrdersListResponseDto {
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  List<OutSidePayloadDto>? payload;

  WorkerOrdersListResponseDto({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  WorkerOrdersListResponseDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = List<dynamic>.from(json['errors']);
    }
    if (json['payload'] != null) {
      payload = List<OutSidePayloadDto>.from(json['payload'].map((x) => OutSidePayloadDto.fromJson(x)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
  WorkerOrdersListResponse toResponse(){
  return WorkerOrdersListResponse(
    errors: errors,
    isError: isError,
    message: message,
    status: status,
    payload: payload?.map((dto) => dto.toOutside()).toList()
  )  ;
  }
}

class OutSidePayloadDto {
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  orderDetails? payload;

  OutSidePayloadDto({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  OutSidePayloadDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = List<dynamic>.from(json['errors']);
    }
    payload = json['payload'] != null ? orderDetails.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['isError'] = isError;
    data['message'] = message;
    if (errors != null) {
      data['errors'] = errors;
    }
    if (payload != null) {
      data['payload'] = payload!.toJson();
    }
    return data;
  }
  OutSidePayload toOutside(){
    return OutSidePayload(
      status: status,
      message: message,
      isError: isError,
      payload: payload,
      errors: errors
    );
  }
}


