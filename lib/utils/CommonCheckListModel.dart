/// responseType : "Ok"
/// responseObject : {"checkListDetails":[{"header":"Claim check list.","options":[{"id":220,"name":"Equipment delivered","isSelected":false},{"id":221,"name":"Patient training and home evaluation completed","isSelected":false},{"id":222,"name":"Vehicle inspection completed for delivery date","isSelected":false},{"id":223,"name":"Claim reviewed and DOS field updated and consistent with Date on the signed delivery ticket","isSelected":false},{"id":224,"name":"Claim meets all required compliance and billing guidelines and is ready for submission","isSelected":false}]},{"header":"The following has been explained/reviewed with patient.","options":[{"id":1,"name":"Equipment use instructions","isSelected":false},{"id":2,"name":"Costs and reimbursement","isSelected":false},{"id":3,"name":"Home safety & home fire safety","isSelected":false},{"id":4,"name":"Complaint process","isSelected":false},{"id":5,"name":"Patient rights & responsibilities","isSelected":false},{"id":6,"name":"Notice of privacy practices (HIPAA)","isSelected":false},{"id":7,"name":"Infection prevention and control","isSelected":false},{"id":8,"name":"CMS standards","isSelected":false},{"id":9,"name":"Patient satisfaction","isSelected":false},{"id":10,"name":"Patient falls education","isSelected":false},{"id":11,"name":"Policy notification","isSelected":false},{"id":12,"name":"Victim abuse","isSelected":false}]}]}
/// responseMessage : null

class CommonCheckListModel {
  CommonCheckListModel({
      String? responseType, 
      CheckListObject? responseObject,
      dynamic responseMessage,}){
    _responseType = responseType;
    _responseObject = responseObject;
    _responseMessage = responseMessage;
}

  CommonCheckListModel.fromJson(dynamic json) {
    _responseType = json['responseType'];
    _responseObject = json['responseObject'] != null ? CheckListObject.fromJson(json['responseObject']) : null;
    _responseMessage = json['responseMessage'];
  }
  String? _responseType;
  CheckListObject? _responseObject;
  dynamic _responseMessage;
CommonCheckListModel copyWith({  String? responseType,
  CheckListObject? responseObject,
  dynamic responseMessage,
}) => CommonCheckListModel(  responseType: responseType ?? _responseType,
  responseObject: responseObject ?? _responseObject,
  responseMessage: responseMessage ?? _responseMessage,
);
  String? get responseType => _responseType;
  CheckListObject? get responseObject => _responseObject;
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

/// checkListDetails : [{"header":"Claim check list.","options":[{"id":220,"name":"Equipment delivered","isSelected":false},{"id":221,"name":"Patient training and home evaluation completed","isSelected":false},{"id":222,"name":"Vehicle inspection completed for delivery date","isSelected":false},{"id":223,"name":"Claim reviewed and DOS field updated and consistent with Date on the signed delivery ticket","isSelected":false},{"id":224,"name":"Claim meets all required compliance and billing guidelines and is ready for submission","isSelected":false}]},{"header":"The following has been explained/reviewed with patient.","options":[{"id":1,"name":"Equipment use instructions","isSelected":false},{"id":2,"name":"Costs and reimbursement","isSelected":false},{"id":3,"name":"Home safety & home fire safety","isSelected":false},{"id":4,"name":"Complaint process","isSelected":false},{"id":5,"name":"Patient rights & responsibilities","isSelected":false},{"id":6,"name":"Notice of privacy practices (HIPAA)","isSelected":false},{"id":7,"name":"Infection prevention and control","isSelected":false},{"id":8,"name":"CMS standards","isSelected":false},{"id":9,"name":"Patient satisfaction","isSelected":false},{"id":10,"name":"Patient falls education","isSelected":false},{"id":11,"name":"Policy notification","isSelected":false},{"id":12,"name":"Victim abuse","isSelected":false}]}]

class CheckListObject {
  CheckListObject({
      List<CheckListDetails>? checkListDetails,}){
    _checkListDetails = checkListDetails;
}

  CheckListObject.fromJson(dynamic json) {
    if (json['checkListDetails'] != null) {
      _checkListDetails = [];
      json['checkListDetails'].forEach((v) {
        _checkListDetails?.add(CheckListDetails.fromJson(v));
      });
    }
  }
  List<CheckListDetails>? _checkListDetails;
CheckListObject copyWith({  List<CheckListDetails>? checkListDetails,
}) => CheckListObject(  checkListDetails: checkListDetails ?? _checkListDetails,
);
  List<CheckListDetails>? get checkListDetails => _checkListDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_checkListDetails != null) {
      map['checkListDetails'] = _checkListDetails?.map((v) => v.toJson()).toList();
    }
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