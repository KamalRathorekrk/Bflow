/// text : ""
/// value : false

class ClaimAssementsModel {
  String? _name;
  bool? _isSelected;
  num? _id;

  num? get id => _id;

  String? get name => _name;

  bool? get isSelected => _isSelected;

  ClaimAssementsModel({String? name, bool? isSelected, num? id}) {
    _name = name;
    _id = id;
    _isSelected = isSelected;
  }

  ClaimAssementsModel.fromJson(dynamic json) {
    _name = json['name'];
    _isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    map['isSelected'] = _isSelected;
    return map;
  }

  set setIsSelected(bool value) {
    _isSelected = value;
  }

  set setName(String value) {
    _name = value;
  }
}
