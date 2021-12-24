/// responseType : "Ok"
/// responseObject : {"claimId":5655,"items":{"id":178,"name":"Oxygen concentrator","hcpcCode":"E1390","serial":"365347478","qty":1,"model":"77558-00013-00 - Oxygen concentrator","manufacturer":"DRIVE"},"patientFullName":"","deliveryAddress":{"address":"10 Sie Ave","city":"Jersey City","state":"NJ","zipCode":"63123"},"phoneNumber":"5417083275"}
/// responseMessage : "Successfully"

class ClaimsDetails {
  ClaimsDetails({
      String? responseType,
    ClaimDetailData? claimDetailData,
      String? responseMessage,}){
    _responseType = responseType;
    _claimDetailData = claimDetailData;
    _responseMessage = responseMessage;
}

  ClaimsDetails.fromJson(dynamic json) {
    _responseType = json['responseType'];
    _claimDetailData = json['responseObject'] != null ? ClaimDetailData.fromJson(json['responseObject']) : null;
    _responseMessage = json['responseMessage'];
  }
  String? _responseType;
  ClaimDetailData? _claimDetailData;
  String? _responseMessage;

  String? get responseType => _responseType;
  ClaimDetailData? get claimDetailData => _claimDetailData;
  String? get responseMessage => _responseMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseType'] = _responseType;
    if (_claimDetailData != null) {
      map['responseObject'] = _claimDetailData?.toJson();
    }
    map['responseMessage'] = _responseMessage;
    return map;
  }

}

/// claimId : 5655
/// items : {"id":178,"name":"Oxygen concentrator","hcpcCode":"E1390","serial":"365347478","qty":1,"model":"77558-00013-00 - Oxygen concentrator","manufacturer":"DRIVE"}
/// patientFullName : ""
/// deliveryAddress : {"address":"10 Sie Ave","city":"Jersey City","state":"NJ","zipCode":"63123"}
/// phoneNumber : "5417083275"

class ClaimDetailData {
  ClaimDetailData({
      int? claimId, 
      Items? items, 
      String? patientFullName, 
      DeliveryAddress? deliveryAddress, 
      String? phoneNumber,}){
    _claimId = claimId;
    _items = items;
    _patientFullName = patientFullName;
    _deliveryAddress = deliveryAddress;
    _phoneNumber = phoneNumber;
}

  ClaimDetailData.fromJson(dynamic json) {
    _claimId = json['claimId'];
    _items = json['items'] != null ? Items.fromJson(json['items']) : null;
    _patientFullName = json['patientFullName'];
    _deliveryAddress = json['deliveryAddress'] != null ? DeliveryAddress.fromJson(json['deliveryAddress']) : null;
    _phoneNumber = json['phoneNumber'];
  }
  int? _claimId;
  Items? _items;
  String? _patientFullName;
  DeliveryAddress? _deliveryAddress;
  String? _phoneNumber;

  int? get claimId => _claimId;
  Items? get items => _items;
  String? get patientFullName => _patientFullName;
  DeliveryAddress? get deliveryAddress => _deliveryAddress;
  String? get phoneNumber => _phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['claimId'] = _claimId;
    if (_items != null) {
      map['items'] = _items?.toJson();
    }
    map['patientFullName'] = _patientFullName;
    if (_deliveryAddress != null) {
      map['deliveryAddress'] = _deliveryAddress?.toJson();
    }
    map['phoneNumber'] = _phoneNumber;
    return map;
  }

}

/// address : "10 Sie Ave"
/// city : "Jersey City"
/// state : "NJ"
/// zipCode : "63123"

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

/// id : 178
/// name : "Oxygen concentrator"
/// hcpcCode : "E1390"
/// serial : "365347478"
/// qty : 1
/// model : "77558-00013-00 - Oxygen concentrator"
/// manufacturer : "DRIVE"

class Items {
  Items({
      int? id, 
      String? name, 
      String? hcpcCode, 
      String? serial, 
      int? qty, 
      String? model, 
      String? manufacturer,}){
    _id = id;
    _name = name;
    _hcpcCode = hcpcCode;
    _serial = serial;
    _qty = qty;
    _model = model;
    _manufacturer = manufacturer;
}

  Items.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _hcpcCode = json['hcpcCode'];
    _serial = json['serial'];
    _qty = json['qty'];
    _model = json['model'];
    _manufacturer = json['manufacturer'];
  }
  int? _id;
  String? _name;
  String? _hcpcCode;
  String? _serial;
  int? _qty;
  String? _model;
  String? _manufacturer;

  int? get id => _id;
  String? get name => _name;
  String? get hcpcCode => _hcpcCode;
  String? get serial => _serial;
  int? get qty => _qty;
  String? get model => _model;
  String? get manufacturer => _manufacturer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['hcpcCode'] = _hcpcCode;
    map['serial'] = _serial;
    map['qty'] = _qty;
    map['model'] = _model;
    map['manufacturer'] = _manufacturer;
    return map;
  }

}