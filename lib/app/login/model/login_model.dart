/// userName : ""
/// password : ""
/// corporateId : ""

class LoginModel {
  String? _userName;
  String? _password;
  String? _corporateId;

  String? get userName => _userName;

  String? get password => _password;

  String? get corporateId => _corporateId;

  LoginModel({String? userName, String? password, String? corporateId}) {
    _userName = userName;
    _password = password;
    _corporateId = corporateId;
  }

  LoginModel.fromJson(dynamic json) {
    _userName = json['userName'];
    _password = json['password'];
    _corporateId = json['corporateId'];
  }

  Map<String, dynamic> toJson(onResponse) {
    var map = <String, dynamic>{};
    map['userName'] = _userName;
    map['password'] = _password;
    map['corporateId'] = _corporateId;
    return map;
  }
}

class LoginResponse {
  String? _authCode;

  String? get authCode => _authCode;

  LoginResponse.fromJson(dynamic json) {
    _authCode = json['authCode'];
  }

  Map<String, dynamic> toJson(onResponse) {
    var map = <String, dynamic>{};
    map['authCode'] = _authCode;
    return map;
  }
}
