class CommonResponse {
  String? responseType;
  String? responseMessage;
  String? responseObject;
  // "responseObject": null,

  CommonResponse({this.responseType, this.responseMessage,this.responseObject});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    responseType = json['responseType'];
    responseMessage = json['responseMessage'];
    responseObject = json['responseObject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseType'] = this.responseType;
    data['responseMessage'] = this.responseMessage;
    data['responseObject'] = this.responseObject;
    return data;
  }
}