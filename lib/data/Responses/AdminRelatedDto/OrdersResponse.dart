import 'package:sarvisny/domain/model/AdminRelatedResponses/OrdersResponse.dart';

class OrdersResponseDto {
  OrdersResponseDto({
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
  List<OrderResponseDto>? payload;

  OrdersResponseDto.fromJson(dynamic json) {
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
          payload?.add(OrderResponseDto.fromJson(v));
        });
      } else {
        payload = [OrderResponseDto.fromJson(json['payload'])];
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

class OrderResponseDto {
  OrderResponseDto({
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
  SingleOrderDetailsDto? payload;

  OrderResponseDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null
        ? SingleOrderDetailsDto.fromJson(json['payload'])
        : null;
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

  OrderResponse toOrder() {
    return OrderResponse(
        errors: errors,
        isError: isError,
        message: message,
        payload: SingleOrderDetailsDto().toOrderDetails(),
        status: status);
  }
}

class SingleOrderDetailsDto {
  SingleOrderDetailsDto({
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

  SingleOrderDetailsDto.fromJson(dynamic json) {
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

  singleOrderDetails toOrderDetails() {
    return singleOrderDetails(
        customerFN: customerFN,
        customerId: customerId,
        orderDate: orderDate,
        orderId: orderId,
        orderPrice: orderPrice,
        orderStatus: orderStatus);
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
