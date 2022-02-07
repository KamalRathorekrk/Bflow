import 'dart:async';

import 'package:bflow/app/bottom_nav_bar/bottom_navigation_pages.dart';
import 'package:bflow/app/claim_assessment/models/post_complete_delivery.dart';
import 'package:bflow/app/claim_assessment/models/who_received_model.dart';
import 'package:bflow/app/common_widget/snackbar/utils.dart';
import 'package:bflow/network/api_repository.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ClaimAssementsBloc {
  final progressController = BehaviorSubject<bool>();

  Stream<bool> get progressStream => progressController.stream;

  StreamSink<bool> get progressSink => progressController.sink;

  final whoReceviedController = BehaviorSubject<List<ReceiverData>>();

  Stream<List<ReceiverData>> get whoReceviedStream =>
      whoReceviedController.stream;

  StreamSink<List<ReceiverData>> get whoReceviedSink =>
      whoReceviedController.sink;

  ApiRepository apiRepository = ApiRepository();

  void claimCancel({claimId, reason, context}) {
    progressSink.add(true);
    apiRepository
        .claimsCancel(claimId: claimId, reason: reason)
        .then((onResponse) {
      progressSink.add(false);
      if (onResponse.responseType == 'Ok') {
        SnackBarUtils.showSuccessSnackBar(
            onResponse.responseMessage ?? "", context);
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) => BottomNavigationPage()));
        // Navigator.push(context,
        //     CupertinoPageRoute(builder: (context) => DetailsCancelation()));
      } else {
        SnackBarUtils.showSuccessSnackBar(
            onResponse.responseMessage ?? "", context);
      }
    }).catchError((onError) {
      progressSink.add(false);
      SnackBarUtils.showErrorSnackBar(AppStrings.something_went_wrong, context);
    });
  }

  Future<void> whoReceived({required BuildContext context}) async {
    apiRepository.whoReceivedData().then((onResponse) {
      if (onResponse.responseType == 'Ok') {
        whoReceviedSink.add(onResponse.receiverData!);
      }
    }).catchError((onError) {
      progressSink.add(false);
      SnackBarUtils.showErrorSnackBar(AppStrings.something_went_wrong, context);
    });
  }

  completeDelivery(
      {required CompleteClaimAssessment completeClaimAssessment, context}) {
    progressSink.add(true);
    apiRepository
        .completeDelivery(completeClaimAssessment: completeClaimAssessment)
        .then((onResponse) {
      progressSink.add(false);
      if (onResponse.responseType == 'Ok') {
        SnackBarUtils.showSuccessSnackBar(
            onResponse.responseMessage ?? "", context);
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) => BottomNavigationPage()));
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
