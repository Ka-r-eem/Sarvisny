import '../../../domain/model/CustomerRelatedResponses/CustomerOrdersLogResponse.dart';

class CustomerOrdersLogResponseDto {
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  List<CustomerOrderDetailsDto>? payload;

  CustomerOrdersLogResponseDto({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  CustomerOrdersLogResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = List<dynamic>.from(json['errors']);
    }
    if (json['payload'] != null) {
      payload = [];
      json['payload'].forEach((v) {
        payload?.add(CustomerOrderDetailsDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['isError'] = this.isError;
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors;
    }
    if (this.payload != null) {
      data['payload'] = this.payload?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerOrderDetailsDto {
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  CustomerOrderPayloadDto? payload;

  CustomerOrderDetailsDto({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  CustomerOrderDetailsDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = List<dynamic>.from(json['errors']);
    }
    payload = json['payload'] != null ? CustomerOrderPayloadDto.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['isError'] = this.isError;
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors;
    }
    if (this.payload != null) {
      data['payload'] = this.payload?.toJson();
    }
    return data;
  }

  CustomerOrderDetails toCustomerOrderDetails(){
    return CustomerOrderDetails(
      status: status,
      payload: payload?.toOrderPayload(),
      message: message,
      isError: isError,
      errors: errors
    );
  }
}

class CustomerOrderPayloadDto {
  String? orderId;
  String? orderStatus;
  double? orderPrice;
  String? orderDate;
  List<CustomerOrderServiceDto>? orderService;

  CustomerOrderPayloadDto({
    this.orderId,
    this.orderStatus,
    this.orderPrice,
    this.orderDate,
    this.orderService,
  });

  CustomerOrderPayloadDto.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    orderStatus = json['orderStatus'];
    orderPrice = json['orderPrice'];
    orderDate = json['orderDate'];
    if (json['orderService'] != null) {
      orderService = [];
      json['orderService'].forEach((v) {
        orderService?.add(CustomerOrderServiceDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['orderStatus'] = this.orderStatus;
    data['orderPrice'] = this.orderPrice;
    data['orderDate'] = this.orderDate;
    if (this.orderService != null) {
      data['orderService'] = this.orderService?.map((v) => v.toJson()).toList();
    }
    return data;
  }
  CustomerOrderPayload toOrderPayload(){
    return CustomerOrderPayload(
      orderStatus: orderStatus,
      orderPrice: orderPrice,
      orderId: orderId,
      orderDate: orderDate,
      orderService: orderService?.map((dto) => dto.toOrderService()).toList()
    );
  }
}

class CustomerOrderServiceDto {
  String? id;
  String? firstName;
  String? lastName;
  String? serviceID;
  String? serviceName;
  dynamic parentServiceID;
  dynamic parentServiceName;
  String? criteriaID;
  String? criteriaName;
  String? slotID;
  String? startTime;
  double? price;
  dynamic problemDescription;

  CustomerOrderServiceDto({
    this.id,
    this.firstName,
    this.lastName,
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

  CustomerOrderServiceDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['serviceID'] = this.serviceID;
    data['serviceName'] = this.serviceName;
    data['parentServiceID'] = this.parentServiceID;
    data['parentServiceName'] = this.parentServiceName;
    data['criteriaID'] = this.criteriaID;
    data['criteriaName'] = this.criteriaName;
    data['slotID'] = this.slotID;
    data['startTime'] = this.startTime;
    data['price'] = this.price;
    data['problemDescription'] = this.problemDescription;
    return data;
  }
  CustomerOrderService toOrderService(){
    return CustomerOrderService(
      id: id,
      startTime: startTime,
      firstName: firstName,
      lastName: lastName,
      criteriaID: criteriaID,
      criteriaName: criteriaName,
      serviceName: serviceName,
      serviceID: serviceID,
      parentServiceID: parentServiceID,
      price: price,
      parentServiceName: parentServiceName,
      problemDescription: problemDescription,
      slotID: slotID,
    );
  }

}
