import 'package:sarvisny/domain/model/CustomerRelatedResponses/CustomerServicesListResponse.dart';

class CustomerServicesListResponseDto {
  String? status;
  bool? isError;
  String? message;
  List<CustomerServiceItemDto>? payload;

  CustomerServicesListResponseDto({
    this.status,
    this.isError,
    this.message,
    this.payload,
  });

  factory CustomerServicesListResponseDto.fromJson(Map<String, dynamic> json) {
    return CustomerServicesListResponseDto(
      status: json['status'],
      isError: json['isError'],
      message: json['message'],
      payload: List<CustomerServiceItemDto>.from(
        json['payload'].map((item) => CustomerServiceItemDto.fromJson(item)),
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

class CustomerServiceItemDto {
  String? serviceID;
  String? serviceName;
  String? description;
  double? price;
  String? availabilityStatus;
  String? criteriaID;
  String? parentServiceID;
  List<CustomerServiceItemDto>? childServices;
  List<CustomerServiceItemDto>? providerServices;

  CustomerServiceItemDto({
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

  factory CustomerServiceItemDto.fromJson(Map<String, dynamic> json) {
    return CustomerServiceItemDto(
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

  static List<CustomerServiceItemDto>? _getChildServices(dynamic json) {
    if (json != null) {
      return List<CustomerServiceItemDto>.from(
        json.map((item) => CustomerServiceItemDto.fromJson(item)),
      );
    }
    return null;
  }

  static List<CustomerServiceItemDto>? _getProviderServices(dynamic json) {
    if (json != null) {
      return List<CustomerServiceItemDto>.from(
        json.map((item) => CustomerServiceItemDto.fromJson(item)),
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

  CustomerServiceItem toCustomerServiceItem(){
    return CustomerServiceItem(
      description: description,
      criteriaID: criteriaID,
      serviceID: serviceID,
      parentServiceID: parentServiceID,
      price: price,
      serviceName: serviceName,
      availabilityStatus: availabilityStatus,
      providerServices: providerServices?.map((dto) => dto.toCustomerServiceItem()).toList() ,
      childServices: childServices?.map((dto) => dto.toCustomerServiceItem()).toList()
    );
  }
}
