/// responseType : "Ok"
/// responseObject : {"claimId":5648,"items":[{"id":8772,"hcpc":"E0143","description":"Walker folding wheeled w/o s :: Medicare Purchase","serial":null,"qty":1,"model":null,"manufacturer":null,"inventoryOptions":[{"id":19,"serialNo":null,"model":"77558-00013-00","manufacturer":"American Breast Care","displayText":" 77558-00013-00 American Breast Care"},{"id":200,"serialNo":null,"model":"77559-00001-00","manufacturer":"American Breast Care","displayText":" 77559-00001-00 American Breast Care"}]},null],"patientName":"Jinn Evelyn","deliveryAddress":{"address":"10 Sie Ave","city":"Jersey City","state":"NJ","zipCode":"12457"},"phoneNumber":"9174129192","checkListDetails":[{"header":"Claim check list.","options":[{"id":216,"name":"Pick Equipment (does picked equipment serial number match order serial numbers)","isSelected":false},{"id":217,"name":"Complete equipment inspection log","isSelected":false},{"id":218,"name":"Print delivery ticket and delivery packet","isSelected":false},{"id":219,"name":"Verify delivery address and time","isSelected":false}]}]}
/// responseMessage : "Successfully"

class PreDeliveryIdModel {
  PreDeliveryIdModel({
    String? responseType,
    PreDeliveryObject? responseObject,
    String? responseMessage,
  }) {
    _responseType = responseType;
    _responseObject = responseObject;
    _responseMessage = responseMessage;
  }

  PreDeliveryIdModel.fromJson(dynamic json) {
    _responseType = json['responseType'];
    _responseObject = json['responseObject'] != null
        ? PreDeliveryObject.fromJson(json['responseObject'])
        : null;
    _responseMessage = json['responseMessage'];
  }

  String? _responseType;
  PreDeliveryObject? _responseObject;
  String? _responseMessage;

  PreDeliveryIdModel copyWith({
    String? responseType,
    PreDeliveryObject? responseObject,
    String? responseMessage,
  }) =>
      PreDeliveryIdModel(
        responseType: responseType ?? _responseType,
        responseObject: responseObject ?? _responseObject,
        responseMessage: responseMessage ?? _responseMessage,
      );

  String? get responseType => _responseType;

  PreDeliveryObject? get responseObject => _responseObject;

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

/// claimId : 5648
/// items : [{"id":8772,"hcpc":"E0143","description":"Walker folding wheeled w/o s :: Medicare Purchase","serial":null,"qty":1,"model":null,"manufacturer":null,"inventoryOptions":[{"id":19,"serialNo":null,"model":"77558-00013-00","manufacturer":"American Breast Care","displayText":" 77558-00013-00 American Breast Care"},{"id":200,"serialNo":null,"model":"77559-00001-00","manufacturer":"American Breast Care","displayText":" 77559-00001-00 American Breast Care"}]},null]
/// patientName : "Jinn Evelyn"
/// deliveryAddress : {"address":"10 Sie Ave","city":"Jersey City","state":"NJ","zipCode":"12457"}
/// phoneNumber : "9174129192"
/// checkListDetails : [{"header":"Claim check list.","options":[{"id":216,"name":"Pick Equipment (does picked equipment serial number match order serial numbers)","isSelected":false},{"id":217,"name":"Complete equipment inspection log","isSelected":false},{"id":218,"name":"Print delivery ticket and delivery packet","isSelected":false},{"id":219,"name":"Verify delivery address and time","isSelected":false}]}]

class PreDeliveryObject {
  PreDeliveryObject({
    int? claimId,
    List<Items>? items,
    String? patientName,
    DeliveryAddress? deliveryAddress,
    String? phoneNumber,
    List<PreCheckListDetails>? checkListDetails,
  }) {
    _claimId = claimId;
    _items = items;
    _patientName = patientName;
    _deliveryAddress = deliveryAddress;
    _phoneNumber = phoneNumber;
    _checkListDetails = checkListDetails;
  }

  PreDeliveryObject.fromJson(dynamic json) {
    _claimId = json['claimId'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    _patientName = json['patientName'];
    _deliveryAddress = json['deliveryAddress'] != null
        ? DeliveryAddress.fromJson(json['deliveryAddress'])
        : null;
    _phoneNumber = json['phoneNumber'];
    if (json['checkListDetails'] != null) {
      _checkListDetails = [];
      json['checkListDetails'].forEach((v) {
        _checkListDetails?.add(PreCheckListDetails.fromJson(v));
      });
    }
  }

  int? _claimId;
  List<Items>? _items;
  String? _patientName;
  DeliveryAddress? _deliveryAddress;
  String? _phoneNumber;
  List<PreCheckListDetails>? _checkListDetails;

  PreDeliveryObject copyWith({
    int? claimId,
    List<Items>? items,
    String? patientName,
    DeliveryAddress? deliveryAddress,
    String? phoneNumber,
    List<PreCheckListDetails>? checkListDetails,
  }) =>
      PreDeliveryObject(
        claimId: claimId ?? _claimId,
        items: items ?? _items,
        patientName: patientName ?? _patientName,
        deliveryAddress: deliveryAddress ?? _deliveryAddress,
        phoneNumber: phoneNumber ?? _phoneNumber,
        checkListDetails: checkListDetails ?? _checkListDetails,
      );

  int? get claimId => _claimId;

  List<Items>? get items => _items;

  String? get patientName => _patientName;

  DeliveryAddress? get deliveryAddress => _deliveryAddress;

  String? get phoneNumber => _phoneNumber;

  List<PreCheckListDetails>? get checkListDetails => _checkListDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['claimId'] = _claimId;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    map['patientName'] = _patientName;
    if (_deliveryAddress != null) {
      map['deliveryAddress'] = _deliveryAddress?.toJson();
    }
    map['phoneNumber'] = _phoneNumber;
    if (_checkListDetails != null) {
      map['checkListDetails'] =
          _checkListDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// header : "Claim check list."
/// options : [{"id":216,"name":"Pick Equipment (does picked equipment serial number match order serial numbers)","isSelected":false},{"id":217,"name":"Complete equipment inspection log","isSelected":false},{"id":218,"name":"Print delivery ticket and delivery packet","isSelected":false},{"id":219,"name":"Verify delivery address and time","isSelected":false}]

class PreCheckListDetails {
  PreCheckListDetails({
    String? header,
    List<Options>? options,
  }) {
    _header = header;
    _options = options;
  }

  PreCheckListDetails.fromJson(dynamic json) {
    _header = json['header'];
    if (json['options'] != null) {
      _options = [];
      json['options'].forEach((v) {
        _options?.add(Options.fromJson(v));
      });
    }
  }

  String? _header;
  List<Options>? _options;

  PreCheckListDetails copyWith({
    String? header,
    List<Options>? options,
  }) =>
      PreCheckListDetails(
        header: header ?? _header,
        options: options ?? _options,
      );

  String? get header => _header;

  List<Options>? get options => _options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['header'] = _header;
    if (_options != null) {
      map['options'] = _options?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 216
/// name : "Pick Equipment (does picked equipment serial number match order serial numbers)"
/// isSelected : false

class Options {
  Options({
    int? id,
    String? name,
    bool? isSelected,
  }) {
    _id = id;
    _name = name;
    _isSelected = isSelected;
  }

  set isSelectedSet(bool value) {
    _isSelected = value;
  }

  Options.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _isSelected = json['isSelected'];
  }

  int? _id;
  String? _name;
  bool? _isSelected;

  Options copyWith({
    int? id,
    String? name,
    bool? isSelected,
  }) =>
      Options(
        id: id ?? _id,
        name: name ?? _name,
        isSelected: isSelected ?? _isSelected,
      );

  int? get id => _id;

  String? get name => _name;

  bool? get isSelected => _isSelected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['isSelected'] = _isSelected;
    return map;
  }
}

/// address : "10 Sie Ave"
/// city : "Jersey City"
/// state : "NJ"
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

  DeliveryAddress copyWith({
    String? address,
    String? city,
    String? state,
    String? zipCode,
  }) =>
      DeliveryAddress(
        address: address ?? _address,
        city: city ?? _city,
        state: state ?? _state,
        zipCode: zipCode ?? _zipCode,
      );

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

/// id : 8772
/// hcpc : "E0143"
/// description : "Walker folding wheeled w/o s :: Medicare Purchase"
/// serial : null
/// qty : 1
/// model : null
/// manufacturer : null
/// inventoryOptions : [{"id":19,"serialNo":null,"model":"77558-00013-00","manufacturer":"American Breast Care","displayText":" 77558-00013-00 American Breast Care"},{"id":200,"serialNo":null,"model":"77559-00001-00","manufacturer":"American Breast Care","displayText":" 77559-00001-00 American Breast Care"}]

class Items {
  Items({
    int? id,
    String? hcpc,
    String? description,
    dynamic serial,
    int? qty,
    dynamic model,
    dynamic manufacturer,
    List<InventoryOptions>? inventoryOptions,
  }) {
    _id = id;
    _hcpc = hcpc;
    _description = description;
    _serial = serial;
    _qty = qty;
    _model = model;
    _manufacturer = manufacturer;
    _inventoryOptions = inventoryOptions;
  }

  Items.fromJson(dynamic json) {
    _id = json['id'];
    _hcpc = json['hcpc'];
    _description = json['description'];
    _serial = json['serial'];
    _qty = json['qty'];
    _model = json['model'];
    _manufacturer = json['manufacturer'];
    if (json['inventoryOptions'] != null) {
      _inventoryOptions = [];
      json['inventoryOptions'].forEach((v) {
        _inventoryOptions?.add(InventoryOptions.fromJson(v));
      });
    }
  }

  int? _id;
  String? _hcpc;
  String? _description;
  dynamic _serial;
  int? _qty;
  dynamic _model;
  dynamic _manufacturer;
  List<InventoryOptions>? _inventoryOptions;

  Items copyWith({
    int? id,
    String? hcpc,
    String? description,
    dynamic serial,
    int? qty,
    dynamic model,
    dynamic manufacturer,
    List<InventoryOptions>? inventoryOptions,
  }) =>
      Items(
        id: id ?? _id,
        hcpc: hcpc ?? _hcpc,
        description: description ?? _description,
        serial: serial ?? _serial,
        qty: qty ?? _qty,
        model: model ?? _model,
        manufacturer: manufacturer ?? _manufacturer,
        inventoryOptions: inventoryOptions ?? _inventoryOptions,
      );

  int? get id => _id;

  String? get hcpc => _hcpc;

  String? get description => _description;

  dynamic get serial => _serial;

  int? get qty => _qty;

  dynamic get model => _model;

  dynamic get manufacturer => _manufacturer;

  List<InventoryOptions>? get inventoryOptions => _inventoryOptions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['hcpc'] = _hcpc;
    map['description'] = _description;
    map['serial'] = _serial;
    map['qty'] = _qty;
    map['model'] = _model;
    map['manufacturer'] = _manufacturer;
    if (_inventoryOptions != null) {
      map['inventoryOptions'] =
          _inventoryOptions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 19
/// serialNo : null
/// model : "77558-00013-00"
/// manufacturer : "American Breast Care"
/// displayText : " 77558-00013-00 American Breast Care"

class InventoryOptions {
  InventoryOptions({
    int? id,
    dynamic serialNo,
    String? model,
    String? manufacturer,
    String? displayText,
  }) {
    _id = id;
    _serialNo = serialNo;
    _model = model;
    _manufacturer = manufacturer;
    _displayText = displayText;
  }

  InventoryOptions.fromJson(dynamic json) {
    _id = json['id'];
    _serialNo = json['serialNo'];
    _model = json['model'];
    _manufacturer = json['manufacturer'];
    _displayText = json['displayText'];
  }

  int? _id;
  dynamic _serialNo;
  String? _model;
  String? _manufacturer;
  String? _displayText;

  InventoryOptions copyWith({
    int? id,
    dynamic serialNo,
    String? model,
    String? manufacturer,
    String? displayText,
  }) =>
      InventoryOptions(
        id: id ?? _id,
        serialNo: serialNo ?? _serialNo,
        model: model ?? _model,
        manufacturer: manufacturer ?? _manufacturer,
        displayText: displayText ?? _displayText,
      );

  int? get id => _id;

  dynamic get serialNo => _serialNo;

  String? get model => _model;

  String? get manufacturer => _manufacturer;

  String? get displayText => _displayText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['serialNo'] = _serialNo;
    map['model'] = _model;
    map['manufacturer'] = _manufacturer;
    map['displayText'] = _displayText;
    return map;
  }
}
