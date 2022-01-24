import 'dart:io';

import 'package:image_picker/image_picker.dart';

/// claimId : 5655
/// item : "Amazon Product"
/// patientFullName : "Test Adam"
/// deliveryAddress : {"address":"10 Sie Ave","city":"Jersey City","state":"NJ","zipCode":"07306"}
/// phoneNumber : "1239874300"
/// claimAssessmentCheckList : {"claimAssessmentCheckListDetails":[{"header":"The following has been explained/reviewed with patient.","options":[{"id":201,"name":"Equipment use instructions","isSelected":false},{"id":202,"name":"Costs and reimbursement","isSelected":false},{"id":203,"name":"Home safety & home fire safety","isSelected":false}]},{"header":"Claim check list.","options":[{"id":220,"name":"Equipment Delivered","isSelected":false},{"id":221,"name":"Patient training and home evaluation completed.","isSelected":false},{"id":222,"name":"Vehicle inspection completed for delivery date.","isSelected":false}]}]}
/// orderReceiverOptions : [{"whoReceived":"1","name":"test","title":"test-title","reasonSigned":"No Reason","signedPhone":"7329832","claimNotes":"test notes"}]
class CompleteClaimAssessment {
  File? _signature;
  List<File>? _attachments;

  CompleteClaimAssessment(
      {PostCompleteDelivery? postCompleteDelivery, attachments, signature}) {
    _postCompleteDelivery = postCompleteDelivery;
    _attachments = attachments;
    _signature = signature;
  }

  List<File>? get attachments => _attachments;

  File? get signature => _signature;
  PostCompleteDelivery? _postCompleteDelivery;

  PostCompleteDelivery? get postCompleteDelivery => _postCompleteDelivery;
}

class PostCompleteDelivery {
  PostCompleteDelivery({
    int? claimId,
    String? item,
    String? patientFullName,
    DeliveryAddressPost? deliveryAddress,
    String? phoneNumber,
    ClaimAssessmentCheckList? claimAssessmentCheckList,
    List<OrderReceiverOptions>? orderReceiverOptions,
  }) {
    _claimId = claimId;
    _item = item;
    _patientFullName = patientFullName;
    _deliveryAddress = deliveryAddress;
    _phoneNumber = phoneNumber;
    _claimAssessmentCheckList = claimAssessmentCheckList;
    _orderReceiverOptions = orderReceiverOptions;
  }

  PostCompleteDelivery.fromJson(dynamic json) {
    _claimId = json['claimId'];
    _item = json['item'];
    _patientFullName = json['patientFullName'];
    _deliveryAddress = json['deliveryAddress'] != null
        ? DeliveryAddressPost.fromJson(json['deliveryAddress'])
        : null;
    _phoneNumber = json['phoneNumber'];
    _claimAssessmentCheckList = json['claimAssessmentCheckList'];
    if (json['orderReceiverOptions'] != null) {
      _orderReceiverOptions = [];
      json['orderReceiverOptions'].forEach((v) {
        _orderReceiverOptions?.add(OrderReceiverOptions.fromJson(v));
      });
    }
  }

  int? _claimId;
  String? _item;
  String? _patientFullName;
  DeliveryAddressPost? _deliveryAddress;
  String? _phoneNumber;
  ClaimAssessmentCheckList? _claimAssessmentCheckList;
  List<OrderReceiverOptions>? _orderReceiverOptions;

  int? get claimId => _claimId;

  String? get item => _item;

  String? get patientFullName => _patientFullName;

  DeliveryAddressPost? get deliveryAddress => _deliveryAddress;

  String? get phoneNumber => _phoneNumber;

  ClaimAssessmentCheckList? get claimAssessmentCheckList =>
      _claimAssessmentCheckList;

  List<OrderReceiverOptions>? get orderReceiverOptions => _orderReceiverOptions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['claimId'] = _claimId;
    map['item'] = _item;
    map['patientFullName'] = _patientFullName;
    if (_deliveryAddress != null) {
      map['deliveryAddress'] = _deliveryAddress?.toJson();
    }
    map['phoneNumber'] = _phoneNumber;
    map['claimAssessmentCheckList'] = _claimAssessmentCheckList;
    if (_orderReceiverOptions != null) {
      map['orderReceiverOptions'] =
          _orderReceiverOptions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// whoReceived : "1"
/// name : "test"
/// title : "test-title"
/// reasonSigned : "No Reason"
/// signedPhone : "7329832"
/// claimNotes : "test notes"

class OrderReceiverOptions {
  OrderReceiverOptions({
    String? whoReceived,
    String? name,
    String? title,
    String? reasonSigned,
    String? signedPhone,
    String? claimNotes,
  }) {
    _whoReceived = whoReceived;
    _name = name;
    _title = title;
    _reasonSigned = reasonSigned;
    _signedPhone = signedPhone;
    _claimNotes = claimNotes;
  }

  OrderReceiverOptions.fromJson(dynamic json) {
    _whoReceived = json['whoReceived'];
    _name = json['name'];
    _title = json['title'];
    _reasonSigned = json['reasonSigned'];
    _signedPhone = json['signedPhone'];
    _claimNotes = json['claimNotes'];
  }

  String? _whoReceived;
  String? _name;
  String? _title;
  String? _reasonSigned;
  String? _signedPhone;
  String? _claimNotes;

  String? get whoReceived => _whoReceived;

  String? get name => _name;

  String? get title => _title;

  String? get reasonSigned => _reasonSigned;

  String? get signedPhone => _signedPhone;

  String? get claimNotes => _claimNotes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['whoReceived'] = _whoReceived;
    map['name'] = _name;
    map['title'] = _title;
    map['reasonSigned'] = _reasonSigned;
    map['signedPhone'] = _signedPhone;
    map['claimNotes'] = _claimNotes;
    return map;
  }
}

/// claimAssessmentCheckListDetails : [{"header":"The following has been explained/reviewed with patient.","options":[{"id":201,"name":"Equipment use instructions","isSelected":false},{"id":202,"name":"Costs and reimbursement","isSelected":false},{"id":203,"name":"Home safety & home fire safety","isSelected":false}]},{"header":"Claim check list.","options":[{"id":220,"name":"Equipment Delivered","isSelected":false},{"id":221,"name":"Patient training and home evaluation completed.","isSelected":false},{"id":222,"name":"Vehicle inspection completed for delivery date.","isSelected":false}]}]

class ClaimAssessmentCheckList {
  ClaimAssessmentCheckList({
    List<ClaimAssessmentCheckListDetails>? claimAssessmentCheckListDetails,
  }) {
    _claimAssessmentCheckListDetails = claimAssessmentCheckListDetails;
  }

  ClaimAssessmentCheckList.fromJson(dynamic json) {
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
/// options : [{"id":201,"name":"Equipment use instructions","isSelected":false},{"id":202,"name":"Costs and reimbursement","isSelected":false},{"id":203,"name":"Home safety & home fire safety","isSelected":false}]

class ClaimAssessmentCheckListDetails {
  ClaimAssessmentCheckListDetails({
    String? header,
    List<OptionsClaim>? options,
  }) {
    _header = header;
    _options = options;
  }

  ClaimAssessmentCheckListDetails.fromJson(dynamic json) {
    _header = json['header'];
    if (json['options'] != null) {
      _options = [];
      json['options'].forEach((v) {
        _options?.add(OptionsClaim.fromJson(v));
      });
    }
  }

  String? _header;
  List<OptionsClaim>? _options;

  String? get header => _header;

  List<OptionsClaim>? get options => _options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['header'] = _header;
    if (_options != null) {
      map['options'] = _options?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 201
/// name : "Equipment use instructions"
/// isSelected : false

class OptionsClaim {
  OptionsClaim({
    int? id,
    String? name,
    bool? isSelected,
  }) {
    _id = id;
    _name = name;
    _isSelected = isSelected;
  }

  OptionsClaim.fromJson(dynamic json) {
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

  set setIsSelected(bool value) {
    _isSelected = value;
  }
}

/// address : "10 Sie Ave"
/// city : "Jersey City"
/// state : "NJ"
/// zipCode : "07306"

class DeliveryAddressPost {
  DeliveryAddressPost({
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

  DeliveryAddressPost.fromJson(dynamic json) {
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
