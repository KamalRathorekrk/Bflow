import 'dart:convert';
import 'dart:io';

import 'package:bflow/app/claim_assessment/models/who_received_model.dart';
import 'package:bflow/app/common/claims_details.dart';
import 'package:bflow/app/common/common_response.dart';
import 'package:bflow/app/login/model/validate_response.dart';
import 'package:bflow/app/pre_delivery/model/claim_id_response.dart';
import 'package:bflow/app/pre_delivery/model/pre_claims_model.dart';
import 'package:bflow/app/routes_activity_list/model/routes_model.dart';
import 'package:bflow/app/today_route/model/claims_model.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'common_api_end_points.dart';

class ApiRepository {
  Dio? _dio, _dioheader;
  BaseOptions? options;

  ApiRepository() {
    options = BaseOptions(
      connectTimeout: 20000,
      receiveTimeout: 20000,
    );
    _dio = Dio(options);
    _dioheader = Dio(options);
    _dio!.options.baseUrl = ApiEndPoints.base_url;
    _dio!.options.headers['content-Type'] = 'application/json';
    _dioheader!.options.baseUrl = ApiEndPoints.base_url;
    _dioheader!.options.headers['content-Type'] = 'application/json';
    _dioheader!.options.headers['Authorization'] =
        AppStrings.token != null || AppStrings.token.isNotEmpty
            ? "Bearer " + AppStrings.token.toString()
            : "";
  }

  /*................... login api ..........*/
  Future<CommonResponse> loginApi(
      {required BuildContext context,
      required String userName,
      required String password,
      required String corporateId}) async {
    print(
        'usernameEmail $userName  password $password  corporateId $corporateId');
    var response =
        await _dio!.post(ApiEndPoints.base_url + ApiEndPoints.login, data: {
      'userName': userName,
      'password': password,
      'corporateId': corporateId,
    });
    print("LoginResponse" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return CommonResponse.fromJson(data);
  }

  /*................... forget password api ..........*/
  Future<CommonResponse> forgetPassword(
      {required BuildContext context,
      required String userName,
      required String corporateId}) async {
    var response = await _dio!
        .post(ApiEndPoints.base_url + ApiEndPoints.changeProfilePhoto, data: {
      'userName': userName,
      'corporateId': corporateId,
    });
    print("ForgetPassword" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return CommonResponse.fromJson(data);
  }

  /*................... update profile photo api ..........*/
  Future<CommonResponse> updateProfile({userId, File? file}) async {
    var formData = FormData();

    formData.files.add(MapEntry(
      "photo",
      await MultipartFile.fromFile(file!.path, filename: "profilePic.png"),
    ));
    // formData.fromMap('userID', userId);
    // var response = await _dio!.post('v1/post', data: formData);
    var response = await _dioheader!.post(
        ApiEndPoints.base_url + ApiEndPoints.changeProfilePhoto,
        data: formData);
    print("ForgetPassword" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return CommonResponse.fromJson(data);
  }

/*................... validate api ..........*/
  Future<ValidateResponse> validateApi(
      {required BuildContext context,
      required String userName,
      required String password,
      required String corporateId,
      required String authCode}) async {
    var response =
        await _dio!.post(ApiEndPoints.base_url + ApiEndPoints.validate, data: {
      'userName': userName,
      'password': password,
      'corporateId': corporateId,
      'authCode': authCode,
    });
    print("validateResponse" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return ValidateResponse.fromJson(data);
  }

/*................... claim pre delivery api ..........*/
  Future<PreClaimsModel> claimPreApi(
      {required String userName,
      required String fullName,
      required String corporateId,
      required String userId,
      required String emailAddress}) async {
    print(userId + userName + fullName + corporateId + emailAddress);
    var response = await _dioheader!.post(
      ApiEndPoints.base_url + ApiEndPoints.claimDelivery,
      data: {
        "userName": userName,
        "fullName": fullName,
        "corporateId": corporateId,
        "userId": userId,
        "emailAddress": emailAddress
      },
    );
    print("ClaimsResponse" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return PreClaimsModel.fromJson(data);
  }

  /*................... claim api ..........*/
  Future<ClaimsModel> claimsApi() async {
    var response = await _dioheader!.get(
      ApiEndPoints.base_url + ApiEndPoints.claims,
    );
    print("ClaimsResponse" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return ClaimsModel.fromJson(data);
  }

/*................... claim Id api ..........*/
  Future<ClaimsDetails> claimIdDetailsApi({required String claimId}) async {
    var response = await _dioheader!.post(
      ApiEndPoints.base_url + ApiEndPoints.claims + "/$claimId",
    );
    print("ClaimsResponse" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return ClaimsDetails.fromJson(data);
  }

/*................... claim cancel ..........*/
  Future<ClaimIdResponse> claimsCancel({claimId, reason}) async {
    var response = await _dioheader!.post(
      ApiEndPoints.base_url + ApiEndPoints.claimsCancel,
      data: {'reason': reason, 'claimId': claimId},
    );
    print("ClaimsResponse" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return ClaimIdResponse.fromJson(data);
  }

/*................... who received claim list ..........*/
  Future<WhoReceivedModel> whoReceivedData() async {
    var response = await _dioheader!.get(
      ApiEndPoints.base_url + ApiEndPoints.whoReceivedDropdown,
    );
    print("Who received" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return WhoReceivedModel.fromJson(data);
  }

/*................... routes activity list ..........*/
  Future<RoutesModel> routeacivitylist({userId}) async {
    var response = await _dioheader!
        .get(ApiEndPoints.base_url + ApiEndPoints.routeAcivityList + userId);
    print("Completed Routes" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return RoutesModel.fromJson(data);
  }

/*................... complete delivery ..........*/
  Future<void> completedelivery() async {
    var response = await _dioheader!
        .post(ApiEndPoints.base_url + ApiEndPoints.completeDelivery);
    print("Completed Routes" + response.toString());
  }
Future<void> getCheckList()async{
    var response= await _dioheader!.get(ApiEndPoints.base_url+"claims/5655/checklist");
    print("get CheckList"+response.toString());
}
Future<void> postCheckList()async{
    var response= await _dioheader!.post(ApiEndPoints.base_url+"claims/5655/checklist");
    print("get CheckList"+response.toString());
}

}
