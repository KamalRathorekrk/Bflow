/// id : ""
/// location : ""
/// name : ""
/// time : ""
/// check : true

class DataModel {
  String? _id;
  String? _location;
  String? _name;
  String? _time;
  bool? _check;

  String? get id => _id;

  String? get location => _location;

  String? get name => _name;

  String? get time => _time;

  bool? get check => _check;

  DataModel(
      {String? id, String? location, String? name, String? time, bool? check}) {
    _id = id;
    _location = location;
    _name = name;
    _time = time;
    _check = check;
  }

  DataModel.fromJson(dynamic json) {
    _id = json['id'];
    _location = json['location'];
    _name = json['name'];
    _time = json['time'];
    _check = json['check'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['location'] = _location;
    map['name'] = _name;
    map['time'] = _time;
    map['check'] = _check;
    return map;
  }
}
