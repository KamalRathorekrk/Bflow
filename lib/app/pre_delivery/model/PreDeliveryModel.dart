/// responseType : "Ok"
/// responseObject : [{"claimId":5374,"dateOfservice":"06/16/2022 00:00:00","birthDate":"12/12/1999 00:00:00","patientFullName":"dev dev","p_company_name":null,"address":null,"city":null,"state":null,"zipcode":"12312-3123"},{"claimId":5388,"dateOfservice":"07/14/2022 00:00:00","birthDate":"01/01/1901 00:00:00","patientFullName":"Ifrahim Mubasher","p_company_name":"AARP","address":"xyz","city":"new","state":"CA","zipcode":"01010-1010"}]
/// responseMessage : null

class PreDeliveryModel {
  PreDeliveryModel({
      String? responseType, 
      List<PreDeliveryobject>? responseObject,
      dynamic responseMessage,}){
    _responseType = responseType;
    _responseObject = responseObject;
    _responseMessage = responseMessage;
}

  PreDeliveryModel.fromJson(dynamic json) {
    _responseType = json['responseType'];
    if (json['responseObject'] != null) {
      _responseObject = [];
      json['responseObject'].forEach((v) {
        _responseObject?.add(PreDeliveryobject.fromJson(v));
      });
    }
    _responseMessage = json['responseMessage'];
  }
  String? _responseType;
  List<PreDeliveryobject>? _responseObject;
  dynamic _responseMessage;
PreDeliveryModel copyWith({  String? responseType,
  List<PreDeliveryobject>? responseObject,
  dynamic responseMessage,
}) => PreDeliveryModel(  responseType: responseType ?? _responseType,
  responseObject: responseObject ?? _responseObject,
  responseMessage: responseMessage ?? _responseMessage,
);
  String? get responseType => _responseType;
  List<PreDeliveryobject>? get responseObject => _responseObject;
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

/// claimId : 5374
/// dateOfservice : "06/16/2022 00:00:00"
/// birthDate : "12/12/1999 00:00:00"
/// patientFullName : "dev dev"
/// p_company_name : null
/// address : null
/// city : null
/// state : null
/// zipcode : "12312-3123"

class PreDeliveryobject {
  PreDeliveryobject({
      int? claimId, 
      String? dateOfservice, 
      String? birthDate, 
      String? patientFullName, 
      dynamic pCompanyName, 
      dynamic address, 
      dynamic city, 
      dynamic state, 
      String? zipcode,}){
    _claimId = claimId;
    _dateOfservice = dateOfservice;
    _birthDate = birthDate;
    _patientFullName = patientFullName;
    _pCompanyName = pCompanyName;
    _address = address;
    _city = city;
    _state = state;
    _zipcode = zipcode;
}

  PreDeliveryobject.fromJson(dynamic json) {
    _claimId = json['claimId'];
    _dateOfservice = json['dateOfservice'];
    _birthDate = json['birthDate'];
    _patientFullName = json['patientFullName'];
    _pCompanyName = json['p_company_name'];
    _address = json['address'];
    _city = json['city'];
    _state = json['state'];
    _zipcode = json['zipcode'];
  }
  int? _claimId;
  String? _dateOfservice;
  String? _birthDate;
  String? _patientFullName;
  dynamic _pCompanyName;
  dynamic _address;
  dynamic _city;
  dynamic _state;
  String? _zipcode;
  PreDeliveryobject copyWith({  int? claimId,
  String? dateOfservice,
  String? birthDate,
  String? patientFullName,
  dynamic pCompanyName,
  dynamic address,
  dynamic city,
  dynamic state,
  String? zipcode,
}) => PreDeliveryobject(  claimId: claimId ?? _claimId,
  dateOfservice: dateOfservice ?? _dateOfservice,
  birthDate: birthDate ?? _birthDate,
  patientFullName: patientFullName ?? _patientFullName,
  pCompanyName: pCompanyName ?? _pCompanyName,
  address: address ?? _address,
  city: city ?? _city,
  state: state ?? _state,
  zipcode: zipcode ?? _zipcode,
);
  int? get claimId => _claimId;
  String? get dateOfservice => _dateOfservice;
  String? get birthDate => _birthDate;
  String? get patientFullName => _patientFullName;
  dynamic get pCompanyName => _pCompanyName;
  dynamic get address => _address;
  dynamic get city => _city;
  dynamic get state => _state;
  String? get zipcode => _zipcode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['claimId'] = _claimId;
    map['dateOfservice'] = _dateOfservice;
    map['birthDate'] = _birthDate;
    map['patientFullName'] = _patientFullName;
    map['p_company_name'] = _pCompanyName;
    map['address'] = _address;
    map['city'] = _city;
    map['state'] = _state;
    map['zipcode'] = _zipcode;
    return map;
  }

}