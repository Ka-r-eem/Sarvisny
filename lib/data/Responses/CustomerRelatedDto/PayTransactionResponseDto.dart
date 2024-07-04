import 'dart:convert';
/// status : null
/// isError : false
/// message : "Success"
/// errors : []
/// payload : {"paymentUrl":"https://accept.paymob.com/api/acceptance/iframes/821594?payment_token=ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SjFjMlZ5WDJsa0lqb3hOelEzTURFNExDSmhiVzkxYm5SZlkyVnVkSE1pT2pNek5qQXdMQ0pqZFhKeVpXNWplU0k2SWtWSFVDSXNJbWx1ZEdWbmNtRjBhVzl1WDJsa0lqbzBORFUwT1RZMExDSnZjbVJsY2w5cFpDSTZNakl6TlRFNU1URTBMQ0ppYVd4c2FXNW5YMlJoZEdFaU9uc2labWx5YzNSZmJtRnRaU0k2SWtOMWMzUnZiV1Z5TVRFeE1TSXNJbXhoYzNSZmJtRnRaU0k2SWtOMWMzUnZiV1Z5TVRFeE1URWlMQ0p6ZEhKbFpYUWlPaUpEZFhOMGIyMWxjaUlzSW1KMWFXeGthVzVuSWpvaVRrRWlMQ0ptYkc5dmNpSTZJazVCSWl3aVlYQmhjblJ0Wlc1MElqb2lUa0VpTENKamFYUjVJam9pVGtFaUxDSnpkR0YwWlNJNklrNUJJaXdpWTI5MWJuUnllU0k2SWs1Qklpd2laVzFoYVd3aU9pSkRkWE4wYjIxbGNqRXhNVEV4UUdWNFlXMXdiR1V1WTI5dElpd2ljR2h2Ym1WZmJuVnRZbVZ5SWpvaVEzVnpkRzl0WlhJaUxDSndiM04wWVd4ZlkyOWtaU0k2SWs1Qklpd2laWGgwY21GZlpHVnpZM0pwY0hScGIyNGlPaUpPUVNKOUxDSnNiMk5yWDI5eVpHVnlYM2RvWlc1ZmNHRnBaQ0k2Wm1Gc2MyVXNJbVY0ZEhKaElqcDdmU3dpYzJsdVoyeGxYM0JoZVcxbGJuUmZZWFIwWlcxd2RDSTZabUZzYzJVc0ltVjRjQ0k2TVRjeU1ERXdOems1T0N3aWNHMXJYMmx3SWpvaU5ERXVNak01TGpFMk1pNDRNU0o5LjByZ1RzVURvTGxvYUVLTXc4UHdmb25FeVpjZ0JTLVBmRVI4c0MzdHpWZ1ZvZEMxalRrMlNLTXFZaDg5S3VnV0dnbnJUdUE0cXdNOG9USzZCS3h3SFJR"}

PayTransactionResponseDto payTransactionResponseDtoFromJson(String str) => PayTransactionResponseDto.fromJson(json.decode(str));
String payTransactionResponseDtoToJson(PayTransactionResponseDto data) => json.encode(data.toJson());
class PayTransactionResponseDto {
  PayTransactionResponseDto({
      this.status, 
      this.isError, 
      this.message, 
      this.errors, 
      this.payload,});

  PayTransactionResponseDto.fromJson(dynamic json) {
    status = json['status'];
    isError = json['isError'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add((v));
      });
    }
    payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }
  dynamic status;
  bool? isError;
  String? message;
  List<dynamic>? errors;
  Payload? payload;
PayTransactionResponseDto copyWith({  dynamic status,
  bool? isError,
  String? message,
  List<dynamic>? errors,
  Payload? payload,
}) => PayTransactionResponseDto(  status: status ?? this.status,
  isError: isError ?? this.isError,
  message: message ?? this.message,
  errors: errors ?? this.errors,
  payload: payload ?? this.payload,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['isError'] = isError;
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    if (payload != null) {
      map['payload'] = payload?.toJson();
    }
    return map;
  }

}

/// paymentUrl : "https://accept.paymob.com/api/acceptance/iframes/821594?payment_token=ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SjFjMlZ5WDJsa0lqb3hOelEzTURFNExDSmhiVzkxYm5SZlkyVnVkSE1pT2pNek5qQXdMQ0pqZFhKeVpXNWplU0k2SWtWSFVDSXNJbWx1ZEdWbmNtRjBhVzl1WDJsa0lqbzBORFUwT1RZMExDSnZjbVJsY2w5cFpDSTZNakl6TlRFNU1URTBMQ0ppYVd4c2FXNW5YMlJoZEdFaU9uc2labWx5YzNSZmJtRnRaU0k2SWtOMWMzUnZiV1Z5TVRFeE1TSXNJbXhoYzNSZmJtRnRaU0k2SWtOMWMzUnZiV1Z5TVRFeE1URWlMQ0p6ZEhKbFpYUWlPaUpEZFhOMGIyMWxjaUlzSW1KMWFXeGthVzVuSWpvaVRrRWlMQ0ptYkc5dmNpSTZJazVCSWl3aVlYQmhjblJ0Wlc1MElqb2lUa0VpTENKamFYUjVJam9pVGtFaUxDSnpkR0YwWlNJNklrNUJJaXdpWTI5MWJuUnllU0k2SWs1Qklpd2laVzFoYVd3aU9pSkRkWE4wYjIxbGNqRXhNVEV4UUdWNFlXMXdiR1V1WTI5dElpd2ljR2h2Ym1WZmJuVnRZbVZ5SWpvaVEzVnpkRzl0WlhJaUxDSndiM04wWVd4ZlkyOWtaU0k2SWs1Qklpd2laWGgwY21GZlpHVnpZM0pwY0hScGIyNGlPaUpPUVNKOUxDSnNiMk5yWDI5eVpHVnlYM2RvWlc1ZmNHRnBaQ0k2Wm1Gc2MyVXNJbVY0ZEhKaElqcDdmU3dpYzJsdVoyeGxYM0JoZVcxbGJuUmZZWFIwWlcxd2RDSTZabUZzYzJVc0ltVjRjQ0k2TVRjeU1ERXdOems1T0N3aWNHMXJYMmx3SWpvaU5ERXVNak01TGpFMk1pNDRNU0o5LjByZ1RzVURvTGxvYUVLTXc4UHdmb25FeVpjZ0JTLVBmRVI4c0MzdHpWZ1ZvZEMxalRrMlNLTXFZaDg5S3VnV0dnbnJUdUE0cXdNOG9USzZCS3h3SFJR"

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));
String payloadToJson(Payload data) => json.encode(data.toJson());
class Payload {
  Payload({
      this.paymentUrl,});

  Payload.fromJson(dynamic json) {
    paymentUrl = json['paymentUrl'];
  }
  String? paymentUrl;
Payload copyWith({  String? paymentUrl,
}) => Payload(  paymentUrl: paymentUrl ?? this.paymentUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['paymentUrl'] = paymentUrl;
    return map;
  }

}