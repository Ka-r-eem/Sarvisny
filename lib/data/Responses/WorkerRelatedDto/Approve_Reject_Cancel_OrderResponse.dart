import 'package:sarvisny/domain/model/WorkerRelatedResponse/Approve_Reject_Cancel_OrderResponse.dart';

class ApproveRejectCancelOrderResponseDto {
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  PayloadDto? payload;

  ApproveRejectCancelOrderResponseDto({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  ApproveRejectCancelOrderResponseDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = List<dynamic>.from(json['errors']);
    }
    payload =
    json['payload'] != null ? PayloadDto.fromJson(json['payload']) : null;
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
  ApproveRejectCancelOrderResponse toARCorderResponse(){
    return ApproveRejectCancelOrderResponse(
      errors: errors,
      isError: isError,
      message: message,
      status: status,
      payload: payload?.toPayload()
    );
  }
}

class PayloadDto {
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  InsidePayloadDto? payload;

  PayloadDto({this.status, this.isError, this.message, this.errors, this.payload});

  PayloadDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = List<dynamic>.from(json['errors']);
    }
    payload =
    json['payload'] != null ? InsidePayloadDto.fromJson(json['payload']) : null;
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
  Payload toPayload(){
    return Payload(
      status: status,
      message: message,
      isError: isError,
      errors: errors,
      payload: payload?.toInside()
    );
  }
}

class InsidePayloadDto {
  String? orderId;
  String? customerId;
  String? customerFN;
  String? customerLN;
  String? address;
  String? orderStatus;
  double? orderPrice;
  String? orderDate;
  List<ARC_OrderServiceDto>? orderService;

  InsidePayloadDto({
    this.orderId,
    this.customerId,
    this.customerFN,
    this.customerLN,
    this.address,
    this.orderStatus,
    this.orderPrice,
    this.orderDate,
    this.orderService,
  });

  InsidePayloadDto.fromJson(dynamic json) {
    orderId = json['orderId'];
    customerId = json['customerId'];
    customerFN = json['customerFN'];
    customerLN = json['customerLN'];
    address = json['address'];
    orderStatus = json['orderStatus'];
    orderPrice = json['orderPrice'];
    orderDate = json['orderDate'];
    if (json['orderService'] != null) {
      orderService = <ARC_OrderServiceDto>[];
      json['orderService'].forEach((v) {
        orderService!.add(ARC_OrderServiceDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['customerId'] = customerId;
    data['customerFN'] = customerFN;
    data['customerLN'] = customerLN;
    data['address'] = address;
    data['orderStatus'] = orderStatus;
    data['orderPrice'] = orderPrice;
    data['orderDate'] = orderDate;
    if (orderService != null) {
      data['orderService'] = orderService!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  InsidePayload toInside(){
    return InsidePayload(
      address: address,
      orderDate: orderDate,
      orderId: orderId,
      orderPrice: orderPrice,
      orderStatus: orderStatus,
      customerId: customerId,
      customerFN: customerFN,
      customerLN: customerLN,
      orderService: orderService?.map((dto) => dto.toService()).toList()
    );
  }
}

class ARC_OrderServiceDto {
  String? serviceID;
  String? serviceName;
  dynamic parentServiceID;
  dynamic parentServiceName;
  String? criteriaID;
  String? criteriaName;
  String? slotID;
  String? startTime;
  double? price;
  String? problemDescription;

  ARC_OrderServiceDto({
    this.serviceID,
    this.serviceName,
    this.parentServiceID,
    this.parentServiceName,
    this.criteriaID,
    this.criteriaName,
    this.slotID,
    this.startTime,
    this.price,
    this.problemDescription,
  });

  ARC_OrderServiceDto.fromJson(dynamic json) {
    serviceID = json['serviceID'];
    serviceName = json['serviceName'];
    parentServiceID = json['parentServiceID'];
    parentServiceName = json['parentServiceName'];
    criteriaID = json['criteriaID'];
    criteriaName = json['criteriaName'];
    slotID = json['slotID'];
    startTime = json['startTime'];
    price = json['price'];
    problemDescription = json['problemDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceID'] = serviceID;
    data['serviceName'] = serviceName;
    data['parentServiceID'] = parentServiceID;
    data['parentServiceName'] = parentServiceName;
    data['criteriaID'] = criteriaID;
    data['criteriaName'] = criteriaName;
    data['slotID'] = slotID;
    data['startTime'] = startTime;
    data['price'] = price;
    data['problemDescription'] = problemDescription;
    return data;
  }
  ARC_OrderService toService(){
    return ARC_OrderService(
      criteriaName: criteriaName,
      serviceName: serviceName,
      price: price,
      parentServiceID: parentServiceID,
      serviceID: serviceID,
      criteriaID: criteriaID,
      slotID: slotID,
      startTime: startTime,
      parentServiceName: parentServiceName,
      problemDescription: problemDescription
    );
  }
}
