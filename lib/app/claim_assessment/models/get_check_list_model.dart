/// responseType : "Ok"
/// responseObject : {"claimAssessmentCheckListDetails":[{"header":"The following has been explained/reviewed with patient.","options":[{"id":1,"name":"Equipment use instructions","isSelected":false},{"id":2,"name":"Costs and reimbursement","isSelected":false},{"id":3,"name":"Home safety & home fire safety","isSelected":false},{"id":4,"name":"Complaint process","isSelected":false},{"id":5,"name":"Patient rights & responsibilities","isSelected":false},{"id":6,"name":"Notice of privacy practices (HIPAA)","isSelected":false},{"id":7,"name":"Infection prevention and control","isSelected":false},{"id":8,"name":"CMS standards","isSelected":false},{"id":9,"name":"Patient satisfaction","isSelected":false},{"id":10,"name":"Patient falls education","isSelected":false},{"id":11,"name":"Policy notification","isSelected":false},{"id":12,"name":"Victim abuse","isSelected":false}]},{"header":"Claim check list.","options":[{"id":220,"name":"Equipment delivered","isSelected":false},{"id":221,"name":"Patient training and home evaluation completed","isSelected":false},{"id":222,"name":"Vehicle inspection completed for delivery date","isSelected":false},{"id":223,"name":"Claim reviewed and DOS field updated and consistent with Date on the signed delivery ticket","isSelected":false},{"id":224,"name":"Claim meets all required compliance and billing guidelines and is ready for submission","isSelected":false}]}]}
/// responseMessage : null

class GetCheckListModel {
  GetCheckListModel({
    String? responseType,
    CheckList? responseObject,
    dynamic responseMessage,
  }) {
    _responseType = responseType;
    _responseObject = responseObject;
    _responseMessage = responseMessage;
  }

  GetCheckListModel.fromJson(dynamic json) {
    _responseType = json['responseType'];
    _responseObject = json['responseObject'] != null
        ? CheckList.fromJson(json['responseObject'])
        : null;
    _responseMessage = json['responseMessage'];
  }

  String? _responseType;
  CheckList? _responseObject;
  dynamic _responseMessage;

  String? get responseType => _responseType;

  CheckList? get responseObject => _responseObject;

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

/// claimAssessmentCheckListDetails : [{"header":"The following has been explained/reviewed with patient.","options":[{"id":1,"name":"Equipment use instructions","isSelected":false},{"id":2,"name":"Costs and reimbursement","isSelected":false},{"id":3,"name":"Home safety & home fire safety","isSelected":false},{"id":4,"name":"Complaint process","isSelected":false},{"id":5,"name":"Patient rights & responsibilities","isSelected":false},{"id":6,"name":"Notice of privacy practices (HIPAA)","isSelected":false},{"id":7,"name":"Infection prevention and control","isSelected":false},{"id":8,"name":"CMS standards","isSelected":false},{"id":9,"name":"Patient satisfaction","isSelected":false},{"id":10,"name":"Patient falls education","isSelected":false},{"id":11,"name":"Policy notification","isSelected":false},{"id":12,"name":"Victim abuse","isSelected":false}]},{"header":"Claim check list.","options":[{"id":220,"name":"Equipment delivered","isSelected":false},{"id":221,"name":"Patient training and home evaluation completed","isSelected":false},{"id":222,"name":"Vehicle inspection completed for delivery date","isSelected":false},{"id":223,"name":"Claim reviewed and DOS field updated and consistent with Date on the signed delivery ticket","isSelected":false},{"id":224,"name":"Claim meets all required compliance and billing guidelines and is ready for submission","isSelected":false}]}]

class CheckList {
  CheckList({
    List<ClaimAssessmentCheckListDetails>? claimAssessmentCheckListDetails,
  }) {
    _claimAssessmentCheckListDetails = claimAssessmentCheckListDetails;
  }

  CheckList.fromJson(dynamic json) {
    if (json['claimAssessmentCheckListDetails'] != null) {
      _claimAssessmentCheckListDetails = [];
      json['claimAssessmentCheckListDetails'].forEach((v) {
        _claimAssessmentCheckListDetails
            ?.add(ClaimAssessmentCheckListDetails.fromJson(v));
      });
    }
  }

  List<ClaimAssessmentCheckListDetails>? _claimAssessmentCheckListDetails;

  List<ClaimAssessmentCheckListDetails>? get claimAssessmentCheckListDetails =>
      _claimAssessmentCheckListDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_claimAssessmentCheckListDetails != null) {
      map['claimAssessmentCheckListDetails'] =
          _claimAssessmentCheckListDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// header : "The following has been explained/reviewed with patient."
/// options : [{"id":1,"name":"Equipment use instructions","isSelected":false},{"id":2,"name":"Costs and reimbursement","isSelected":false},{"id":3,"name":"Home safety & home fire safety","isSelected":false},{"id":4,"name":"Complaint process","isSelected":false},{"id":5,"name":"Patient rights & responsibilities","isSelected":false},{"id":6,"name":"Notice of privacy practices (HIPAA)","isSelected":false},{"id":7,"name":"Infection prevention and control","isSelected":false},{"id":8,"name":"CMS standards","isSelected":false},{"id":9,"name":"Patient satisfaction","isSelected":false},{"id":10,"name":"Patient falls education","isSelected":false},{"id":11,"name":"Policy notification","isSelected":false},{"id":12,"name":"Victim abuse","isSelected":false}]

class ClaimAssessmentCheckListDetails {
  ClaimAssessmentCheckListDetails({
    String? header,
    List<Options>? options,
  }) {
    _header = header;
    _options = options;
  }

  ClaimAssessmentCheckListDetails.fromJson(dynamic json) {
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

/// id : 1
/// name : "Equipment use instructions"
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

  Options.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _isSelected = json['isSelected'];
  }

  int? _id;
  String? _name;
  bool? _isSelected;

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
