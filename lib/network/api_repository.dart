import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bflow/app/claim_assessment/models/get_check_list_model.dart';
import 'package:bflow/app/claim_assessment/models/post_complete_delivery.dart';
import 'package:bflow/app/claim_assessment/models/who_received_model.dart';
import 'package:bflow/app/common/claims_details.dart';
import 'package:bflow/app/common/common_response.dart';
import 'package:bflow/app/login/model/validate_response.dart';
import 'package:bflow/app/pre_delivery/model/claim_id_response.dart';
import 'package:bflow/app/pre_delivery/model/pre_claims_model.dart';
import 'package:bflow/app/routes_activity_list/model/get_routes_list.dart';
import 'package:bflow/app/settings/model/change_profile_pic_model.dart';
import 'package:bflow/app/settings/model/get_profile_pic_model.dart';
import 'package:bflow/app/today_route/model/claims_model.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/SharedPreferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

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

    // _dio!.options.baseUrl = ApiEndPoints.base_url;
    _dio!.options.headers['Content-Type'] = 'application/json';
    // _dio!.options.baseUrl = ApiEndPoints.base_url;
    // _dio!.options.headers['Content-Type'] = 'application/json';
    // _dio!.options.headers['Authorization'] =
    //     AppStrings.token != null || AppStrings.token.isNotEmpty
    //         ? "Bearer " + AppStrings.token.toString()
    //         : "";
    // _dio!.options.headers['Authorization'] =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJEcml2ZXIiLCJmdWxsTmFtZSI6IkRyaXZlciBCZmxvdyIsInVzZXJJZCI6IjEyOCIsIngtY29wb3JhdGVJZCAgIjoiZGVtbzE5IiwianRpIjoiOGEzMzAwNjktZjE5MC00ZTdiLTk2YzMtNzg5N2ZhMzRhZjIwIiwiZXhwIjoxNjQyNzQwMzYwLCJpc3MiOiJCZmxvdyBTb2x1dGlvbnMgSW5jIiwiYXVkIjoiQmZsb3cgTW9iaWxlIEFwcCBVc2VycyJ9.IpnL2TxYtBK1I25_0ORlnFoAsA_9yPtjnAqgxDcbS7Q";
  }

  /*................... login api ..........*/
  Future<CommonResponse> loginApi(
      {required BuildContext context,
      required String userName,
      required String password,
      required String corporateId}) async {
    var response =
        await _dio!.post(ApiEndPoints.base_url + ApiEndPoints.login, data: {
      'userName': userName,
      'password': password,
      'corporateId': corporateId,
    }).then((value) {
      print(value);
      return value;
    }).catchError((e) {
      print(e);
    });
    print("LoginResponse" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return CommonResponse.fromJson(data);
  }

  Future<CommonResponse> resendOtp(
      {required BuildContext context,
      required String userName,
      required String password,
      required String corporateId}) async {
    var response =
        await _dio!.post(ApiEndPoints.base_url + ApiEndPoints.resendOtp, data: {
      'userName': userName,
      'password': password,
      'corporateId': corporateId,
    }).then((value) {
      print(value);
      return value;
    }).catchError((e) {
      print(e);
    });
    print("resendOpt" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return CommonResponse.fromJson(data);
  }

  /*................... forget password api ..........*/
  Future<CommonResponse> forgetPassword(
      {required BuildContext context,
      required String userName,
      required String corporateId}) async {
    var response = await _dio!
        .post(ApiEndPoints.base_url + ApiEndPoints.forgotPassword, data: {
      'userName': userName,
      'corporateId': corporateId,
    });
    print("ForgetPassword" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return CommonResponse.fromJson(data);
  }

  /*................... change password api ..........*/
  Future<CommonResponse> changePassword(
      {currentPassword, newPassword, confirmPassword}) async {
    await getDioOptions(_dio);
    var response = await _dio!.post(
      ApiEndPoints.base_url + ApiEndPoints.changePassword,
      data: {
        "userId": int.parse(AppStrings.userId),
        "userName": AppStrings.userName,
        "currentPassword": currentPassword,
        "password": newPassword,
        "confirmPassword": confirmPassword,
        "corporateId": AppStrings.corporateId
      },
    );
    print("change Password : " + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return CommonResponse.fromJson(data);
  }

/*................... get profile photo api ..........*/
  Future<GetProfilePicModel> getProfileImage() async {
    await getDioOptions(_dio);
    var response = await _dio!.get(
      ApiEndPoints.base_url + ApiEndPoints.getProfilePic,
    );
    // print("get Profile Photo : " + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return GetProfilePicModel.fromJson(data);
  }

/*................... update profile photo api ..........*/
  Future<ChangeProfilePicModel> updateProfile(
      {userId, required File file}) async {
    var formData = FormData();
    formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        file.path,
      ),
      "userId": userId
    });

    await getDioOptions(_dio);
    var response = await _dio!.post(
      ApiEndPoints.base_url + ApiEndPoints.changeProfilePhoto,
      data: formData,
    );
    // print("Upload Profile Photo : " + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return ChangeProfilePicModel.fromJson(data);
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
    await getDioOptions(_dio);
    var response = await _dio!.post(
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
    await getDioOptions(_dio);
    var response = await _dio!.get(
      ApiEndPoints.base_url + ApiEndPoints.claims,
    );
    print("ClaimsResponse" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return ClaimsModel.fromJson(data);
  }

/*................... claim Id api ..........*/
  Future<ClaimsDetails> claimIdDetailsApi({required String claimId}) async {
    await getDioOptions(_dio);
    var response = await _dio!.post(
      ApiEndPoints.base_url + ApiEndPoints.claims + "/$claimId",
    );
    print("ClaimsResponse" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return ClaimsDetails.fromJson(data);
  }

/*................... claim cancel ..........*/
  Future<ClaimIdResponse> claimsCancel({claimId, reason}) async {
    await getDioOptions(_dio);
    var response = await _dio!.post(
      ApiEndPoints.base_url + ApiEndPoints.claimsCancel,
      data: {'reason': reason, 'claimId': claimId},
    );
    print("ClaimsResponse" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return ClaimIdResponse.fromJson(data);
  }

/*................... who received claim list ..........*/
  Future<WhoReceivedModel> whoReceivedData() async {
    await getDioOptions(_dio);
    var response = await _dio!.get(
      ApiEndPoints.base_url + ApiEndPoints.whoReceivedDropdown,
    );
    print("Who received" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return WhoReceivedModel.fromJson(data);
  }

/*................... routes activity list ..........*/
  Future<GetRoutesList> routeAcivityList({userId}) async {
    await getDioOptions(_dio);
    var response = await _dio!.get(
      ApiEndPoints.base_url + ApiEndPoints.routeActivityList + userId,
    );
    print(" Routes" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return GetRoutesList.fromJson(data);
  }

/*................... complete delivery ..........*/
  Future<CommonResponse> completeDelivery(
      {required CompleteClaimAssessment completeClaimAssessment}) async {
    // var formData = FormData();
    // print(completeClaimAssessment.postCompleteDelivery!.toJson());
    print(jsonEncode(completeClaimAssessment.postCompleteDelivery!.toJson()));
    List imageFiles = [];
    for (int i = 0; i < completeClaimAssessment.attachments!.length; i++) {
      imageFiles.add(
        await MultipartFile.fromFile(
          completeClaimAssessment.attachments![i].path,
        ),
      );
    }
   var formData = FormData.fromMap({
      "Attachments": imageFiles,
      "Signature": await MultipartFile.fromFile(
        completeClaimAssessment.signature!.path,
      ),
      "model":
          jsonEncode(completeClaimAssessment.postCompleteDelivery!.toJson())
    });
    await getDioOptions(_dio);
    var response = await _dio!.post(
        ApiEndPoints.base_url + ApiEndPoints.completeDelivery,
        data: formData);
    print("Completed Routes" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return CommonResponse.fromJson(data);
  }

  Future<GetCheckListModel> getCheckList(orderId) async {
    await getDioOptions(_dio);
    var response = await _dio!.get(
      ApiEndPoints.base_url + "claims/$orderId/checklist",
    );
    print("get CheckList" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return GetCheckListModel.fromJson(data);
  }

  Future<void> postCheckList(orderId) async {
    await getDioOptions(_dio);
    var response = await _dio!.post(
      ApiEndPoints.base_url + "claims/$orderId/checklist",
    );
    print("get CheckList" + response.toString());
  }

  Future<void> saveAssessments() async {
    await getDioOptions(_dio);
    var formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        " file.path",
      ),
      "ClaimId": "5655",
      "WhoReceived": "",
      "Name": "",
      "Title": "",
      "ReasonSigned": "",
      "SignedPhone": "",
      "ClaimNotes": "",
    });

    var response = await _dio!
        .post(ApiEndPoints.base_url + ApiEndPoints.assessment, data: formData);
    print("Save assessments CheckList" + response.toString());
  }

  Future<CommonResponse> saveClaimAssessments(
      {required List<XFile> file, userId}) async {
    await getDioOptions(_dio);
    var formData = FormData.fromMap({
      "image": await [
        MultipartFile.fromFile(
          File(file[0].path).path,
        ),
        MultipartFile.fromFile(
          File(file[1].path).path,
        ),
      ],
      "claimId": 5655,
    });

    var response = await _dio!
        .post(ApiEndPoints.base_url + ApiEndPoints.assessment, data: formData);
    print("Save assessments CheckList" + response.toString());

    Map<String, dynamic> data = jsonDecode(response.toString());
    return CommonResponse.fromJson(data);
  }

  Future<void> getDioOptions(_dio) async {
    String authTOKEN;
    SharedPreferenceData.gettoken().then((value) {
      authTOKEN = value;

      if (authTOKEN != null) {
        // print("Authorization $authTOKEN");
        _dio.interceptors.add(InterceptorsWrapper(
          //   onError: (error, errorInterceptorHandler) {
          //   // if (error.message.contains('403')) {}
          // },
          onRequest: (request, requestInterceptorHandler) {
            request.headers["Authorization"] = "Bearer " + authTOKEN;
            // print("onRequest Auth token ${authTOKEN}");
            requestInterceptorHandler.next(request);
            // print("onRequest ------${request.method} | ${request.path}");
          },
          //     onResponse: (response, responseInterceptorHandler) {
          //
          //   responseInterceptorHandler.next(response);
          // }
        ));
      }
    });
  }
}
