class CustomerOrdersLogResponse {
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  List<CustomerOrderDetails>? payload;

  CustomerOrdersLogResponse({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  CustomerOrdersLogResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = List<dynamic>.from(json['errors']);
    }
    if (json['payload'] != null) {
      payload = [];
      json['payload'].forEach((v) {
        payload?.add(CustomerOrderDetails.fromJson(v));
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

class CustomerOrderDetails {
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  CustomerOrderPayload? payload;

  CustomerOrderDetails({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  CustomerOrderDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = List<dynamic>.from(json['errors']);
    }
    payload = json['payload'] != null ? CustomerOrderPayload.fromJson(json['payload']) : null;
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
}

class CustomerOrderPayload {
  String? orderId;
  String? orderStatus;
  double? orderPrice;
  String? orderDate;
  List<CustomerOrderService>? orderService;

  CustomerOrderPayload({
    this.orderId,
    this.orderStatus,
    this.orderPrice,
    this.orderDate,
    this.orderService,
  });

  CustomerOrderPayload.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    orderStatus = json['orderStatus'];
    orderPrice = json['orderPrice'];
    orderDate = json['orderDate'];
    if (json['orderService'] != null) {
      orderService = [];
      json['orderService'].forEach((v) {
        orderService?.add(CustomerOrderService.fromJson(v));
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
}

class CustomerOrderService {
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

  CustomerOrderService({
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

  CustomerOrderService.fromJson(Map<String, dynamic> json) {
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
}
