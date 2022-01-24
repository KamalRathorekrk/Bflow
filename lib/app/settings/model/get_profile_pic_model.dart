/// responseType : "Ok"
/// responseObject : {"imgUrl":"https://bflowreportingdatasource.s3.us-west-2.amazonaws.com/%7B0%7D/%7B1%7D/3b46cd48-5efc-414e-9172-09e2d2832e53_bflow_logo_launcher.png?X-Amz-Expires=172800&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAUJGPWJPX2D7VDW2R/20211231/us-west-2/s3/aws4_request&X-Amz-Date=20211231T130757Z&X-Amz-SignedHeaders=host&X-Amz-Signature=1433dcc1e2031a6d7d8f66a0c11f61d9b4d2abfe216402ccc32838a9f384825f"}
/// responseMessage : "This url expires in two days."

class GetProfilePicModel {
  GetProfilePicModel({
      String? responseType, 
      ResponseObject? responseObject, 
      String? responseMessage,}){
    _responseType = responseType;
    _responseObject = responseObject;
    _responseMessage = responseMessage;
}

  GetProfilePicModel.fromJson(dynamic json) {
    _responseType = json['responseType'];
    _responseObject = json['responseObject'] != null ? ResponseObject.fromJson(json['responseObject']) : null;
    _responseMessage = json['responseMessage'];
  }
  String? _responseType;
  ResponseObject? _responseObject;
  String? _responseMessage;

  String? get responseType => _responseType;
  ResponseObject? get responseObject => _responseObject;
  String? get responseMessage => _responseMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseType'] = _responseType;
    if (_responseObject != null) {
      map['responseObject'] = _responseObject?.toJson();
    }
    map['responseMessage'] = _responseMessage;
    return map;
  }

}

/// imgUrl : "https://bflowreportingdatasource.s3.us-west-2.amazonaws.com/%7B0%7D/%7B1%7D/3b46cd48-5efc-414e-9172-09e2d2832e53_bflow_logo_launcher.png?X-Amz-Expires=172800&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAUJGPWJPX2D7VDW2R/20211231/us-west-2/s3/aws4_request&X-Amz-Date=20211231T130757Z&X-Amz-SignedHeaders=host&X-Amz-Signature=1433dcc1e2031a6d7d8f66a0c11f61d9b4d2abfe216402ccc32838a9f384825f"

class ResponseObject {
  ResponseObject({
      String? imgUrl,}){
    _imgUrl = imgUrl;
}

  ResponseObject.fromJson(dynamic json) {
    _imgUrl = json['imgUrl'];
  }
  String? _imgUrl;

  String? get imgUrl => _imgUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['imgUrl'] = _imgUrl;
    return map;
  }

}