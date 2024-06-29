class ApproveRejectCancelOrderResponse {
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  Payload? payload;

  ApproveRejectCancelOrderResponse({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  ApproveRejectCancelOrderResponse.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = List<dynamic>.from(json['errors']);
    }
    payload =
    json['payload'] != null ? Payload.fromJson(json['payload']) : null;
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
}

class Payload {
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  InsidePayload? payload;

  Payload({this.status, this.isError, this.message, this.errors, this.payload});

  Payload.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = List<dynamic>.from(json['errors']);
    }
    payload =
    json['payload'] != null ? InsidePayload.fromJson(json['payload']) : null;
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
}

class InsidePayload {
  String? orderId;
  String? customerId;
  String? customerFN;
  String? customerLN;
  String? address;
  String? orderStatus;
  double? orderPrice;
  String? orderDate;
  List<ARC_OrderService>? orderService;

  InsidePayload({
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

  InsidePayload.fromJson(dynamic json) {
    orderId = json['orderId'];
    customerId = json['customerId'];
    customerFN = json['customerFN'];
    customerLN = json['customerLN'];
    address = json['address'];
    orderStatus = json['orderStatus'];
    orderPrice = json['orderPrice'];
    orderDate = json['orderDate'];
    if (json['orderService'] != null) {
      orderService = <ARC_OrderService>[];
      json['orderService'].forEach((v) {
        orderService!.add(ARC_OrderService.fromJson(v));
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
}

class ARC_OrderService {
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

  ARC_OrderService({
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

  ARC_OrderService.fromJson(dynamic json) {
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
}
