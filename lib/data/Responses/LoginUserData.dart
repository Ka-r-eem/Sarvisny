/// email : "admin@example.com"
/// password : "Admin123#"

class LoginUserData {
  LoginUserData({
      this.email, 
      this.password,});

  LoginUserData.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }
  String? email;
  String? password;
LoginUserData copyWith({  String? email,
  String? password,
}) => LoginUserData(  email: email ?? this.email,
  password: password ?? this.password,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}