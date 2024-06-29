import 'package:sarvisny/domain/model/WorkerRelatedResponse/WorkersRequestsResponse.dart';

class WorkersRequestsResponseDto {
  String? status;
  bool? isError;
  String? message;
  List<WorkerRequestDto>? payload;

  WorkersRequestsResponseDto(
      {this.payload, this.isError, this.message, this.status});

  WorkersRequestsResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['payload'] != null) {
      payload = <WorkerRequestDto>[];
      json['payload'].forEach((v) {
        payload?.add(WorkerRequestDto.fromJson(v));
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

class WorkerRequestDto {
  bool? isVerified;
  dynamic providerServices; // You might want to replace "dynamic" with the actual type if known
  dynamic availabilities; // You might want to replace "dynamic" with the actual type if known
  String? firstName;
  String? lastName;
  String? id;
  String? userName;
  String? normalizedUserName;
  String? email;
  String? normalizedEmail;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? concurrencyStamp;
  String? phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  dynamic lockoutEnd; // You might want to replace "dynamic" with the actual type if known
  bool? lockoutEnabled;
  int? accessFailedCount;

  WorkerRequestDto.fromJson(Map<String, dynamic> json) {
    isVerified = json['isVerified'];
    providerServices =
    json['providerServices']; // Replace with the actual field type if known
    availabilities =
    json['availabilities']; // Replace with the actual field type if known
    firstName = json['firstName'];
    lastName = json['lastName'];
    id = json['id'];
    userName = json['userName'];
    normalizedUserName = json['normalizedUserName'];
    email = json['email'];
    normalizedEmail = json['normalizedEmail'];
    emailConfirmed = json['emailConfirmed'];
    passwordHash = json['passwordHash'];
    securityStamp = json['securityStamp'];
    concurrencyStamp = json['concurrencyStamp'];
    phoneNumber = json['phoneNumber'];
    phoneNumberConfirmed = json['phoneNumberConfirmed'];
    twoFactorEnabled = json['twoFactorEnabled'];
    lockoutEnd =
    json['lockoutEnd']; // Replace with the actual field type if known
    lockoutEnabled = json['lockoutEnabled'];
    accessFailedCount = json['accessFailedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['isVerified'] = isVerified;
    data['providerServices'] =
        providerServices; // Replace with the actual field type if known
    data['availabilities'] =
        availabilities; // Replace with the actual field type if known
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['id'] = id;
    data['userName'] = userName;
    data['normalizedUserName'] = normalizedUserName;
    data['email'] = email;
    data['normalizedEmail'] = normalizedEmail;
    data['emailConfirmed'] = emailConfirmed;
    data['passwordHash'] = passwordHash;
    data['securityStamp'] = securityStamp;
    data['concurrencyStamp'] = concurrencyStamp;
    data['phoneNumber'] = phoneNumber;
    data['phoneNumberConfirmed'] = phoneNumberConfirmed;
    data['twoFactorEnabled'] = twoFactorEnabled;
    data['lockoutEnd'] =
        lockoutEnd; // Replace with the actual field type if known
    data['lockoutEnabled'] = lockoutEnabled;
    data['accessFailedCount'] = accessFailedCount;
    return data;
  }

  WorkerRequest toRequest() {
    return WorkerRequest(
        id: id,
        email: email,
        lastName: lastName,
        firstName: firstName,
        isVerified: isVerified,
        providerServices: providerServices,
        availabilities: availabilities,
        phoneNumber: phoneNumber,
        userName: userName,
        accessFailedCount: accessFailedCount,
        concurrencyStamp: concurrencyStamp,
        emailConfirmed: emailConfirmed,
        lockoutEnabled: lockoutEnabled,
        lockoutEnd: lockoutEnd,
        normalizedEmail: normalizedEmail,
        normalizedUserName: normalizedUserName,
        passwordHash: passwordHash,
        phoneNumberConfirmed: phoneNumberConfirmed,
        securityStamp: securityStamp,
        twoFactorEnabled: twoFactorEnabled
    );
  }
}
