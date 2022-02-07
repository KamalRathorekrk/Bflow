/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJEcml2ZXIiLCJmdWxsTmFtZSI6IkRyaXZlciBCZmxvdyIsInVzZXJJZCI6IjEyOCIsIngtY29wb3JhdGVJZCAgIjoiZGVtbzE5IiwianRpIjoiMGU3NjljZDctZjM5ZS00ZDQyLTlmNzUtOGMxNzlmN2I4ZjExIiwiZXhwIjoxNjM4ODkzMjQ4LCJpc3MiOiJCZmxvdyBTb2x1dGlvbnMgSW5jIiwiYXVkIjoiQmZsb3cgTW9iaWxlIEFwcCBVc2VycyJ9.VriBVst9nSFI22TXujQNNJozxFIFTvt8zjP9udt-awg"
/// userDetails : {"userName":"Driver","fullName":"Driver Bflow","corporateId":"demo19","userId":128,"emailAddress":"Driver@bflowgmail.com"}

class ValidateResponse {
  ValidateResponse({
    String? token,
    UserDetails? userDetails,
  }) {
    _token = token;
    _userDetails = userDetails;
  }

  ValidateResponse.fromJson(dynamic json) {
    _token = json['token'];
    _userDetails = json['userDetails'] != null
        ? UserDetails.fromJson(json['userDetails'])
        : null;
  }

  String? _token;
  UserDetails? _userDetails;

  String? get token => _token;

  UserDetails? get userDetails => _userDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_userDetails != null) {
      map['userDetails'] = _userDetails?.toJson();
    }
    return map;
  }
}

/// userName : "Driver"
/// fullName : "Driver Bflow"
/// corporateId : "demo19"
/// userId : 128
/// emailAddress : "Driver@bflowgmail.com"

class UserDetails {
  UserDetails({
    String? userName,
    String? fullName,
    String? corporateId,
    int? userId,
    String? emailAddress,
  }) {
    _userName = userName;
    _fullName = fullName;
    _corporateId = corporateId;
    _userId = userId;
    _emailAddress = emailAddress;
  }

  UserDetails.fromJson(dynamic json) {
    _userName = json['userName'];
    _fullName = json['fullName'];
    _corporateId = json['corporateId'];
    _userId = json['userId'];
    _emailAddress = json['emailAddress'];
  }

  String? _userName;
  String? _fullName;
  String? _corporateId;
  int? _userId;
  String? _emailAddress;

  String? get userName => _userName;

  String? get fullName => _fullName;

  String? get corporateId => _corporateId;

  int? get userId => _userId;

  String? get emailAddress => _emailAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = _userName;
    map['fullName'] = _fullName;
    map['corporateId'] = _corporateId;
    map['userId'] = _userId;
    map['emailAddress'] = _emailAddress;
    return map;
  }
}
