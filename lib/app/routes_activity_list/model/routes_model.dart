// /// responseType : "Ok"
// /// responseObject : [{"orderId":5654,"date_added":"2021-10-28T19:24:35.723","patientId":3482,"orderStatusId":12,"orderStatusName":"K - Completed","dateOfservice":"10/28/2021 00:00:00","userId":123,"assignedToId":123,"amountPaid":0,"totalAmount":0,"driverId":128,"signatureOnFile":true,"isCancelled":false,"employment":false,"isArchived":false,"isCashOrder":true,"suspendOnDate":"","updatedOn":"2021-10-28T19:27:14.273","legacyOrderId":"","isClaimCrossedOverPending":false,"claimAgentName":"","purchaseOrderNumber":"","orderTransmissionStatusId":0,"orderPickUpDate":"","deliveryMethodId":4,"claimFrequencyTypeId":1,"insuranceClaimNumber":"","orderStateID":0,"claimDelayReasonCode":0,"comments":"","driverName":"Driver Bflow","birthDate":"01/11/1972 00:00:00","patientFullName":"Jones Karl","p_company_name":"Humana Inc.","address":"8050 N PALM AVE","city":"FRESNO","state":"CA","zipcode":"93711"}]
// /// responseMessage : ""
//
// class RoutesModel {
//   RoutesModel({
//       String? responseType,
//       List<RoutesDetails>? responseObject,
//       String? responseMessage,}){
//     _responseType = responseType;
//     _responseObject = responseObject;
//     _responseMessage = responseMessage;
// }
//
//   RoutesModel.fromJson(dynamic json) {
//     _responseType = json['responseType'];
//     if (json['responseObject'] != null) {
//       _responseObject = [];
//       json['responseObject'].forEach((v) {
//         _responseObject?.add(RoutesDetails.fromJson(v));
//       });
//     }
//     _responseMessage = json['responseMessage'];
//   }
//   String? _responseType;
//   List<RoutesDetails>? _responseObject;
//   String? _responseMessage;
//
//   String? get responseType => _responseType;
//   List<RoutesDetails>? get responseObject => _responseObject;
//   String? get responseMessage => _responseMessage;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['responseType'] = _responseType;
//     if (_responseObject != null) {
//       map['responseObject'] = _responseObject?.map((v) => v.toJson()).toList();
//     }
//     map['responseMessage'] = _responseMessage;
//     return map;
//   }
//
// }
//
// /// orderId : 5654
// /// date_added : "2021-10-28T19:24:35.723"
// /// patientId : 3482
// /// orderStatusId : 12
// /// orderStatusName : "K - Completed"
// /// dateOfservice : "10/28/2021 00:00:00"
// /// userId : 123
// /// assignedToId : 123
// /// amountPaid : 0
// /// totalAmount : 0
// /// driverId : 128
// /// signatureOnFile : true
// /// isCancelled : false
// /// employment : false
// /// isArchived : false
// /// isCashOrder : true
// /// suspendOnDate : ""
// /// updatedOn : "2021-10-28T19:27:14.273"
// /// legacyOrderId : ""
// /// isClaimCrossedOverPending : false
// /// claimAgentName : ""
// /// purchaseOrderNumber : ""
// /// orderTransmissionStatusId : 0
// /// orderPickUpDate : ""
// /// deliveryMethodId : 4
// /// claimFrequencyTypeId : 1
// /// insuranceClaimNumber : ""
// /// orderStateID : 0
// /// claimDelayReasonCode : 0
// /// comments : ""
// /// driverName : "Driver Bflow"
// /// birthDate : "01/11/1972 00:00:00"
// /// patientFullName : "Jones Karl"
// /// p_company_name : "Humana Inc."
// /// address : "8050 N PALM AVE"
// /// city : "FRESNO"
// /// state : "CA"
// /// zipcode : "93711"
//
// class RoutesDetails {
//   RoutesDetails({
//       num? orderId,
//       String? dateAdded,
//       num? patientId,
//       num? orderStatusId,
//       String? orderStatusName,
//       String? dateOfservice,
//       num? userId,
//       num? assignedToId,
//       num? amountPaid,
//       num? totalAmount,
//       num? driverId,
//       bool? signatureOnFile,
//       bool? isCancelled,
//       bool? employment,
//       bool? isArchived,
//       bool? isCashOrder,
//       String? suspendOnDate,
//       String? updatedOn,
//       String? legacyOrderId,
//       bool? isClaimCrossedOverPending,
//       String? claimAgentName,
//       String? purchaseOrderNumber,
//       num? orderTransmissionStatusId,
//       String? orderPickUpDate,
//       num? deliveryMethodId,
//       num? claimFrequencyTypeId,
//       String? insuranceClaimNumber,
//       num? orderStateID,
//       num? claimDelayReasonCode,
//       String? comments,
//       String? driverName,
//       String? birthDate,
//       String? patientFullName,
//       String? pCompanyName,
//       String? address,
//       String? city,
//       String? state,
//       String? zipcode,}){
//     _orderId = orderId;
//     _dateAdded = dateAdded;
//     _patientId = patientId;
//     _orderStatusId = orderStatusId;
//     _orderStatusName = orderStatusName;
//     _dateOfservice = dateOfservice;
//     _userId = userId;
//     _assignedToId = assignedToId;
//     _amountPaid = amountPaid;
//     _totalAmount = totalAmount;
//     _driverId = driverId;
//     _signatureOnFile = signatureOnFile;
//     _isCancelled = isCancelled;
//     _employment = employment;
//     _isArchived = isArchived;
//     _isCashOrder = isCashOrder;
//     _suspendOnDate = suspendOnDate;
//     _updatedOn = updatedOn;
//     _legacyOrderId = legacyOrderId;
//     _isClaimCrossedOverPending = isClaimCrossedOverPending;
//     _claimAgentName = claimAgentName;
//     _purchaseOrderNumber = purchaseOrderNumber;
//     _orderTransmissionStatusId = orderTransmissionStatusId;
//     _orderPickUpDate = orderPickUpDate;
//     _deliveryMethodId = deliveryMethodId;
//     _claimFrequencyTypeId = claimFrequencyTypeId;
//     _insuranceClaimNumber = insuranceClaimNumber;
//     _orderStateID = orderStateID;
//     _claimDelayReasonCode = claimDelayReasonCode;
//     _comments = comments;
//     _driverName = driverName;
//     _birthDate = birthDate;
//     _patientFullName = patientFullName;
//     _pCompanyName = pCompanyName;
//     _address = address;
//     _city = city;
//     _state = state;
//     _zipcode = zipcode;
// }
//
//   RoutesDetails.fromJson(dynamic json) {
//     _orderId = json['orderId'];
//     _dateAdded = json['date_added'];
//     _patientId = json['patientId'];
//     _orderStatusId = json['orderStatusId'];
//     _orderStatusName = json['orderStatusName'];
//     _dateOfservice = json['dateOfservice'];
//     _userId = json['userId'];
//     _assignedToId = json['assignedToId'];
//     _amountPaid = json['amountPaid'];
//     _totalAmount = json['totalAmount'];
//     _driverId = json['driverId'];
//     _signatureOnFile = json['signatureOnFile'];
//     _isCancelled = json['isCancelled'];
//     _employment = json['employment'];
//     _isArchived = json['isArchived'];
//     _isCashOrder = json['isCashOrder'];
//     _suspendOnDate = json['suspendOnDate'];
//     _updatedOn = json['updatedOn'];
//     _legacyOrderId = json['legacyOrderId'];
//     _isClaimCrossedOverPending = json['isClaimCrossedOverPending'];
//     _claimAgentName = json['claimAgentName'];
//     _purchaseOrderNumber = json['purchaseOrderNumber'];
//     _orderTransmissionStatusId = json['orderTransmissionStatusId'];
//     _orderPickUpDate = json['orderPickUpDate'];
//     _deliveryMethodId = json['deliveryMethodId'];
//     _claimFrequencyTypeId = json['claimFrequencyTypeId'];
//     _insuranceClaimNumber = json['insuranceClaimNumber'];
//     _orderStateID = json['orderStateID'];
//     _claimDelayReasonCode = json['claimDelayReasonCode'];
//     _comments = json['comments'];
//     _driverName = json['driverName'];
//     _birthDate = json['birthDate'];
//     _patientFullName = json['patientFullName'];
//     _pCompanyName = json['p_company_name'];
//     _address = json['address'];
//     _city = json['city'];
//     _state = json['state'];
//     _zipcode = json['zipcode'];
//   }
//   num? _orderId;
//   String? _dateAdded;
//   num? _patientId;
//   num? _orderStatusId;
//   String? _orderStatusName;
//   String? _dateOfservice;
//   num? _userId;
//   num? _assignedToId;
//   num? _amountPaid;
//   num? _totalAmount;
//   num? _driverId;
//   bool? _signatureOnFile;
//   bool? _isCancelled;
//   bool? _employment;
//   bool? _isArchived;
//   bool? _isCashOrder;
//   String? _suspendOnDate;
//   String? _updatedOn;
//   String? _legacyOrderId;
//   bool? _isClaimCrossedOverPending;
//   String? _claimAgentName;
//   String? _purchaseOrderNumber;
//   num? _orderTransmissionStatusId;
//   String? _orderPickUpDate;
//   num? _deliveryMethodId;
//   num? _claimFrequencyTypeId;
//   String? _insuranceClaimNumber;
//   num? _orderStateID;
//   num? _claimDelayReasonCode;
//   String? _comments;
//   String? _driverName;
//   String? _birthDate;
//   String? _patientFullName;
//   String? _pCompanyName;
//   String? _address;
//   String? _city;
//   String? _state;
//   String? _zipcode;
//
//   num? get orderId => _orderId;
//   String? get dateAdded => _dateAdded;
//   num? get patientId => _patientId;
//   num? get orderStatusId => _orderStatusId;
//   String? get orderStatusName => _orderStatusName;
//   String? get dateOfservice => _dateOfservice;
//   num? get userId => _userId;
//   num? get assignedToId => _assignedToId;
//   num? get amountPaid => _amountPaid;
//   num? get totalAmount => _totalAmount;
//   num? get driverId => _driverId;
//   bool? get signatureOnFile => _signatureOnFile;
//   bool? get isCancelled => _isCancelled;
//   bool? get employment => _employment;
//   bool? get isArchived => _isArchived;
//   bool? get isCashOrder => _isCashOrder;
//   String? get suspendOnDate => _suspendOnDate;
//   String? get updatedOn => _updatedOn;
//   String? get legacyOrderId => _legacyOrderId;
//   bool? get isClaimCrossedOverPending => _isClaimCrossedOverPending;
//   String? get claimAgentName => _claimAgentName;
//   String? get purchaseOrderNumber => _purchaseOrderNumber;
//   num? get orderTransmissionStatusId => _orderTransmissionStatusId;
//   String? get orderPickUpDate => _orderPickUpDate;
//   num? get deliveryMethodId => _deliveryMethodId;
//   num? get claimFrequencyTypeId => _claimFrequencyTypeId;
//   String? get insuranceClaimNumber => _insuranceClaimNumber;
//   num? get orderStateID => _orderStateID;
//   num? get claimDelayReasonCode => _claimDelayReasonCode;
//   String? get comments => _comments;
//   String? get driverName => _driverName;
//   String? get birthDate => _birthDate;
//   String? get patientFullName => _patientFullName;
//   String? get pCompanyName => _pCompanyName;
//   String? get address => _address;
//   String? get city => _city;
//   String? get state => _state;
//   String? get zipcode => _zipcode;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['orderId'] = _orderId;
//     map['date_added'] = _dateAdded;
//     map['patientId'] = _patientId;
//     map['orderStatusId'] = _orderStatusId;
//     map['orderStatusName'] = _orderStatusName;
//     map['dateOfservice'] = _dateOfservice;
//     map['userId'] = _userId;
//     map['assignedToId'] = _assignedToId;
//     map['amountPaid'] = _amountPaid;
//     map['totalAmount'] = _totalAmount;
//     map['driverId'] = _driverId;
//     map['signatureOnFile'] = _signatureOnFile;
//     map['isCancelled'] = _isCancelled;
//     map['employment'] = _employment;
//     map['isArchived'] = _isArchived;
//     map['isCashOrder'] = _isCashOrder;
//     map['suspendOnDate'] = _suspendOnDate;
//     map['updatedOn'] = _updatedOn;
//     map['legacyOrderId'] = _legacyOrderId;
//     map['isClaimCrossedOverPending'] = _isClaimCrossedOverPending;
//     map['claimAgentName'] = _claimAgentName;
//     map['purchaseOrderNumber'] = _purchaseOrderNumber;
//     map['orderTransmissionStatusId'] = _orderTransmissionStatusId;
//     map['orderPickUpDate'] = _orderPickUpDate;
//     map['deliveryMethodId'] = _deliveryMethodId;
//     map['claimFrequencyTypeId'] = _claimFrequencyTypeId;
//     map['insuranceClaimNumber'] = _insuranceClaimNumber;
//     map['orderStateID'] = _orderStateID;
//     map['claimDelayReasonCode'] = _claimDelayReasonCode;
//     map['comments'] = _comments;
//     map['driverName'] = _driverName;
//     map['birthDate'] = _birthDate;
//     map['patientFullName'] = _patientFullName;
//     map['p_company_name'] = _pCompanyName;
//     map['address'] = _address;
//     map['city'] = _city;
//     map['state'] = _state;
//     map['zipcode'] = _zipcode;
//     return map;
//   }
//
// }