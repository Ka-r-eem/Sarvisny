import '../../../domain/model/CustomerRelatedResponses/OrderCartResponse.dart';

class OrderCartResponseDto {
  OrderCartResponseDto({
    this.status,
    this.isError,
    this.message,
    this.errors,
    this.payload,
  });

  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  PaymentUrlDto? payload;

  OrderCartResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    errors = json['errors'];
    payload = json['payload'] != null ? PaymentUrlDto.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['isError'] = this.isError;
    data['message'] = this.message;
    data['errors'] = this.errors;
    if (this.payload != null) {
      data['payload'] = this.payload?.toJson();
    }
    return data;
  }
  OrderCartResponse toOrderCartResponse(){
    return OrderCartResponse(
      payload: payload?.toPayment(),
      message: message,
      isError: isError,
      errors: errors,
      status: status
    );
  }
}

class PaymentUrlDto {
  String? paymentUrl;

  PaymentUrlDto({this.paymentUrl});

  PaymentUrlDto.fromJson(Map<String, dynamic> json) {
    paymentUrl = json['paymentUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentUrl'] = this.paymentUrl;
    return data;
  }

  PaymentUrl toPayment(){
    return PaymentUrl(
      paymentUrl: paymentUrl
    );
  }
}
