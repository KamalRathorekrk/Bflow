import 'dart:convert';

import 'package:bflow/app/common/common_response.dart';
import 'package:bflow/app/login/model/login_model.dart';
import 'package:bflow/app/login/model/validate_response.dart';
import 'package:bflow/app/pre_delivery/model/claim_id_response.dart';
import 'package:bflow/app/pre_delivery/model/pre_claims_model.dart';
import 'package:bflow/app/today_route/model/claims_model.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'common_api_end_points.dart';

class ApiRepository {
  Dio? _dio;
  BaseOptions? options;

  ApiRepository() {
    options = BaseOptions(
      connectTimeout: 20000,
      receiveTimeout: 20000,
    );
    _dio = Dio(options);
    _dio!.options.baseUrl = ApiEndPoints.base_url;
    _dio!.options.headers['content-Type'] = 'application/json';
  }

  /*................... login api ..........*/

  Future<CommonResponse> loginApi(
      {required BuildContext context,
        required String userName,
        required String password,
        required String corporateId}) async {
    print(
        'usernameEmail ${userName}  password ${password}  corporateId ${corporateId}');
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

  Future<ValidateResponse> validateApi(
      {required BuildContext context,
        required String userName,
        required String password,
        required String corporateId,
        required String authCode}) async {
    print(
        'usernameEmail ${userName}  password ${password}  corporateId ${corporateId} authCOde $authCode');
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

  Future<PreClaimsModel> claimApi() async {
    var response = await _dio!.post(ApiEndPoints.base_url + ApiEndPoints.claims,
        options: Options(
          headers: {
            "Authorization":
            AppStrings.token != null || AppStrings.token.isNotEmpty
                ? "Bearer " + AppStrings.token.toString()
                : ""
          },
        ));
    print("ClaimsResponse" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return PreClaimsModel.fromJson(data);
  }

  Future<ClaimIdResponse> claimIdDetailsApi({required String claimId}) async {
    var response = await _dio!.post(ApiEndPoints.base_url + ApiEndPoints.claims + "/$claimId",
        options: Options(
          headers: {
            "Authorization":
            AppStrings.token != null || AppStrings.token.isNotEmpty
                ? "Bearer " + AppStrings.token.toString()
                : ""
          },
        ));
    print("ClaimsResponse" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return ClaimIdResponse.fromJson(data);
  }
}
