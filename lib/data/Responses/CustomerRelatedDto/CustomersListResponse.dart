import 'package:sarvisny/domain/model/CustomerRelatedResponses/CustomersListResponse.dart';

class CustomersListResponseDto {
  String? status;
  bool? isError;
  String? message;
  List<CustomerListObjectDto>? payload;


  CustomersListResponseDto({this.isError});

  CustomersListResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['payload'] != null) {
      payload = <CustomerListObjectDto>[];
      json['payload'].forEach((v) {
        payload?.add(CustomerListObjectDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['isError'] = isError;
    data['message'] = message;
    if (payload != null) {
      data['payload'] = payload?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerListObjectDto {
  String? id;
  String? firstName;
  String? lastName;
  String? email;

  CustomerListObjectDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    return data;
  }

  CustomerListObject toCustomer(){
    return CustomerListObject(
      firstName: firstName,
      lastName: lastName,
      email: email,
      id: id
    );
  }
}
