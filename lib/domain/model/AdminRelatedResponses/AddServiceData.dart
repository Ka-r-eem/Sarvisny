class AddServiceData {
  String? status;
  bool? isError;
  String? message;
  ServiceToBeAdded? payload;

  AddServiceData({this.payload , this.isError ,this.message,this.status});

  AddServiceData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    payload = json['payload'] != null
        ? ServiceToBeAdded.fromJson(json['payload'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['isError'] = isError;
    data['message'] = message;
    if (payload != null) {
      data['payload'] = payload?.toJson();
    }
    return data;
  }
}

class ServiceToBeAdded {
  String? serviceID;
  String? serviceName;
  String? description;
  dynamic price; // You might want to replace "dynamic" with the actual type if known
  String? availabilityStatus;
  dynamic criteriaID; // You might want to replace "dynamic" with the actual type if known
  dynamic parentServiceID; // You might want to replace "dynamic" with the actual type if known
  List<dynamic>? childServices; // You might want to replace "dynamic" with the actual type if known
  List<dynamic>? providerServices; // You might want to replace "dynamic" with the actual type if known

  ServiceToBeAdded.add({this.serviceName,this.price,this.availabilityStatus,this.description});


  ServiceToBeAdded.fromJson(Map<String, dynamic> json) {
    serviceID = json['serviceID'];
    serviceName = json['serviceName'];
    description = json['description'];
    price = json['price'];
    availabilityStatus = json['availabilityStatus'];
    criteriaID = json['criteriaID'];
    parentServiceID = json['parentServiceID'];
    childServices = json['childServices']; // Replace with the actual field type if known
    providerServices = json['providerServices']; // Replace with the actual field type if known
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['serviceID'] = serviceID;
    data['serviceName'] = serviceName;
    data['description'] = description;
    data['price'] = price;
    data['availabilityStatus'] = availabilityStatus;
    data['criteriaID'] = criteriaID;
    data['parentServiceID'] = parentServiceID;
    data['childServices'] = childServices; // Replace with the actual field type if known
    data['providerServices'] = providerServices; // Replace with the actual field type if known
    return data;
  }
}
