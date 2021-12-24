/// responseType : "Ok"
/// responseObject : [{"claimId":5653,"patientFullName":"Amidala Diana","phoneNumber":"917-412-9192","deliveryAddress":null,"driverName":"Driver Bflow","deliveryStatus":"InTransit","deliveryDate":null,"deliveryTime":null}]
/// responseMessage : null

class ClaimsModel {
  ClaimsModel({
      String? responseType,
      List<ClaimList>? responseObject,
      dynamic responseMessage,}){
    _responseType = responseType;
    _responseObject = responseObject;
    _responseMessage = responseMessage;
}

  ClaimsModel.fromJson(dynamic json) {
    _responseType = json['responseType'];
    if (json['responseObject'] != null) {
      _responseObject = [];
      json['responseObject'].forEach((v) {
        _responseObject?.add(ClaimList.fromJson(v));
      });
    }
    _responseMessage = json['responseMessage'];
  }
  String? _responseType;
  List<ClaimList>? _responseObject;
  dynamic _responseMessage;

  String? get responseType => _responseType;
  List<ClaimList>? get responseObject => _responseObject;
  dynamic get responseMessage => _responseMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseType'] = _responseType;
    if (_responseObject != null) {
      map['responseObject'] = _responseObject?.map((v) => v.toJson()).toList();
    }
    map['responseMessage'] = _responseMessage;
    return map;
  }

}

/// claimId : 5653
/// patientFullName : "Amidala Diana"
/// phoneNumber : "917-412-9192"
/// deliveryAddress : null
/// driverName : "Driver Bflow"
/// deliveryStatus : "InTransit"
/// deliveryDate : null
/// deliveryTime : null

class ClaimList {
  ClaimList({
      int? claimId,
      String? patientFullName,
      String? phoneNumber,
    DeliveryAddress? deliveryAddress,
      String? driverName,
      String? deliveryStatus,
      dynamic deliveryDate,
      dynamic deliveryTime,}){
    _claimId = claimId;
    _patientFullName = patientFullName;
    _phoneNumber = phoneNumber;
    _deliveryAddress = deliveryAddress;
    _driverName = driverName;
    _deliveryStatus = deliveryStatus;
    _deliveryDate = deliveryDate;
    _deliveryTime = deliveryTime;
}

  ClaimList.fromJson(dynamic json) {
    _claimId = json['claimId'];
    _patientFullName = json['patientFullName'];
    _phoneNumber = json['phoneNumber'];
    _deliveryAddress = json['deliveryAddress'] != null ? DeliveryAddress.fromJson(json['deliveryAddress']) : null;
    _driverName = json['driverName'];
    _deliveryStatus = json['deliveryStatus'];
    _deliveryDate = json['deliveryDate'];
    _deliveryTime = json['deliveryTime'];
  }
  int? _claimId;
  String? _patientFullName;
  String? _phoneNumber;
  DeliveryAddress? _deliveryAddress;
  String? _driverName;
  String? _deliveryStatus;
  dynamic _deliveryDate;
  dynamic _deliveryTime;

  int? get claimId => _claimId;
  String? get patientFullName => _patientFullName;
  String? get phoneNumber => _phoneNumber;
  DeliveryAddress? get deliveryAddress => _deliveryAddress;
  String? get driverName => _driverName;
  String? get deliveryStatus => _deliveryStatus;
  dynamic get deliveryDate => _deliveryDate;
  dynamic get deliveryTime => _deliveryTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['claimId'] = _claimId;
    map['patientFullName'] = _patientFullName;
    map['phoneNumber'] = _phoneNumber;
    map['deliveryAddress'] = _deliveryAddress;
    map['driverName'] = _driverName;
    map['deliveryStatus'] = _deliveryStatus;
    map['deliveryDate'] = _deliveryDate;
    map['deliveryTime'] = _deliveryTime;
    return map;
  }

}
class DeliveryAddress {
  String? _address;
  String? _city;
  String? _state;
  String? _zipCode;

  String? get address => _address;
  String? get city => _city;
  String? get state => _state;
  String? get zipCode => _zipCode;

  DeliveryAddress({
    String? address,
    String? city,
    String? state,
    String? zipCode}){
    _address = address;
    _city = city;
    _state = state;
    _zipCode = zipCode;
  }

  DeliveryAddress.fromJson(dynamic json) {
    _address = json['address'];
    _city = json['city'];
    _state = json['state'];
    _zipCode = json['zipCode'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['address'] = _address;
    map['city'] = _city;
    map['state'] = _state;
    map['zipCode'] = _zipCode;
    return map;
  }

}