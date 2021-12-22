import 'dart:async';

import 'package:bflow/app/bottom_nav_bar/bottom_navigation_pages.dart';
import 'package:bflow/app/common_widget/snackbar/utils.dart';
import 'package:bflow/app/login/model/login_model.dart';
import 'package:bflow/app/login/model/validate_response.dart';
import 'package:bflow/app/login/pages/verification_pages.dart';
import 'package:bflow/network/api_repository.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/SharedPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class LoginBlock {
  final progressController = BehaviorSubject<bool>();

  Stream<bool> get progressStream => progressController.stream;

  StreamSink<bool> get progressSink => progressController.sink;

  ApiRepository apiRepository = ApiRepository();

  late LoginModel loginModel;

  Future<void> loginUpApiCall({
    required BuildContext context,
    required String userName,
    required String password,
    required String corporateId,
  }) async {
    progressSink.add(true);
    apiRepository
        .loginApi(
      context: context,
      userName: userName,
      password: password,
      corporateId: corporateId,
    )
        .then((onResponse) {
      progressSink.add(false);
      loginModel = LoginModel(
          userName: userName, corporateId: corporateId, password: password);
      print("onResponse $onResponse");
      if (onResponse.responseMessage != null) {
        SnackBarUtils.showSuccessSnackBar(
            onResponse.responseMessage??"", context);
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => Verification(
                      //authCode: onResponse.authCode.toString(),
                      loginModel: loginModel,
                    )));
      } else {
        SnackBarUtils.showErrorSnackBar(
            AppStrings.something_went_wrong, context);
      }

    }).catchError((onError) {
      progressSink.add(false);
      SnackBarUtils.showErrorSnackBar(AppStrings.something_went_wrong, context);
    });
  }

  Future<void> validateApiCall({
    required BuildContext context,
    required String userName,
    required String password,
    required String corporateId,
    required String authCode,
  }) async {
    apiRepository
        .validateApi(
      context: context,
      userName: userName,
      password: password,
      corporateId: corporateId,
      authCode: authCode,
    )
        .then((onResponse) {
      print("onResponse $onResponse");
      progressSink.add(false);
      if (onResponse != null) {

        setLocalData(validateResponse: onResponse);
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => BottomNavigationPage()));
      } else {
        SnackBarUtils.showErrorSnackBar(
            AppStrings.something_went_wrong, context);
      }
    }).catchError((onError) {
      progressSink.add(false);
      SnackBarUtils.showErrorSnackBar(AppStrings.something_went_wrong, context);
    });
  }

  setLocalData({required ValidateResponse validateResponse}) {
    SharedPreferenceData.setlogin("true").then((value) {
      print(value);
      SharedPreferenceData.getlogin().then((getvalue) {
        AppStrings.islogin = getvalue;
        print(getvalue);
      });
    });
    SharedPreferenceData.settoken(validateResponse.token.toString())
        .then((value) {
      print(value);
      SharedPreferenceData.gettoken().then((getvalue) {
        AppStrings.token = getvalue;
        print(getvalue);
      });
    });
    SharedPreferenceData.setFullName(
            validateResponse.userDetails!.fullName.toString())
        .then((value) {
      print(value);
      SharedPreferenceData.getFullName().then((getvalue) {
        AppStrings.fullname = getvalue;
        print(getvalue);
      });
    });
    SharedPreferenceData.setUserName(
            validateResponse.userDetails!.userName.toString())
        .then((value) {
      print(value);
      SharedPreferenceData.getUserName().then((getvalue) {
        AppStrings.userName = getvalue;
        print(getvalue);
      });
    });
    SharedPreferenceData.setCorporateId(
            validateResponse.userDetails!.corporateId.toString())
        .then((value) {
      print(value);
      SharedPreferenceData.getCorporateId().then((getvalue) {
        AppStrings.corporateId = getvalue;
        print(getvalue);
      });
    });
  }
}
