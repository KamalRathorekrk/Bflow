/// orderId : 3066
/// patientName : "Wick Evelyn"
/// birthDate : "1919-01-12T00:00:00"
/// deliveryDisplayAddress : "2037 Bflow Drive bflowville"
/// patientInsuranceName : "Blue Cross Blue Shield North Carolina (BCBS NC)"
/// serviceLines : [{"id":4797,"hcpc":"A6549","description":"Custom Compression","serial":null,"qty":1,"model":null,"manufacturer":null,"inventoryOptions":null},{"id":4798,"hcpc":"A6549","description":"Custom Compression","serial":null,"qty":1,"model":null,"manufacturer":null,"inventoryOptions":null}]
/// checkListDetails : [{"header":"Claim check list.","options":[{"id":220,"name":"Equipment delivered","isSelected":false},{"id":221,"name":"Patient training and home evaluation completed","isSelected":false},{"id":222,"name":"Vehicle inspection completed for delivery date","isSelected":false},{"id":223,"name":"Claim reviewed and DOS field updated and consistent with Date on the signed delivery ticket","isSelected":false},{"id":224,"name":"Claim meets all required compliance and billing guidelines and is ready for submission","isSelected":false}]},{"header":"The following has been explained/reviewed with patient.","options":[{"id":1,"name":"Equipment use instructions","isSelected":false},{"id":2,"name":"Costs and reimbursement","isSelected":false},{"id":3,"name":"Home safety & home fire safety","isSelected":false},{"id":4,"name":"Complaint process","isSelected":false},{"id":5,"name":"Patient rights & responsibilities","isSelected":false},{"id":6,"name":"Notice of privacy practices (HIPAA)","isSelected":false},{"id":7,"name":"Infection prevention and control","isSelected":false},{"id":8,"name":"CMS standards","isSelected":false},{"id":9,"name":"Patient satisfaction","isSelected":false},{"id":10,"name":"Patient falls education","isSelected":false},{"id":11,"name":"Policy notification","isSelected":false},{"id":12,"name":"Victim abuse","isSelected":false}]}]
/// phoneCall : "1239874300"
/// caregiverOptions : [{"id":1,"name":"POA"},{"id":2,"name":"Relative"},{"id":3,"name":"Other"}]
/// zip : "12457"

class TrClaimModel {
  TrClaimModel({
      int? orderId, 
      String? patientName, 
      String? birthDate, 
      String? deliveryDisplayAddress, 
      String? patientInsuranceName, 
      List<ServiceLines>? serviceLines, 
      List<CheckListDetails>? checkListDetails, 
      String? phoneCall, 
      List<CaregiverOptions>? caregiverOptions, 
      String? zip,}){
    _orderId = orderId;
    _patientName = patientName;
    _birthDate = birthDate;
    _deliveryDisplayAddress = deliveryDisplayAddress;
    _patientInsuranceName = patientInsuranceName;
    _serviceLines = serviceLines;
    _checkListDetails = checkListDetails;
    _phoneCall = phoneCall;
    _caregiverOptions = caregiverOptions;
    _zip = zip;
}

  TrClaimModel.fromJson(dynamic json) {
    _orderId = json['orderId'];
    _patientName = json['patientName'];
    _birthDate = json['birthDate'];
    _deliveryDisplayAddress = json['deliveryDisplayAddress'];
    _patientInsuranceName = json['patientInsuranceName'];
    if (json['serviceLines'] != null) {
      _serviceLines = [];
      json['serviceLines'].forEach((v) {
        _serviceLines?.add(ServiceLines.fromJson(v));
      });
    }
    if (json['checkListDetails'] != null) {
      _checkListDetails = [];
      json['checkListDetails'].forEach((v) {
        _checkListDetails?.add(CheckListDetails.fromJson(v));
      });
    }
    _phoneCall = json['phoneCall'];
    if (json['caregiverOptions'] != null) {
      _caregiverOptions = [];
      json['caregiverOptions'].forEach((v) {
        _caregiverOptions?.add(CaregiverOptions.fromJson(v));
      });
    }
    _zip = json['zip'];
  }
  int? _orderId;
  String? _patientName;
  String? _birthDate;
  String? _deliveryDisplayAddress;
  String? _patientInsuranceName;
  List<ServiceLines>? _serviceLines;
  List<CheckListDetails>? _checkListDetails;
  String? _phoneCall;
  List<CaregiverOptions>? _caregiverOptions;
  String? _zip;
TrClaimModel copyWith({  int? orderId,
  String? patientName,
  String? birthDate,
  String? deliveryDisplayAddress,
  String? patientInsuranceName,
  List<ServiceLines>? serviceLines,
  List<CheckListDetails>? checkListDetails,
  String? phoneCall,
  List<CaregiverOptions>? caregiverOptions,
  String? zip,
}) => TrClaimModel(  orderId: orderId ?? _orderId,
  patientName: patientName ?? _patientName,
  birthDate: birthDate ?? _birthDate,
  deliveryDisplayAddress: deliveryDisplayAddress ?? _deliveryDisplayAddress,
  patientInsuranceName: patientInsuranceName ?? _patientInsuranceName,
  serviceLines: serviceLines ?? _serviceLines,
  checkListDetails: checkListDetails ?? _checkListDetails,
  phoneCall: phoneCall ?? _phoneCall,
  caregiverOptions: caregiverOptions ?? _caregiverOptions,
  zip: zip ?? _zip,
);
  int? get orderId => _orderId;
  String? get patientName => _patientName;
  String? get birthDate => _birthDate;
  String? get deliveryDisplayAddress => _deliveryDisplayAddress;
  String? get patientInsuranceName => _patientInsuranceName;
  List<ServiceLines>? get serviceLines => _serviceLines;
  List<CheckListDetails>? get checkListDetails => _checkListDetails;
  String? get phoneCall => _phoneCall;
  List<CaregiverOptions>? get caregiverOptions => _caregiverOptions;
  String? get zip => _zip;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orderId'] = _orderId;
    map['patientName'] = _patientName;
    map['birthDate'] = _birthDate;
    map['deliveryDisplayAddress'] = _deliveryDisplayAddress;
    map['patientInsuranceName'] = _patientInsuranceName;
    if (_serviceLines != null) {
      map['serviceLines'] = _serviceLines?.map((v) => v.toJson()).toList();
    }
    if (_checkListDetails != null) {
      map['checkListDetails'] = _checkListDetails?.map((v) => v.toJson()).toList();
    }
    map['phoneCall'] = _phoneCall;
    if (_caregiverOptions != null) {
      map['caregiverOptions'] = _caregiverOptions?.map((v) => v.toJson()).toList();
    }
    map['zip'] = _zip;
    return map;
  }

}

/// id : 1
/// name : "POA"

class CaregiverOptions {
  CaregiverOptions({
      int? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  CaregiverOptions.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;
CaregiverOptions copyWith({  int? id,
  String? name,
}) => CaregiverOptions(  id: id ?? _id,
  name: name ?? _name,
);
  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

/// header : "Claim check list."
/// options : [{"id":220,"name":"Equipment delivered","isSelected":false},{"id":221,"name":"Patient training and home evaluation completed","isSelected":false},{"id":222,"name":"Vehicle inspection completed for delivery date","isSelected":false},{"id":223,"name":"Claim reviewed and DOS field updated and consistent with Date on the signed delivery ticket","isSelected":false},{"id":224,"name":"Claim meets all required compliance and billing guidelines and is ready for submission","isSelected":false}]

class CheckListDetails {
  CheckListDetails({
      String? header, 
      List<Options>? options,}){
    _header = header;
    _options = options;
}

  CheckListDetails.fromJson(dynamic json) {
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
CheckListDetails copyWith({  String? header,
  List<Options>? options,
}) => CheckListDetails(  header: header ?? _header,
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

/// id : 220
/// name : "Equipment delivered"
/// isSelected : false

class Options {
  Options({
      int? id, 
      String? name, 
      bool? isSelected,}){
    _id = id;
    _name = name;
    _isSelected = isSelected;
}

  Options.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _isSelected = json['isSelected'];
  }
  int? _id;
  String? _name;
  bool? _isSelected;
Options copyWith({  int? id,
  String? name,
  bool? isSelected,
}) => Options(  id: id ?? _id,
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

/// id : 4797
/// hcpc : "A6549"
/// description : "Custom Compression"
/// serial : null
/// qty : 1
/// model : null
/// manufacturer : null
/// inventoryOptions : null

class ServiceLines {
  ServiceLines({
      int? id, 
      String? hcpc, 
      String? description, 
      dynamic serial, 
      int? qty, 
      dynamic model, 
      dynamic manufacturer, 
      dynamic inventoryOptions,}){
    _id = id;
    _hcpc = hcpc;
    _description = description;
    _serial = serial;
    _qty = qty;
    _model = model;
    _manufacturer = manufacturer;
    _inventoryOptions = inventoryOptions;
}

  ServiceLines.fromJson(dynamic json) {
    _id = json['id'];
    _hcpc = json['hcpc'];
    _description = json['description'];
    _serial = json['serial'];
    _qty = json['qty'];
    _model = json['model'];
    _manufacturer = json['manufacturer'];
    _inventoryOptions = json['inventoryOptions'];
  }
  int? _id;
  String? _hcpc;
  String? _description;
  dynamic _serial;
  int? _qty;
  dynamic _model;
  dynamic _manufacturer;
  dynamic _inventoryOptions;
ServiceLines copyWith({  int? id,
  String? hcpc,
  String? description,
  dynamic serial,
  int? qty,
  dynamic model,
  dynamic manufacturer,
  dynamic inventoryOptions,
}) => ServiceLines(  id: id ?? _id,
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
  dynamic get inventoryOptions => _inventoryOptions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['hcpc'] = _hcpc;
    map['description'] = _description;
    map['serial'] = _serial;
    map['qty'] = _qty;
    map['model'] = _model;
    map['manufacturer'] = _manufacturer;
    map['inventoryOptions'] = _inventoryOptions;
    return map;
  }

}