import 'dart:convert';

// Function to parse JSON string to GetFirstSecMatchedResponse object
GetFirstSecMatchedResponse getFirstSecMatchedResponseFromJson(String str) =>
    GetFirstSecMatchedResponse.fromJson(json.decode(str));

// Function to convert GetFirstSecMatchedResponse object to JSON string
String getFirstSecMatchedResponseToJson(GetFirstSecMatchedResponse data) =>
    json.encode(data.toJson());

class GetFirstSecMatchedResponse {
  GetFirstSecMatchedResponse({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  String? status;
  bool? isError;
  String? message;
  dynamic errors;
  List<SuggestedProviders>? payload;

  factory GetFirstSecMatchedResponse.fromJson(Map<String, dynamic> json) =>
      GetFirstSecMatchedResponse(
        status: json['status'],
        isError: json['isError'],
        message: json['message'],
        errors: json['errors'],
        payload: json['payload'] != null
            ? List<SuggestedProviders>.from(
            json['payload'].map((x) => SuggestedProviders.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'isError': isError,
    'message': message,
    'errors': errors,
    'payload': payload != null
        ? List<dynamic>.from(payload!.map((x) => x.toJson()))
        : null,
  };
}

class SuggestedProviders {
  SuggestedProviders({
    this.providerId,
    this.firstname,
    this.lastname,
    this.email,
    this.availability,
    this.services,
  });

  String? providerId;
  String? firstname;
  String? lastname;
  String? email;
  List<List<Availability>>? availability;
  List<Service>? services;

  factory SuggestedProviders.fromJson(Map<String, dynamic> json) => SuggestedProviders(
    providerId: json['providerId'],
    firstname: json['firstname'],
    lastname: json['lastname'],
    email: json['email'],
    availability: json['availability'] != null
        ? List<List<Availability>>.from(json['availability'].map(
            (x) => List<Availability>.from(
            x.map((x) => Availability.fromJson(x)))))
        : null,
    services: json['services'] != null
        ? List<Service>.from(
        json['services'].map((x) => Service.fromJson(x)))
        : null,
  );

  Map<String, dynamic> toJson() => {
    'providerId': providerId,
    'firstname': firstname,
    'lastname': lastname,
    'email': email,
    'availability': availability != null
        ? List<dynamic>.from(availability!
        .map((x) => List<dynamic>.from(x.map((x) => x.toJson()))))
        : null,
    'services': services != null
        ? List<dynamic>.from(services!.map((x) => x.toJson()))
        : null,
  };
}

class Service {
  Service({
    this.serviceID,
    this.price,
  });

  String? serviceID;
  int? price;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    serviceID: json['serviceID'],
    price: json['price'],
  );

  Map<String, dynamic> toJson() => {
    'serviceID': serviceID,
    'price': price,
  };
}

class Availability {
  Availability({
    this.timeSlotID,
    this.startTime,
    this.dayOfWeek,
  });

  String? timeSlotID;
  String? startTime;
  String? dayOfWeek;

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
    timeSlotID: json['timeSlotID'],
    startTime: json['startTime'],
    dayOfWeek: json['dayOfWeek'],
  );

  Map<String, dynamic> toJson() => {
    'timeSlotID': timeSlotID,
    'startTime': startTime,
    'dayOfWeek': dayOfWeek,
  };
}
