class CommonResponse {
  String? responseType;
  String? responseMessage;

  CommonResponse({this.responseType, this.responseMessage});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    responseType = json['responseType'];
    responseMessage = json['responseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseType'] = this.responseType;
    data['responseMessage'] = this.responseMessage;
    return data;
  }
}