/// username : "emrozeae@gmail.com"
/// password : "654321"

class LoginReq {
  String? username;
  String? password;

  LoginReq({
    this.username,
    this.password});

  LoginReq.fromJson(dynamic json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['username'] = username;
    map['password'] = password;
    return map;
  }

}