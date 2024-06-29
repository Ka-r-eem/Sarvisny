class CustomerServicesListResponse {
  String? status;
  bool? isError;
  String? message;
  List<CustomerServiceItem>? payload;

  CustomerServicesListResponse({
    this.status,
    this.isError,
    this.message,
    this.payload,
  });

  factory CustomerServicesListResponse.fromJson(Map<String, dynamic> json) {
    return CustomerServicesListResponse(
      status: json['status'],
      isError: json['isError'],
      message: json['message'],
      payload: List<CustomerServiceItem>.from(
        json['payload'].map((item) => CustomerServiceItem.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'isError': isError,
      'message': message,
      'payload': payload?.map((item) => item.toJson()).toList(),
    };
  }
}

class CustomerServiceItem {
  String? serviceID;
  String? serviceName;
  String? description;
  double? price;
  String? availabilityStatus;
  String? criteriaID;
  String? parentServiceID;
  List<CustomerServiceItem>? childServices;
  List<CustomerServiceItem>? providerServices;

  CustomerServiceItem({
    this.serviceID,
    this.serviceName,
    this.description,
    this.price,
    this.availabilityStatus,
    this.criteriaID,
    this.parentServiceID,
    this.childServices,
    this.providerServices,
  });

  factory CustomerServiceItem.fromJson(Map<String, dynamic> json) {
    return CustomerServiceItem(
      serviceID: json['serviceID'],
      serviceName: json['serviceName'],
      description: json['description'],
      price: json['price']?.toDouble(),
      availabilityStatus: json['availabilityStatus'],
      criteriaID: json['criteriaID'],
      parentServiceID: json['parentServiceID'],
      childServices: _getChildServices(json['childServices']),
      providerServices: _getProviderServices(json['providerServices']),
    );
  }

  static List<CustomerServiceItem>? _getChildServices(dynamic json) {
    if (json != null) {
      return List<CustomerServiceItem>.from(
        json.map((item) => CustomerServiceItem.fromJson(item)),
      );
    }
    return null;
  }

  static List<CustomerServiceItem>? _getProviderServices(dynamic json) {
    if (json != null) {
      return List<CustomerServiceItem>.from(
        json.map((item) => CustomerServiceItem.fromJson(item)),
      );
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceID': serviceID,
      'serviceName': serviceName,
      'description': description,
      'price': price,
      'availabilityStatus': availabilityStatus,
      'criteriaID': criteriaID,
      'parentServiceID': parentServiceID,
      'childServices': childServices?.map((item) => item.toJson()).toList(),
      'providerServices': providerServices?.map((item) => item.toJson()).toList(),
    };
  }
}
