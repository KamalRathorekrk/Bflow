/// responseType : "Ok"
/// responseObject : {"name":"","url":"","isError":false,"error":null}
/// responseMessage : "Profile photo updated successfully."

class ChangeProfilePicModel {
  ChangeProfilePicModel({
    String? responseType,
    ResponseObject? responseObject,
    String? responseMessage,
  }) {
    _responseType = responseType;
    _responseObject = responseObject;
    _responseMessage = responseMessage;
  }

  ChangeProfilePicModel.fromJson(dynamic json) {
    _responseType = json['responseType'];
    _responseObject = json['responseObject'] != null
        ? ResponseObject.fromJson(json['responseObject'])
        : null;
    _responseMessage = json['responseMessage'];
  }

  String? _responseType;
  ResponseObject? _responseObject;
  String? _responseMessage;

  String? get responseType => _responseType;

  ResponseObject? get responseObject => _responseObject;

  String? get responseMessage => _responseMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseType'] = _responseType;
    if (_responseObject != null) {
      map['responseObject'] = _responseObject?.toJson();
    }
    map['responseMessage'] = _responseMessage;
    return map;
  }
}

/// name : ""
/// url : ""
/// isError : false
/// error : null

class ResponseObject {
  ResponseObject({
    String? name,
    String? url,
    bool? isError,
    dynamic error,
  }) {
    _name = name;
    _url = url;
    _isError = isError;
    _error = error;
  }

  ResponseObject.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
    _isError = json['isError'];
    _error = json['error'];
  }

  String? _name;
  String? _url;
  bool? _isError;
  dynamic _error;

  String? get name => _name;

  String? get url => _url;

  bool? get isError => _isError;

  dynamic get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    map['isError'] = _isError;
    map['error'] = _error;
    return map;
  }
}
