/// responseType : "Ok"
/// responseObject : {"claimId":5653,"items":["Light Wheelchair"],"patientName":"Amidala Diana","deliveryAddress":{"address":"3 Morgan Lane","city":"bflowcity","state":"NC","zipCode":"12457"},"phoneNumber":"917-412-9192"}
/// responseMessage : null

class ClaimIdResponse {
  ClaimIdResponse({
      String? responseType, 
      ResponseObject? responseObject, 
      dynamic responseMessage,}){
    _responseType = responseType;
    _responseObject = responseObject;
    _responseMessage = responseMessage;
}

  ClaimIdResponse.fromJson(dynamic json) {
    _responseType = json['responseType'];
    _responseObject = json['responseObject'] != null ? ResponseObject.fromJson(json['responseObject']) : null;
    _responseMessage = json['responseMessage'];
  }
  String? _responseType;
  ResponseObject? _responseObject;
  dynamic _responseMessage;

  String? get responseType => _responseType;
  ResponseObject? get responseObject => _responseObject;
  dynamic get responseMessage => _responseMessage;

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

/// claimId : 5653
/// items : ["Light Wheelchair"]
/// patientName : "Amidala Diana"
/// deliveryAddress : {"address":"3 Morgan Lane","city":"bflowcity","state":"NC","zipCode":"12457"}
/// phoneNumber : "917-412-9192"

class ResponseObject {
  ResponseObject({
      int? claimId, 
      List<String>? items, 
      String? patientName, 
      DeliveryAddress? deliveryAddress, 
      String? phoneNumber,}){
    _claimId = claimId;
    _items = items;
    _patientName = patientName;
    _deliveryAddress = deliveryAddress;
    _phoneNumber = phoneNumber;
}

  ResponseObject.fromJson(dynamic json) {
    _claimId = json['claimId'];
    _items = json['items'] != null ? json['items'].cast<String>() : [];
    _patientName = json['patientName'];
    _deliveryAddress = json['deliveryAddress'] != null ? DeliveryAddress.fromJson(json['deliveryAddress']) : null;
    _phoneNumber = json['phoneNumber'];
  }
  int? _claimId;
  List<String>? _items;
  String? _patientName;
  DeliveryAddress? _deliveryAddress;
  String? _phoneNumber;

  int? get claimId => _claimId;
  List<String>? get items => _items;
  String? get patientName => _patientName;
  DeliveryAddress? get deliveryAddress => _deliveryAddress;
  String? get phoneNumber => _phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['claimId'] = _claimId;
    map['items'] = _items;
    map['patientName'] = _patientName;
    if (_deliveryAddress != null) {
      map['deliveryAddress'] = _deliveryAddress?.toJson();
    }
    map['phoneNumber'] = _phoneNumber;
    return map;
  }

}

/// address : "3 Morgan Lane"
/// city : "bflowcity"
/// state : "NC"
/// zipCode : "12457"

class DeliveryAddress {
  DeliveryAddress({
      String? address, 
      String? city, 
      String? state, 
      String? zipCode,}){
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
  String? _address;
  String? _city;
  String? _state;
  String? _zipCode;

  String? get address => _address;
  String? get city => _city;
  String? get state => _state;
  String? get zipCode => _zipCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = _address;
    map['city'] = _city;
    map['state'] = _state;
    map['zipCode'] = _zipCode;
    return map;
  }

}