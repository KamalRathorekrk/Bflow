/// fact : ""
/// length : ""

class DemoModel {
  String? _fact;
  int? _length;

  String? get fact => _fact;
  int? get length => _length;

  DemoModel({
      String? fact, 
      int? length}){
    _fact = fact;
    _length = length;
}

  DemoModel.fromJson(dynamic json) {
    _fact = json['fact'];
    _length = json['length'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['fact'] = _fact;
    map['length'] = _length;
    return map;
  }

}