import 'dart:async';

import 'package:bflow/app/pre_delivery/model/claim_id_response.dart';
import 'package:bflow/app/pre_delivery/model/pre_claims_model.dart';
import 'package:bflow/app/common/claims_details.dart';
import 'package:bflow/network/api_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class PreDeliveryBloc {
  ApiRepository apiRepository = ApiRepository();

  final progressController = BehaviorSubject<bool>();

  Stream<bool> get progressStream => progressController.stream;

  StreamSink<bool> get progressSink => progressController.sink;

  final claimDetailsController = BehaviorSubject<ClaimDetailData>();

  Stream<ClaimDetailData> get claimDetailsStream =>
      claimDetailsController.stream;

  StreamSink<ClaimDetailData> get claimDetailsSink =>
      claimDetailsController.sink;
  final claimsController = BehaviorSubject<List<ClaimDetails>>();

  Stream<List<ClaimDetails>> get claimsStream => claimsController.stream;

  StreamSink<List<ClaimDetails>> get claimsSink => claimsController.sink;

  void getClaimDetails(
      {required BuildContext context, required String claimID}) {
    progressSink.add(true);
    apiRepository.claimIdDetailsApi(claimId: claimID).then((onResponse) {
      if (onResponse.responseType == "Ok") {
        claimDetailsSink.add(onResponse.claimDetailData!);
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

  void getClaims({
    required String userName,
    required String fullName,
    required String corporateId,
    required String userId,
    required String emailAddress,
    required BuildContext context}) {
    progressSink.add(true);
    apiRepository.claimPreApi(userId: userId,
        fullName: fullName,
        userName: userName,
        corporateId: corporateId,
        emailAddress: emailAddress).then((onResponse) {
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
}
