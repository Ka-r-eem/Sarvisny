import 'dart:convert';
/// status : "success"
/// isError : false
/// message : "success"
/// errors : []
/// payload : [{"orderId":"35047496-741c-4acf-a32b-96a72f8513c6","orderDate":"2024-07-04T16:12:16.412231","orderStatus":"Pending","providerId":"73995353-650b-4715-93f0-1a8904f1de02","providerFN":"WORKER","providerLN":"WORKER","orderPrice":112,"orderService":[{"serviceId":"f880ff5c-d206-4b0e-9aa8-ccff8492e69a","serviceName":"child service","parentServiceID":"160803c0-36f4-4fe0-bb7c-ffd6f05abe90","parentServiceName":"Roof Painting","criteriaID":null,"criteriaName":null,"price":112}],"requestedSlotID":"1b6da2c6-16e0-45a5-a1a3-a4430abe3fa0","requestedDay":"2024-07-06T18:11:55.727617","dayOfWeek":"Saturday","startTime":"06:00:00","districtID":"83cbdf1c-3eca-4d2a-a299-26234a95eb80","districtName":"maadi","address":"maadi","price":112,"problem":"","providerRating":null,"providerComment":null,"customerRating":null,"customerComment":null},{"orderId":"563212f2-2753-46c2-8055-91a894b7c09b","orderDate":"2024-07-04T16:13:28.790612","orderStatus":"Pending","providerId":"73995353-650b-4715-93f0-1a8904f1de02","providerFN":"WORKER","providerLN":"WORKER","orderPrice":112,"orderService":[{"serviceId":"f880ff5c-d206-4b0e-9aa8-ccff8492e69a","serviceName":"child service","parentServiceID":"160803c0-36f4-4fe0-bb7c-ffd6f05abe90","parentServiceName":"Roof Painting","criteriaID":null,"criteriaName":null,"price":112}],"requestedSlotID":"ce0bff44-2a67-4479-bb13-c984004b94c3","requestedDay":"2024-07-06T18:12:59.472096","dayOfWeek":"Saturday","startTime":"05:00:00","districtID":"83cbdf1c-3eca-4d2a-a299-26234a95eb80","districtName":"maadi","address":"maadi","price":112,"problem":"","providerRating":null,"providerComment":null,"customerRating":null,"customerComment":null},{"orderId":"7a78e4a9-e2de-4924-b190-912df40c0976","orderDate":"2024-07-04T16:14:26.547934","orderStatus":"Pending","providerId":"73995353-650b-4715-93f0-1a8904f1de02","providerFN":"WORKER","providerLN":"WORKER","orderPrice":112,"orderService":[{"serviceId":"f880ff5c-d206-4b0e-9aa8-ccff8492e69a","serviceName":"child service","parentServiceID":"160803c0-36f4-4fe0-bb7c-ffd6f05abe90","parentServiceName":"Roof Painting","criteriaID":null,"criteriaName":null,"price":112}],"requestedSlotID":"ecd4b081-54d0-4397-a04a-cc8b864bb0fa","requestedDay":"2024-07-06T18:14:06.423944","dayOfWeek":"Saturday","startTime":"03:00:00","districtID":"83cbdf1c-3eca-4d2a-a299-26234a95eb80","districtName":"maadi","address":"maadi","price":112,"problem":"","providerRating":null,"providerComment":null,"customerRating":null,"customerComment":null},{"orderId":"a9031c43-fa86-4b1d-9619-e2d83b2f0186","orderDate":"2024-07-04T16:14:58.573651","orderStatus":"Pending","providerId":"73995353-650b-4715-93f0-1a8904f1de02","providerFN":"WORKER","providerLN":"WORKER","orderPrice":112,"orderService":[{"serviceId":"f880ff5c-d206-4b0e-9aa8-ccff8492e69a","serviceName":"child service","parentServiceID":"160803c0-36f4-4fe0-bb7c-ffd6f05abe90","parentServiceName":"Roof Painting","criteriaID":null,"criteriaName":null,"price":112}],"requestedSlotID":"6d1e92ab-de85-4b7d-9aa9-ff3e1b478fab","requestedDay":"2024-07-06T18:14:48.938099","dayOfWeek":"Saturday","startTime":"07:00:00","districtID":"83cbdf1c-3eca-4d2a-a299-26234a95eb80","districtName":"maadi","address":"maadi","price":112,"problem":"","providerRating":null,"providerComment":null,"customerRating":null,"customerComment":null}]

CustomerOrdersLogResponse customerOrdersLogResponseFromJson(String str) => CustomerOrdersLogResponse.fromJson(json.decode(str));
String customerOrdersLogResponseToJson(CustomerOrdersLogResponse data) => json.encode(data.toJson());
class CustomerOrdersLogResponse {
  CustomerOrdersLogResponse({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  CustomerOrdersLogResponse.fromJson(dynamic json) {
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
      payload = [];
      json['payload'].forEach((v) {
        payload?.add(CustomerOrdersPayload.fromJson(v));
      });
    }
  }
  String? status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  List<CustomerOrdersPayload>? payload;
CustomerOrdersLogResponse copyWith({  String? status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  List<CustomerOrdersPayload>? payload,
}) => CustomerOrdersLogResponse(  status: status ?? this.status,
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
      map['payload'] = payload?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// orderId : "35047496-741c-4acf-a32b-96a72f8513c6"
/// orderDate : "2024-07-04T16:12:16.412231"
/// orderStatus : "Pending"
/// providerId : "73995353-650b-4715-93f0-1a8904f1de02"
/// providerFN : "WORKER"
/// providerLN : "WORKER"
/// orderPrice : 112
/// orderService : [{"serviceId":"f880ff5c-d206-4b0e-9aa8-ccff8492e69a","serviceName":"child service","parentServiceID":"160803c0-36f4-4fe0-bb7c-ffd6f05abe90","parentServiceName":"Roof Painting","criteriaID":null,"criteriaName":null,"price":112}]
/// requestedSlotID : "1b6da2c6-16e0-45a5-a1a3-a4430abe3fa0"
/// requestedDay : "2024-07-06T18:11:55.727617"
/// dayOfWeek : "Saturday"
/// startTime : "06:00:00"
/// districtID : "83cbdf1c-3eca-4d2a-a299-26234a95eb80"
/// districtName : "maadi"
/// address : "maadi"
/// price : 112
/// problem : ""
/// providerRating : null
/// providerComment : null
/// customerRating : null
/// customerComment : null

CustomerOrdersPayload payloadFromJson(String str) => CustomerOrdersPayload.fromJson(json.decode(str));
String payloadToJson(CustomerOrdersPayload data) => json.encode(data.toJson());
class CustomerOrdersPayload {
  CustomerOrdersPayload({
      this.orderId, 
      this.orderDate, 
      this.orderStatus, 
      this.providerId, 
      this.providerFN, 
      this.providerLN, 
      this.orderPrice, 
      this.orderService, 
      this.requestedSlotID, 
      this.requestedDay, 
      this.dayOfWeek, 
      this.startTime, 
      this.districtID, 
      this.districtName, 
      this.address, 
      this.price, 
      this.problem, 
      this.providerRating, 
      this.providerComment, 
      this.customerRating, 
      this.customerComment,});

  CustomerOrdersPayload.fromJson(dynamic json) {
    orderId = json['orderId'];
    orderDate = json['orderDate'];
    orderStatus = json['orderStatus'];
    providerId = json['providerId'];
    providerFN = json['providerFN'];
    providerLN = json['providerLN'];
    orderPrice = json['orderPrice'];
    if (json['orderService'] != null) {
      orderService = [];
      json['orderService'].forEach((v) {
        orderService?.add(OrderService.fromJson(v));
      });
    }
    requestedSlotID = json['requestedSlotID'];
    requestedDay = json['requestedDay'];
    dayOfWeek = json['dayOfWeek'];
    startTime = json['startTime'];
    districtID = json['districtID'];
    districtName = json['districtName'];
    address = json['address'];
    price = json['price'];
    problem = json['problem'];
    providerRating = json['providerRating'];
    providerComment = json['providerComment'];
    customerRating = json['customerRating'];
    customerComment = json['customerComment'];
  }
  String? orderId;
  String? orderDate;
  String? orderStatus;
  String? providerId;
  String? providerFN;
  String? providerLN;
  num? orderPrice;
  List<OrderService>? orderService;
  String? requestedSlotID;
  String? requestedDay;
  String? dayOfWeek;
  String? startTime;
  String? districtID;
  String? districtName;
  String? address;
  num? price;
  String? problem;
  dynamic providerRating;
  dynamic providerComment;
  dynamic customerRating;
  dynamic customerComment;
CustomerOrdersPayload copyWith({  String? orderId,
  String? orderDate,
  String? orderStatus,
  String? providerId,
  String? providerFN,
  String? providerLN,
  num? orderPrice,
  List<OrderService>? orderService,
  String? requestedSlotID,
  String? requestedDay,
  String? dayOfWeek,
  String? startTime,
  String? districtID,
  String? districtName,
  String? address,
  num? price,
  String? problem,
  dynamic providerRating,
  dynamic providerComment,
  dynamic customerRating,
  dynamic customerComment,
}) => CustomerOrdersPayload(  orderId: orderId ?? this.orderId,
  orderDate: orderDate ?? this.orderDate,
  orderStatus: orderStatus ?? this.orderStatus,
  providerId: providerId ?? this.providerId,
  providerFN: providerFN ?? this.providerFN,
  providerLN: providerLN ?? this.providerLN,
  orderPrice: orderPrice ?? this.orderPrice,
  orderService: orderService ?? this.orderService,
  requestedSlotID: requestedSlotID ?? this.requestedSlotID,
  requestedDay: requestedDay ?? this.requestedDay,
  dayOfWeek: dayOfWeek ?? this.dayOfWeek,
  startTime: startTime ?? this.startTime,
  districtID: districtID ?? this.districtID,
  districtName: districtName ?? this.districtName,
  address: address ?? this.address,
  price: price ?? this.price,
  problem: problem ?? this.problem,
  providerRating: providerRating ?? this.providerRating,
  providerComment: providerComment ?? this.providerComment,
  customerRating: customerRating ?? this.customerRating,
  customerComment: customerComment ?? this.customerComment,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orderId'] = orderId;
    map['orderDate'] = orderDate;
    map['orderStatus'] = orderStatus;
    map['providerId'] = providerId;
    map['providerFN'] = providerFN;
    map['providerLN'] = providerLN;
    map['orderPrice'] = orderPrice;
    if (orderService != null) {
      map['orderService'] = orderService?.map((v) => v.toJson()).toList();
    }
    map['requestedSlotID'] = requestedSlotID;
    map['requestedDay'] = requestedDay;
    map['dayOfWeek'] = dayOfWeek;
    map['startTime'] = startTime;
    map['districtID'] = districtID;
    map['districtName'] = districtName;
    map['address'] = address;
    map['price'] = price;
    map['problem'] = problem;
    map['providerRating'] = providerRating;
    map['providerComment'] = providerComment;
    map['customerRating'] = customerRating;
    map['customerComment'] = customerComment;
    return map;
  }

}

/// serviceId : "f880ff5c-d206-4b0e-9aa8-ccff8492e69a"
/// serviceName : "child service"
/// parentServiceID : "160803c0-36f4-4fe0-bb7c-ffd6f05abe90"
/// parentServiceName : "Roof Painting"
/// criteriaID : null
/// criteriaName : null
/// price : 112

OrderService orderServiceFromJson(String str) => OrderService.fromJson(json.decode(str));
String orderServiceToJson(OrderService data) => json.encode(data.toJson());
class OrderService {
  OrderService({
      this.serviceId, 
      this.serviceName, 
      this.parentServiceID, 
      this.parentServiceName, 
      this.criteriaID, 
      this.criteriaName, 
      this.price,});

  OrderService.fromJson(dynamic json) {
    serviceId = json['serviceId'];
    serviceName = json['serviceName'];
    parentServiceID = json['parentServiceID'];
    parentServiceName = json['parentServiceName'];
    criteriaID = json['criteriaID'];
    criteriaName = json['criteriaName'];
    price = json['price'];
  }
  String? serviceId;
  String? serviceName;
  String? parentServiceID;
  String? parentServiceName;
  dynamic criteriaID;
  dynamic criteriaName;
  num? price;
OrderService copyWith({  String? serviceId,
  String? serviceName,
  String? parentServiceID,
  String? parentServiceName,
  dynamic criteriaID,
  dynamic criteriaName,
  int? price,
}) => OrderService(  serviceId: serviceId ?? this.serviceId,
  serviceName: serviceName ?? this.serviceName,
  parentServiceID: parentServiceID ?? this.parentServiceID,
  parentServiceName: parentServiceName ?? this.parentServiceName,
  criteriaID: criteriaID ?? this.criteriaID,
  criteriaName: criteriaName ?? this.criteriaName,
  price: price ?? this.price,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceId'] = serviceId;
    map['serviceName'] = serviceName;
    map['parentServiceID'] = parentServiceID;
    map['parentServiceName'] = parentServiceName;
    map['criteriaID'] = criteriaID;
    map['criteriaName'] = criteriaName;
    map['price'] = price;
    return map;
  }

}