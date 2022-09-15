import 'dart:async';

import 'package:bflow/app/bottom_nav_bar/bottom_navigation_pages.dart';
import 'package:bflow/app/common_widget/snackbar/utils.dart';
import 'package:bflow/app/pre_delivery/model/CompletePreDelivery.dart';
import 'package:bflow/app/pre_delivery/model/PreDeliveryIdModel.dart';
import 'package:bflow/app/pre_delivery/model/PreDeliveryModel.dart';
import 'package:bflow/app/pre_delivery/model/PreDeliverySaveModel.dart';
import 'package:bflow/app/pre_delivery/model/pre_claims_model.dart';
import 'package:bflow/network/api_repository.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:bflow/utils/CommonCheckListModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class PreDeliveryBloc {
  ApiRepository apiRepository = ApiRepository();

  final progressController = BehaviorSubject<bool>();

  Stream<bool> get progressStream => progressController.stream;

  StreamSink<bool> get progressSink => progressController.sink;

  final preClaimDetailsController = BehaviorSubject<PreDeliveryIdModel>();

  Stream<PreDeliveryIdModel> get preClaimDetailsStream =>
      preClaimDetailsController.stream;

  StreamSink<PreDeliveryIdModel> get preClaimDetailsSink =>
      preClaimDetailsController.sink;

  final claimChecklistController = BehaviorSubject<CheckListObject>();

  Stream<CheckListObject> get claimChecklistStream =>
      claimChecklistController.stream;

  StreamSink<CheckListObject> get claimChecklistSink =>
      claimChecklistController.sink;

  final claimsController = BehaviorSubject<List<ClaimDetails>>();

  Stream<List<ClaimDetails>> get claimsStream => claimsController.stream;

  StreamSink<List<ClaimDetails>> get claimsSink => claimsController.sink;

  final claimsPreController = BehaviorSubject<List<PreDeliveryobject>>();

  Stream<List<PreDeliveryobject>> get claimspreStream =>
      claimsPreController.stream;

  StreamSink<List<PreDeliveryobject>> get claimspreSink =>
      claimsPreController.sink;

  void getPreClaimDetails(
      {required BuildContext context, required String claimID}) {
    progressSink.add(true);
    apiRepository.preClaimIdDetailsApi(claimId: claimID).then((onResponse) {
      if (onResponse.responseType == "Ok") {
        preClaimDetailsSink.add(onResponse);
      } else {
        // Utils.showErrorSnackBar(
        //     message: onResponse.message.toString(), context: context);
      }
      progressSink.add(false);
    }).catchError((onError) {
      progressSink.add(false);
      print("On_Error" + onError.toString());
      // Utils.showErrorSnackBar(message: onError.toString(), context: context);
    });
  }

  void getClaimPreChecklist(
      {required BuildContext context, required String claimID}) {
    progressSink.add(true);
    apiRepository.claimsCheckListApi(claimId: claimID).then((onResponse) {
      if (onResponse.responseType == "Ok") {
        claimChecklistSink.add(onResponse.responseObject!);
      } else {
        // Utils.showErrorSnackBar(
        //     message: onResponse.message.toString(), context: context);
      }
      progressSink.add(false);
    }).catchError((onError) {
      progressSink.add(false);
      print("On_Error" + onError.toString());
      // Utils.showErrorSnackBar(message: onError.toString(), context: context);
    });
  }

  void getClaims(
      {required String userName,
      required String fullName,
      required String corporateId,
      required String userId,
      required String emailAddress,
      required BuildContext context}) {
    progressSink.add(true);
    apiRepository
        .claimPreApi(
            userId: userId,
            fullName: fullName,
            userName: userName,
            corporateId: corporateId,
            emailAddress: emailAddress)
        .then((onResponse) {
      if (onResponse.responseType == "Ok") {
        claimsSink.add(onResponse.responseObject!);
      } else {
        // Utils.showErrorSnackBar(
        //     message: onResponse.message.toString(), context: context);
      }
      progressSink.add(false);
    }).catchError((onError) {
      progressSink.add(false);
      print("On_Error" + onError.toString());
      // Utils.showErrorSnackBar(message: onError.toString(), context: context);
    });
  }

  void getPreClaims() {
    progressSink.add(true);
    apiRepository.claimsPreDeliveryApi().then((onResponse) {
      if (onResponse.responseType == "Ok") {
        claimspreSink.add(onResponse.responseObject!);
      } else {
        // Utils.showErrorSnackBar(
        //     message: onResponse.message.toString(), context: context);
      }
      progressSink.add(false);
    }).catchError((onError) {
      progressSink.add(false);
      print("On_Error" + onError.toString());
      // Utils.showErrorSnackBar(message: onError.toString(), context: context);
    });
  }

  void completePreDelivery(
      {PreDeliverySave? preDeliverySave, context}) {
    progressSink.add(true);
    apiRepository
        .completePreDelivery(preDeliverySave: preDeliverySave)
        .then((onResponse) {
      progressSink.add(false);
      if (onResponse.responseType == 'Ok') {
        SnackBarUtils.showSuccessSnackBar(
            onResponse.responseMessage ?? "", context);
        Navigator.pop(context);
        // Navigator.pushReplacement(context,
        //     CupertinoPageRoute(builder: (context) => BottomNavigationPage()));
      } else {
        SnackBarUtils.showSuccessSnackBar(
            onResponse.responseMessage ?? "", context);
      }
    }).catchError((onError) {
      print(onError);
      progressSink.add(false);
      SnackBarUtils.showErrorSnackBar(AppStrings.something_went_wrong, context);
    });
  }
}
