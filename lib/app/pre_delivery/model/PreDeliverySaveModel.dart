import 'package:bflow/app/pre_delivery/model/PreDeliveryIdModel.dart';

/// claimId : 5412
/// note : "this is test note"
/// checkListDetails : {"header":"Claim check list.","options":[{"id":216,"name":"Pick Equipment (does picked equipment serial number match order serial numbers)","isSelected":true},{"id":217,"name":"Complete equipment inspection log","isSelected":true},{"id":218,"name":"Print delivery ticket and delivery packet","isSelected":true},{"id":219,"name":"Verify delivery address and time","isSelected":true}]}
/// serviceLines : [{"id":8503,"inventoryId":20}]

class PreDeliverySave {
  PreDeliverySave({
    num? claimId,
    String? note,
    String? deliveryDate,
    PreCheckListDetails? checkListDetails,
    List<ServiceLines>? serviceLines,
  }) {
    _claimId = claimId;
    _note = note;
    _deliveryDate = deliveryDate;
    _checkListDetails = checkListDetails;
    _serviceLines = serviceLines;
  }

  PreDeliverySave.fromJson(dynamic json) {
    _claimId = json['claimId'];
    _note = json['note'];
    _deliveryDate = json['deliveryDate'];
    _checkListDetails = json['checkListDetails'];
    if (json['serviceLines'] != null) {
      _serviceLines = [];
      json['serviceLines'].forEach((v) {
        _serviceLines?.add(ServiceLines.fromJson(v));
      });
    }
  }

  num? _claimId;
  String? _note;
  String? _deliveryDate;
  PreCheckListDetails? _checkListDetails;
  List<ServiceLines>? _serviceLines;

  PreDeliverySave copyWith({
    num? claimId,
    String? note,
    String? deliveryDate,
    PreCheckListDetails? checkListDetails,
    List<ServiceLines>? serviceLines,
  }) =>
      PreDeliverySave(
        claimId: claimId ?? _claimId,
        note: note ?? _note,
        deliveryDate: deliveryDate ?? _deliveryDate,
        checkListDetails: checkListDetails ?? _checkListDetails,
        serviceLines: serviceLines ?? _serviceLines,
      );

  num? get claimId => _claimId;

  String? get note => _note;

  String? get deliveryDate => _deliveryDate;

  PreCheckListDetails? get checkListDetails => _checkListDetails;

  List<ServiceLines>? get serviceLines => _serviceLines;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['claimId'] = _claimId;
    map['note'] = _note;
    map['deliveryDate'] = _deliveryDate;
    map['checkListDetails'] = _checkListDetails;
    if (_serviceLines != null) {
      map['serviceLines'] = _serviceLines?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 8503
/// inventoryId : 20

class ServiceLines {
  ServiceLines({
    num? id,
    num? inventoryId,
  }) {
    _id = id;
    _inventoryId = inventoryId;
  }

  ServiceLines.fromJson(dynamic json) {
    _id = json['id'];
    _inventoryId = json['inventoryId'];
  }

  num? _id;
  num? _inventoryId;

  ServiceLines copyWith({
    num? id,
    num? inventoryId,
  }) =>
      ServiceLines(
        id: id ?? _id,
        inventoryId: inventoryId ?? _inventoryId,
      );

  num? get id => _id;

  num? get inventoryId => _inventoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['inventoryId'] = _inventoryId;
    return map;
  }
}

/// header : "Claim check list."
/// options : [{"id":216,"name":"Pick Equipment (does picked equipment serial number match order serial numbers)","isSelected":true},{"id":217,"name":"Complete equipment inspection log","isSelected":true},{"id":218,"name":"Print delivery ticket and delivery packet","isSelected":true},{"id":219,"name":"Verify delivery address and time","isSelected":true}]

// class CheckListDetails {
//   CheckListDetails({
//       String? header,
//       List<Options>? options,}){
//     _header = header;
//     _options = options;
// }
//
//   CheckListDetails.fromJson(dynamic json) {
//     _header = json['header'];
//     if (json['options'] != null) {
//       _options = [];
//       json['options'].forEach((v) {
//         _options?.add(Options.fromJson(v));
//       });
//     }
//   }
//   String? _header;
//   List<Options>? _options;
// CheckListDetails copyWith({  String? header,
//   List<Options>? options,
// }) => CheckListDetails(  header: header ?? _header,
//   options: options ?? _options,
// );
//   String? get header => _header;
//   List<Options>? get options => _options;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['header'] = _header;
//     if (_options != null) {
//       map['options'] = _options?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }

/// id : 216
/// name : "Pick Equipment (does picked equipment serial number match order serial numbers)"
/// isSelected : true

class Options {
  Options({
    num? id,
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

  num? _id;
  String? _name;
  bool? _isSelected;

  Options copyWith({
    num? id,
    String? name,
    bool? isSelected,
  }) =>
      Options(
        id: id ?? _id,
        name: name ?? _name,
        isSelected: isSelected ?? _isSelected,
      );

  num? get id => _id;

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
