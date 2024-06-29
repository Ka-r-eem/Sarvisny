class WorkersListResponse {
  String? status;
  bool? isError;
  String? message;
  List<WorkerListObject>? payload;


  WorkersListResponse ({this.isError});

  WorkersListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['payload'] != null) {
      payload = <WorkerListObject>[];
      json['payload'].forEach((v) {
        payload?.add(WorkerListObject.fromJson(v));
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

class WorkerListObject {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  bool? isVerified;

  WorkerListObject (
      {this.id, this.email, this.lastName, this.firstName, this.isVerified});

  WorkerListObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    isVerified = json['isVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['isVerified'] = isVerified;
    return data;
  }
}
