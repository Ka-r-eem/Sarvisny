class GetAllMatchedResponse {
  String? status;
  bool? isError;
  String? message;
  dynamic errors;
  List<MatchedProvider>? payload;

  GetAllMatchedResponse({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  factory GetAllMatchedResponse.fromJson(Map<String, dynamic> json) {
    return GetAllMatchedResponse(
      status: json['status'],
      isError: json['isError'],
      message: json['message'],
      errors: json['errors'],
      payload: json['payload'] != null
          ? List<MatchedProvider>.from(
        json['payload'].map((x) => MatchedProvider.fromJson(x)),
      )
          : null,
    );
  }
}

class MatchedProvider {
  String? providerId;
  String? firstname;
  String? lastname;
  String? email;
  String? slotId;
  List<Services>? services;

  MatchedProvider({
    this.providerId,
    this.firstname,
    this.lastname,
    this.email,
    this.slotId,
    this.services,
  });

  factory MatchedProvider.fromJson(Map<String, dynamic> json) {
    return MatchedProvider(
      providerId: json['providerId'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      slotId: json['slotId'],
      services: json['services'] != null
          ? List<Services>.from(json['services'].map((x) => Services.fromJson(x)))
          : null,
    );
  }
}

class Services {
  String? serviceID;
  int? price;

  Services({
    this.serviceID,
    this.price,
  });

  factory Services.fromJson(Map<String, dynamic> json) {
    return Services(
      serviceID: json['serviceID'],
      price: json['price'],
    );
  }
}
