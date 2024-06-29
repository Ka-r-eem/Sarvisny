class CustomersListResponse {
  String? status;
  bool? isError;
  String? message;
  List<CustomerListObject>? payload;


  CustomersListResponse({this.isError});

  CustomersListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['payload'] != null) {
      payload = <CustomerListObject>[];
      json['payload'].forEach((v) {
        payload?.add(CustomerListObject.fromJson(v));
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

class CustomerListObject {
  String? id;
  String? firstName;
  String? lastName;
  String? email;

  CustomerListObject({this.firstName, this.lastName, this.email, this.id});

  CustomerListObject.fromJson(Map<String, dynamic> json) {
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
}
