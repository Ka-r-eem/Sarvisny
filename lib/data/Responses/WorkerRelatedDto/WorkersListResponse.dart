import 'package:sarvisny/domain/model/WorkerRelatedResponse/WorkersListResponse.dart';

class WorkersListResponseDto {
  String? status;
  bool? isError;
  String? message;
  List<WorkerListObjectDto>? payload;


  WorkersListResponseDto ({this.isError});

  WorkersListResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['payload'] != null) {
      payload = <WorkerListObjectDto>[];
      json['payload'].forEach((v) {
        payload?.add(WorkerListObjectDto.fromJson(v));
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

class WorkerListObjectDto {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  bool? isVerified;

  WorkerListObjectDto.fromJson(Map<String, dynamic> json) {
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

  WorkerListObject toWorker(){
    return WorkerListObject(
        id: id,
      email: email,
      lastName: lastName,
      firstName: firstName,
      isVerified: isVerified
    );
  }
}
