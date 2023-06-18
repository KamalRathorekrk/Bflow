import 'dart:async';
import 'dart:io';

import 'package:bflow/app/common_widget/snackbar/utils.dart';
import 'package:bflow/network/api_repository.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/SharedPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class SettingBlock {
  final progressController = BehaviorSubject<bool>();

  Stream<bool> get progressStream => progressController.stream;

  StreamSink<bool> get progressSink => progressController.sink;
  final fetchProfileSink = BehaviorSubject<String>();

  Stream<String> get fetchProfileStream => fetchProfileSink.stream;

  ApiRepository apiRepository = ApiRepository();

  Future<void> updateProfilePhoto(
      {required int userId, required File file}) async {
    await apiRepository
        .updateProfile(
      file: file,
      userId: userId,
    )
        .then((onResponse) {
      if (onResponse.responseType == "Ok") {
        getProfilePic();
      }
      print(onResponse.responseMessage);
    }).catchError((onError) {
      print("On_Error " + onError.toString());
    });
  }

  Future<void> changePassword(
      {context, confirmPassword, currentPassword, newPassword}) async {
    progressSink.add(true);
    apiRepository
        .changePassword(
            confirmPassword: confirmPassword,
            currentPassword: currentPassword,
            newPassword: newPassword)
        .then((onResponse) {
      progressSink.add(false);
      if (onResponse.responseType == "Ok") {
        SnackBarUtils.showSuccessSnackBar(
            onResponse.responseMessage.toString(), context);
        Navigator.of(context).pop();
      } else {
        SnackBarUtils.showErrorSnackBar(
            onResponse.responseMessage.toString(), context);
      }
    }).catchError((onError) {
      progressSink.add(false);
      SnackBarUtils.showErrorSnackBar(AppStrings.something_went_wrong, context);
      print("On_Error " + onError.toString());
    });
  }

  Future<void> getProfilePic() async {
    progressSink.add(true);
    apiRepository.getProfileImage().then((onResponse) {
      progressSink.add(false);
      if (onResponse.responseType == "Ok") {
        SharedPreferenceData.setProfileImageUrl(
                onResponse.responseObject!.imgUrl.toString())
            .then((value) {
          SharedPreferenceData.getProfileImageUrl().then((getvalue) {
            AppStrings.imageUrl = getvalue;
            fetchProfileSink.add(getvalue);
            print(getvalue);
          });
        });

        // SnackBarUtils.showSuccessSnackBar(onResponse.responseMessage.toString(), context);
        // Navigator.of(context).pop();
      } else {
        // SnackBarUtils.showErrorSnackBar(onResponse.responseMessage.toString(), context);
      }
    }).catchError((onError) {
      progressSink.add(false);
      // SnackBarUtils.showErrorSnackBar(AppStrings.something_went_wrong, context);
      // print("On_Error " + onError.toString());
    });
  }
}
