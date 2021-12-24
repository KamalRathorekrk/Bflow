/// responseType : "Ok"
/// responseObject : [{"id":1,"value":"POA"},{"id":2,"value":"Relative"},{"id":3,"value":"Other"}]
/// responseMessage : null

class WhoReceivedModel {
  WhoReceivedModel({
      String? responseType, 
      List<ReceiverData>? receiverData,
      dynamic responseMessage,}){
    _responseType = responseType;
    _receiverData = receiverData;
    _responseMessage = responseMessage;
}

  WhoReceivedModel.fromJson(dynamic json) {
    _responseType = json['responseType'];
    if (json['responseObject'] != null) {
      _receiverData = [];
      json['responseObject'].forEach((v) {
        _receiverData?.add(ReceiverData.fromJson(v));
      });
    }
    _responseMessage = json['responseMessage'];
  }
  String? _responseType;
  List<ReceiverData>? _receiverData;
  dynamic _responseMessage;

  String? get responseType => _responseType;
  List<ReceiverData>? get receiverData => _receiverData;
  dynamic get responseMessage => _responseMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseType'] = _responseType;
    if (_receiverData != null) {
      map['responseObject'] = _receiverData?.map((v) => v.toJson()).toList();
    }
    map['responseMessage'] = _responseMessage;
    return map;
  }

}

/// id : 1
/// value : "POA"

class ReceiverData {
  ReceiverData({
      int? id, 
      String? value,}){
    _id = id;
    _value = value;
}

  ReceiverData.fromJson(dynamic json) {
    _id = json['id'];
    _value = json['value'];
  }
  int? _id;
  String? _value;

  int? get id => _id;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['value'] = _value;
    return map;
  }

}