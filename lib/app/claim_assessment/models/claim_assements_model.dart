/// text : ""
/// value : false

class ClaimAssementsModel {
  String? _text;
  bool? _value;

  String? get text => _text;
  bool? get value => _value;

  ClaimAssementsModel({
      String? text, 
      bool? value}){
    _text = text;
    _value = value;
}

  ClaimAssementsModel.fromJson(dynamic json) {
    _text = json['text'];
    _value = json['value'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['text'] = _text;
    map['value'] = _value;
    return map;
  }

  set setValue(bool value) {
    _value = value;
  }

  set setText(String value) {
    _text = value;
  }
}