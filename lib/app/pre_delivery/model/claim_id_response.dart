/// responseType : "Ok"
/// responseObject : {"claimId":5653,"items":["Light Wheelchair"],"patientName":"Amidala Diana","deliveryAddress":{"address":"3 Morgan Lane","city":"bflowcity","state":"NC","zipCode":"12457"},"phoneNumber":"917-412-9192"}
/// responseMessage : null

class ClaimIdResponse {
  ClaimIdResponse({
    String? responseType,
    ResponseObject? responseObject,
    dynamic responseMessage,
  }) {
    _responseType = responseType;
    _responseObject = responseObject;
    _responseMessage = responseMessage;
  }

  ClaimIdResponse.fromJson(dynamic json) {
    _responseType = json['responseType'];
    _responseObject = json['responseObject'] != null
        ? ResponseObject.fromJson(json['responseObject'])
        : null;
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
    Items? items,
    String? patientName,
    DeliveryAddress? deliveryAddress,
    String? phoneNumber,
  }) {
    _claimId = claimId;
    _items = items;
    _patientName = patientName;
    _deliveryAddress = deliveryAddress;
    _phoneNumber = phoneNumber;
  }

  ResponseObject.fromJson(dynamic json) {
    _claimId = json['claimId'];
    _items = json['items'] != null ? Items.fromJson(json['items']):null;
    _patientName = json['patientName'];
    _deliveryAddress = json['deliveryAddress'] != null
        ? DeliveryAddress.fromJson(json['deliveryAddress'])
        : null;
    _phoneNumber = json['phoneNumber'];
  }

  int? _claimId;
  Items? _items;
  String? _patientName;
  DeliveryAddress? _deliveryAddress;
  String? _phoneNumber;

  int? get claimId => _claimId;

  Items? get items => _items;

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
    String? zipCode,
  }) {
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

class Items {
  Items({
    int? id,
    String? name,
    String? hcpcCode,
    String? serial,
    int? qty,
    String? model,
    String? manufacturer,
  }) {
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

  String? _name;
  int? _id;
  String? _hcpcCode;
  String? _serial;
  int? _qty;
  String? _model;
  String? _manufacturer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['hcpcCode'] = _hcpcCode;
    map['serial'] = _serial;
    map['qty'] = _qty;
    map['name'] = _name;
    map['model'] = _model;
    map['manufacturer'] = _manufacturer;
    return map;
  }

  int? get id => _id;

  String? get name => _name;

  String? get hcpcCode => _hcpcCode;

  String? get serial => _serial;

  int? get qty => _qty;

  String? get model => _model;

  String? get manufacturer => _manufacturer;
}
