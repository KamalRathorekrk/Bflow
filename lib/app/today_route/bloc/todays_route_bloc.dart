import 'dart:async';

import 'package:bflow/app/common/claims_details.dart';
import 'package:bflow/app/today_route/model/claims_model.dart';
import 'package:bflow/network/api_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class TodaysRouteBloc {
  ApiRepository apiRepository = ApiRepository();

  final progressController = BehaviorSubject<bool>();

  Stream<bool> get progressStream => progressController.stream;

  StreamSink<bool> get progressSink => progressController.sink;

  final claimsController = BehaviorSubject<List<ClaimList>>();

  Stream<List<ClaimList>> get claimsStream => claimsController.stream;

  StreamSink<List<ClaimList>> get claimsSink => claimsController.sink;

  final claimDetailController = BehaviorSubject<ClaimDetailData>();

  Stream<ClaimDetailData> get claimDetailStream => claimDetailController.stream;

  StreamSink<ClaimDetailData> get claimDetailSink => claimDetailController.sink;

  void getClaimDetails(
      {required BuildContext context, required String claimID}) {
    progressSink.add(true);
    apiRepository.claimIdDetailsApi(claimId: claimID).then((onResponse) {
      if (onResponse.responseType == "Ok") {
        claimDetailSink.add(onResponse.claimDetailData!);
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

  Future<void> getClaims({required BuildContext context}) async {
    progressSink.add(true);
    apiRepository.claimsApi().then((onResponse) {
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
