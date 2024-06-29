class OrdersResponse {
  OrdersResponse({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  List<OrderResponse>? payload;

  OrdersResponse.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    if (json['payload'] != null) {
      if (json['payload'] is List) {
        payload = [];
        json['payload'].forEach((v) {
          payload?.add(OrderResponse.fromJson(v));
        });
      } else {
        payload = [OrderResponse.fromJson(json['payload'])];
      }
    }
  }

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

class OrderResponse {
  OrderResponse({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  singleOrderDetails? payload;

  OrderResponse.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? singleOrderDetails.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['isError'] = isError;
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    if (payload != null) {
      map['payload'] = payload?.toJson();
    }
    return map;
  }
}

class singleOrderDetails {
  singleOrderDetails({
    this.orderId,
    this.customerId,
    this.customerFN,
    this.orderStatus,
    this.orderDate,
    this.orderPrice,
    this.orderService,
  });

  String? orderId;
  String? customerId;
  String? customerFN;
  String? orderStatus;
  String? orderDate;
  double? orderPrice;
  List<AdminOrderService>? orderService;

  singleOrderDetails.fromJson(dynamic json) {
    orderId = json['orderId'];
    customerId = json['customerId'];
    customerFN = json['customerFN'];
    orderStatus = json['orderStatus'];
    orderDate = json['orderDate'];
    orderPrice = json['orderPrice'];
    if (json['orderService'] != null) {
      orderService = [];
      json['orderService'].forEach((v) {
        orderService?.add(AdminOrderService.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orderId'] = orderId;
    map['customerId'] = customerId;
    map['customerFN'] = customerFN;
    map['orderStatus'] = orderStatus;
    map['orderDate'] = orderDate;
    map['orderPrice'] = orderPrice;
    if (orderService != null) {
      map['orderService'] = orderService?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class AdminOrderService {
  AdminOrderService({
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
  String? problemDescription;

  AdminOrderService.fromJson(dynamic json) {
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
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['serviceID'] = serviceID;
    map['serviceName'] = serviceName;
    map['parentServiceID'] = parentServiceID;
    map['parentServiceName'] = parentServiceName;
    map['criteriaID'] = criteriaID;
    map['criteriaName'] = criteriaName;
    map['slotID'] = slotID;
    map['startTime'] = startTime;
    map['price'] = price;
    map['problemDescription'] = problemDescription;
    return map;
  }
}
