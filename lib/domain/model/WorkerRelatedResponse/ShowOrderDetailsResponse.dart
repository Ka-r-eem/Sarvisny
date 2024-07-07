/// status : "Success"
/// isError : false
/// message : "Action Done Successfully"
/// errors : []
/// payload : {"orderId":"d8e85502-e7b3-4a3f-b78b-83a30840ae45","customerId":"18dbd768-69d5-4323-85ee-5fd223aecb03","customerFN":"Customer1111","customerLN":"Customer11111","address":"Customer","orderStatus":"Pending","orderPrice":99.99,"orderDate":"2024-02-06T13:53:28.919551","orderService":[{"serviceID":"e03884e5-3102-4ca8-8604-a36e7cb3d0d6","serviceName":"Roof Painting","parentServiceID":null,"parentServiceName":null,"criteriaID":"66dfb4f7-a324-4659-b1cf-915b47b59cd3","criteriaName":"Home Criteria","slotID":"55cce071-a68f-4f86-af06-691f9e96bd30","startTime":"06:00:00","price":99.99,"problemDescription":""}]}

class ShowOrderDetailsResponse {
  ShowOrderDetailsResponse({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  ShowOrderDetailsResponse.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? orderDetails.fromJson(json['payload']) : null;
  }
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  orderDetails? payload;
ShowOrderDetailsResponse copyWith({  String? status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  orderDetails? payload,
}) => ShowOrderDetailsResponse(  status: status ?? this.status,
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
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    if (payload != null) {
      map['payload'] = payload?.toJson();
    }
    return map;
  }

}

/// orderId : "d8e85502-e7b3-4a3f-b78b-83a30840ae45"
/// customerId : "18dbd768-69d5-4323-85ee-5fd223aecb03"
/// customerFN : "Customer1111"
/// customerLN : "Customer11111"
/// address : "Customer"
/// orderStatus : "Pending"
/// orderPrice : 99.99
/// orderDate : "2024-02-06T13:53:28.919551"
/// orderService : [{"serviceID":"e03884e5-3102-4ca8-8604-a36e7cb3d0d6","serviceName":"Roof Painting","parentServiceID":null,"parentServiceName":null,"criteriaID":"66dfb4f7-a324-4659-b1cf-915b47b59cd3","criteriaName":"Home Criteria","slotID":"55cce071-a68f-4f86-af06-691f9e96bd30","startTime":"06:00:00","price":99.99,"problemDescription":""}]

class orderDetails {
  orderDetails({
      this.orderId, 
      this.customerId,
      this.customerFN, 
      this.customerLN, 
      this.address, 
      this.orderStatus, 
      this.orderPrice, 
      this.orderDate, 
      this.orderService,});

  orderDetails.fromJson(dynamic json) {
    orderId = json['orderId'];
    customerId = json['customerId'];
    customerFN = json['customerFN'];
    customerLN = json['customerLN'];
    address = json['address'];
    orderStatus = json['orderStatus'];
    orderPrice = json['orderPrice'];
    orderDate = json['orderDate'];
    if (json['orderService'] != null) {
      orderService = [];
      json['orderService'].forEach((v) {
        orderService?.add(OrderService.fromJson(v));
      });
    }
  }
  String? orderId;
  String? customerId;
  String? customerFN;
  String? customerLN;
  String? address;
  String? orderStatus;
  num? orderPrice;
  String? orderDate;
  List<OrderService>? orderService;
orderDetails copyWith({  String? orderId,
  String? customerId,
  String? customerFN,
  String? customerLN,
  String? address,
  String? orderStatus,
  num? orderPrice,
  String? orderDate,
  List<OrderService>? orderService,
}) => orderDetails(  orderId: orderId ?? this.orderId,
  customerId: customerId ?? this.customerId,
  customerFN: customerFN ?? this.customerFN,
  customerLN: customerLN ?? this.customerLN,
  address: address ?? this.address,
  orderStatus: orderStatus ?? this.orderStatus,
  orderPrice: orderPrice ?? this.orderPrice,
  orderDate: orderDate ?? this.orderDate,
  orderService: orderService ?? this.orderService,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orderId'] = orderId;
    map['customerId'] = customerId;
    map['customerFN'] = customerFN;
    map['customerLN'] = customerLN;
    map['address'] = address;
    map['orderStatus'] = orderStatus;
    map['orderPrice'] = orderPrice;
    map['orderDate'] = orderDate;
    if (orderService != null) {
      map['orderService'] = orderService?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// serviceID : "e03884e5-3102-4ca8-8604-a36e7cb3d0d6"
/// serviceName : "Roof Painting"
/// parentServiceID : null
/// parentServiceName : null
/// criteriaID : "66dfb4f7-a324-4659-b1cf-915b47b59cd3"
/// criteriaName : "Home Criteria"
/// slotID : "55cce071-a68f-4f86-af06-691f9e96bd30"
/// startTime : "06:00:00"
/// price : 99.99
/// problemDescription : ""

class OrderService {
  OrderService({
      this.serviceID, 
      this.serviceName, 
      this.parentServiceID, 
      this.parentServiceName, 
      this.criteriaID, 
      this.criteriaName, 
      this.slotID, 
      this.startTime, 
      this.price, 
      this.problemDescription,});

  OrderService.fromJson(dynamic json) {
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
  String? serviceID;
  String? serviceName;
  dynamic parentServiceID;
  dynamic parentServiceName;
  String? criteriaID;
  String? criteriaName;
  String? slotID;
  String? startTime;
  num? price;
  String? problemDescription;
OrderService copyWith({  String? serviceID,
  String? serviceName,
  dynamic parentServiceID,
  dynamic parentServiceName,
  String? criteriaID,
  String? criteriaName,
  String? slotID,
  String? startTime,
  num? price,
  String? problemDescription,
}) => OrderService(  serviceID: serviceID ?? this.serviceID,
  serviceName: serviceName ?? this.serviceName,
  parentServiceID: parentServiceID ?? this.parentServiceID,
  parentServiceName: parentServiceName ?? this.parentServiceName,
  criteriaID: criteriaID ?? this.criteriaID,
  criteriaName: criteriaName ?? this.criteriaName,
  slotID: slotID ?? this.slotID,
  startTime: startTime ?? this.startTime,
  price: price ?? this.price,
  problemDescription: problemDescription ?? this.problemDescription,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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