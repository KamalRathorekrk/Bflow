import 'dart:io';

import 'package:bflow/utils/CommonCheckListModel.dart';
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
  List<XFile>? _attachments;

  CompleteClaimAssessment(
      {PostCompleteDelivery? postCompleteDelivery, attachments, signature}) {
    _postCompleteDelivery = postCompleteDelivery;
    _attachments = attachments;
    _signature = signature;
  }

  List<XFile>? get attachments => _attachments;

  File? get signature => _signature;
  PostCompleteDelivery? _postCompleteDelivery;

  PostCompleteDelivery? get postCompleteDelivery => _postCompleteDelivery;
}

class PostCompleteDelivery {
  PostCompleteDelivery({
    int? claimId,
    String? address,
    String? patientFullName,
    CheckListDetails? checkListDetails,
    WhoReceived? whoReceived,
    String? careGiverName,
    String? careGiverTitle,
    String? careGiverReasonSigned,
    String? careGiverSignedPhone,
    String? notes,
    PaymentDetails? paymentDetails,
  }) {
    _claimId = claimId;
    _checkListDetails = checkListDetails;
    _whoReceived = whoReceived;
    _careGiverName = careGiverName;
    _careGiverTitle = careGiverTitle;
    _careGiverReasonSigned = careGiverReasonSigned;
    _careGiverSignedPhone = careGiverSignedPhone;
    _notes = notes;
    _paymentDetails = paymentDetails;
    _address = address;
    _patientFullName = patientFullName;
  }

  PostCompleteDelivery.fromJson(dynamic json) {
    _claimId = json['claimId'];
    _checkListDetails = json['checkListDetails'];
    _whoReceived = json['whoReceived'] != null
        ? WhoReceived.fromJson(json['whoReceived'])
        : null;
    _careGiverName = json['careGiverName'];
    _careGiverTitle = json['careGiverTitle'];
    _careGiverReasonSigned = json['careGiverReasonSigned'];
    _careGiverSignedPhone = json['careGiverSignedPhone'];
    _notes = json['notes'];
    _paymentDetails = json['paymentDetails'] != null
        ? PaymentDetails.fromJson(json['paymentDetails'])
        : null;
  }

  int? _claimId;
  CheckListDetails? _checkListDetails;
  WhoReceived? _whoReceived;
  String? _careGiverName;
  String? _careGiverTitle;
  String? _careGiverReasonSigned;
  String? _careGiverSignedPhone;
  String? _notes;
  String? _address;
  String? _patientFullName;
  PaymentDetails? _paymentDetails;

  PostCompleteDelivery copyWith({
    int? claimId,
    CheckListDetails? checkListDetails,
    WhoReceived? whoReceived,
    String? careGiverName,
    String? careGiverTitle,
    String? careGiverReasonSigned,
    String? careGiverSignedPhone,
    String? notes,
    PaymentDetails? paymentDetails,
  }) =>
      PostCompleteDelivery(
        claimId: claimId ?? _claimId,
        checkListDetails: checkListDetails ?? _checkListDetails,
        whoReceived: whoReceived ?? _whoReceived,
        careGiverName: careGiverName ?? _careGiverName,
        careGiverTitle: careGiverTitle ?? _careGiverTitle,
        careGiverReasonSigned: careGiverReasonSigned ?? _careGiverReasonSigned,
        careGiverSignedPhone: careGiverSignedPhone ?? _careGiverSignedPhone,
        notes: notes ?? _notes,
        paymentDetails: paymentDetails ?? _paymentDetails,
      );

  int? get claimId => _claimId;

  CheckListDetails? get checkListDetails => _checkListDetails;

  WhoReceived? get whoReceived => _whoReceived;

  String? get careGiverName => _careGiverName;

  String? get careGiverTitle => _careGiverTitle;

  String? get careGiverReasonSigned => _careGiverReasonSigned;

  String? get careGiverSignedPhone => _careGiverSignedPhone;

  String? get notes => _notes;

  String? get address => _address;

  String? get patientFullName => _patientFullName;

  PaymentDetails? get paymentDetails => _paymentDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['claimId'] = _claimId;
    map['checkListDetails'] = _checkListDetails?.toJson();
    if (_whoReceived != null) {
      map['whoReceived'] = _whoReceived?.toJson();
    }
    map['careGiverName'] = _careGiverName;
    map['careGiverTitle'] = _careGiverTitle;
    map['careGiverReasonSigned'] = _careGiverReasonSigned;
    map['careGiverSignedPhone'] = _careGiverSignedPhone;
    map['notes'] = _notes;
    if (_paymentDetails != null) {
      map['paymentDetails'] = _paymentDetails?.toJson();
    }
    return map;
  }
}

/// cardHolderName : "Developer"
/// cardNumber : "1234 5678 1234 5678"
/// cvc : "123"
/// exp : "25/12"

class PaymentDetails {
  PaymentDetails({
    String? cardHolderName,
    String? cardNumber,
    String? cvc,
    String? exp,
  }) {
    _cardHolderName = cardHolderName;
    _cardNumber = cardNumber;
    _cvc = cvc;
    _exp = exp;
  }

  PaymentDetails.fromJson(dynamic json) {
    _cardHolderName = json['cardHolderName'];
    _cardNumber = json['cardNumber'];
    _cvc = json['cvc'];
    _exp = json['exp'];
  }

  String? _cardHolderName;
  String? _cardNumber;
  String? _cvc;
  String? _exp;

  PaymentDetails copyWith({
    String? cardHolderName,
    String? cardNumber,
    String? cvc,
    String? exp,
  }) =>
      PaymentDetails(
        cardHolderName: cardHolderName ?? _cardHolderName,
        cardNumber: cardNumber ?? _cardNumber,
        cvc: cvc ?? _cvc,
        exp: exp ?? _exp,
      );

  String? get cardHolderName => _cardHolderName;

  String? get cardNumber => _cardNumber;

  String? get cvc => _cvc;

  String? get exp => _exp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cardHolderName'] = _cardHolderName;
    map['cardNumber'] = _cardNumber;
    map['cvc'] = _cvc;
    map['exp'] = _exp;
    return map;
  }
}

/// id : 1
/// name : "POA"

class WhoReceived {
  WhoReceived({
    int? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  WhoReceived.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }

  int? _id;
  String? _name;

  WhoReceived copyWith({
    int? id,
    String? name,
  }) =>
      WhoReceived(
        id: id ?? _id,
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
/// options : [{"id":220,"name":"Equipment delivered","isSelected":true},{"id":221,"name":"Patient training and home evaluation completed","isSelected":true},{"id":222,"name":"Vehicle inspection completed for delivery date","isSelected":true},{"id":223,"name":"Claim reviewed and DOS field updated and consistent with Date on the signed delivery ticket","isSelected":true},{"id":224,"name":"Claim meets all required compliance and billing guidelines and is ready for submission","isSelected":true}]
