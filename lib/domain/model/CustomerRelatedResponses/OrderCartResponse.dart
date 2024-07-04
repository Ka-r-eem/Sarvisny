import 'dart:convert';
/// status : null
/// isError : false
/// message : "Orders are requested successfully"
/// errors : []
/// payload : {"transactiopnID":"184516bd-2b70-4414-ac53-20a25c46fd35","orders":[{"orderId":"77c7c2d0-e63c-4aad-8ff9-7697a35581ac","customerId":"72143056-afae-4ae1-aee3-cc9d58378541","orderDate":"2024-07-04T14:46:01.8592241Z","providerID":"70568e82-f5e0-4bec-9499-c1a94131cad2","providerFName":"string","providerLName":"string","requestedServices":[{"serviceId":"93b14a31-f784-43d6-be1b-d1f515c3de29","serviceName":"child service"}],"price":112,"requestedSlotID":"021e807f-a4e5-42eb-b83d-247f7ef7abe3","providerDistrictID":"b54fba9c-f750-4462-9f3e-6d5483db096a","address":"maadi","problemDescription":""},{"orderId":"c8096124-0aa0-468b-b94a-3e84b62fc305","customerId":"72143056-afae-4ae1-aee3-cc9d58378541","orderDate":"2024-07-04T14:46:01.9024594Z","providerID":"7e6c5c1c-c11e-456d-aa6c-852aec622216","providerFName":"WORKER","providerLName":"WORKER","requestedServices":[{"serviceId":"93b14a31-f784-43d6-be1b-d1f515c3de29","serviceName":"child service"}],"price":112,"requestedSlotID":"ae6f4349-b4d2-4387-87f4-8a83869b0eff","providerDistrictID":"1d0b9e0a-5b78-427f-82b8-7bb246205ce3","address":"maadi","problemDescription":""},{"orderId":"a9ce4021-6520-4205-aeea-9f55412afdbf","customerId":"72143056-afae-4ae1-aee3-cc9d58378541","orderDate":"2024-07-04T14:46:01.9058661Z","providerID":"7e6c5c1c-c11e-456d-aa6c-852aec622216","providerFName":"WORKER","providerLName":"WORKER","requestedServices":[{"serviceId":"93b14a31-f784-43d6-be1b-d1f515c3de29","serviceName":"child service"}],"price":112,"requestedSlotID":"9bfaae45-e806-4f8e-9a54-028394bc37f3","providerDistrictID":"1d0b9e0a-5b78-427f-82b8-7bb246205ce3","address":"maadi","problemDescription":""}],"ordersTotalPrice":336}

OrderCartResponse orderCartResopnseFromJson(String str) => OrderCartResponse.fromJson(json.decode(str));
String orderCartResopnseToJson(OrderCartResponse data) => json.encode(data.toJson());
class OrderCartResponse {
  OrderCartResponse({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  OrderCartResponse.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  Payload? payload;
OrderCartResponse copyWith({  dynamic status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  Payload? payload,
}) => OrderCartResponse(  status: status ?? this.status,
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

/// transactiopnID : "184516bd-2b70-4414-ac53-20a25c46fd35"
/// orders : [{"orderId":"77c7c2d0-e63c-4aad-8ff9-7697a35581ac","customerId":"72143056-afae-4ae1-aee3-cc9d58378541","orderDate":"2024-07-04T14:46:01.8592241Z","providerID":"70568e82-f5e0-4bec-9499-c1a94131cad2","providerFName":"string","providerLName":"string","requestedServices":[{"serviceId":"93b14a31-f784-43d6-be1b-d1f515c3de29","serviceName":"child service"}],"price":112,"requestedSlotID":"021e807f-a4e5-42eb-b83d-247f7ef7abe3","providerDistrictID":"b54fba9c-f750-4462-9f3e-6d5483db096a","address":"maadi","problemDescription":""},{"orderId":"c8096124-0aa0-468b-b94a-3e84b62fc305","customerId":"72143056-afae-4ae1-aee3-cc9d58378541","orderDate":"2024-07-04T14:46:01.9024594Z","providerID":"7e6c5c1c-c11e-456d-aa6c-852aec622216","providerFName":"WORKER","providerLName":"WORKER","requestedServices":[{"serviceId":"93b14a31-f784-43d6-be1b-d1f515c3de29","serviceName":"child service"}],"price":112,"requestedSlotID":"ae6f4349-b4d2-4387-87f4-8a83869b0eff","providerDistrictID":"1d0b9e0a-5b78-427f-82b8-7bb246205ce3","address":"maadi","problemDescription":""},{"orderId":"a9ce4021-6520-4205-aeea-9f55412afdbf","customerId":"72143056-afae-4ae1-aee3-cc9d58378541","orderDate":"2024-07-04T14:46:01.9058661Z","providerID":"7e6c5c1c-c11e-456d-aa6c-852aec622216","providerFName":"WORKER","providerLName":"WORKER","requestedServices":[{"serviceId":"93b14a31-f784-43d6-be1b-d1f515c3de29","serviceName":"child service"}],"price":112,"requestedSlotID":"9bfaae45-e806-4f8e-9a54-028394bc37f3","providerDistrictID":"1d0b9e0a-5b78-427f-82b8-7bb246205ce3","address":"maadi","problemDescription":""}]
/// ordersTotalPrice : 336

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));
String payloadToJson(Payload data) => json.encode(data.toJson());
class Payload {
  Payload({
      this.transactiopnID, 
      this.orders, 
      this.ordersTotalPrice,});

  Payload.fromJson(dynamic json) {
    transactiopnID = json['transactiopnID'];
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders?.add(Orders.fromJson(v));
      });
    }
    ordersTotalPrice = json['ordersTotalPrice'];
  }
  String? transactiopnID;
  List<Orders>? orders;
  double? ordersTotalPrice;
Payload copyWith({  String? transactiopnID,
  List<Orders>? orders,
  double? ordersTotalPrice,
}) => Payload(  transactiopnID: transactiopnID ?? this.transactiopnID,
  orders: orders ?? this.orders,
  ordersTotalPrice: ordersTotalPrice ?? this.ordersTotalPrice,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['transactiopnID'] = transactiopnID;
    if (orders != null) {
      map['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    map['ordersTotalPrice'] = ordersTotalPrice;
    return map;
  }

}

/// orderId : "77c7c2d0-e63c-4aad-8ff9-7697a35581ac"
/// customerId : "72143056-afae-4ae1-aee3-cc9d58378541"
/// orderDate : "2024-07-04T14:46:01.8592241Z"
/// providerID : "70568e82-f5e0-4bec-9499-c1a94131cad2"
/// providerFName : "string"
/// providerLName : "string"
/// requestedServices : [{"serviceId":"93b14a31-f784-43d6-be1b-d1f515c3de29","serviceName":"child service"}]
/// price : 112
/// requestedSlotID : "021e807f-a4e5-42eb-b83d-247f7ef7abe3"
/// providerDistrictID : "b54fba9c-f750-4462-9f3e-6d5483db096a"
/// address : "maadi"
/// problemDescription : ""

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));
String ordersToJson(Orders data) => json.encode(data.toJson());
class Orders {
  String? orderId;
  String? customerId;
  String? orderDate;
  String? providerID;
  String? providerFName;
  String? providerLName;
  List<OrderRequestedServices>? requestedServices;
  num? price; // Change to num?

  Orders.fromJson(dynamic json) {
    orderId = json['orderId'];
    customerId = json['customerId'];
    orderDate = json['orderDate'];
    providerID = json['providerID'];
    providerFName = json['providerFName'];
    providerLName = json['providerLName'];
    if (json['requestedServices'] != null) {
      requestedServices = [];
      json['requestedServices'].forEach((v) {
        requestedServices?.add(OrderRequestedServices.fromJson(v));
      });
    }
    price = json['price']; // Adjust to handle double as well
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orderId'] = orderId;
    map['customerId'] = customerId;
    map['orderDate'] = orderDate;
    map['providerID'] = providerID;
    map['providerFName'] = providerFName;
    map['providerLName'] = providerLName;
    if (requestedServices != null) {
      map['requestedServices'] =
          requestedServices?.map((v) => v.toJson()).toList();
    }
    map['price'] = price;
    return map;
  }
}


/// serviceId : "93b14a31-f784-43d6-be1b-d1f515c3de29"
/// serviceName : "child service"

OrderRequestedServices requestedServicesFromJson(String str) => OrderRequestedServices.fromJson(json.decode(str));
String requestedServicesToJson(OrderRequestedServices data) => json.encode(data.toJson());
class OrderRequestedServices {
  OrderRequestedServices({
      this.serviceId, 
      this.serviceName,});

  OrderRequestedServices.fromJson(dynamic json) {
    serviceId = json['serviceId'];
    serviceName = json['serviceName'];
  }
  String? serviceId;
  String? serviceName;
OrderRequestedServices copyWith({  String? serviceId,
  String? serviceName,
}) => OrderRequestedServices(  serviceId: serviceId ?? this.serviceId,
  serviceName: serviceName ?? this.serviceName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceId'] = serviceId;
    map['serviceName'] = serviceName;
    return map;
  }

}