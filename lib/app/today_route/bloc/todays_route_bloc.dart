import 'dart:async';

import 'package:bflow/app/pre_delivery/model/claim_id_response.dart';
import 'package:bflow/app/today_route/model/claims_model.dart';
import 'package:bflow/network/api_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class TodaysRouteBloc {
  ApiRepository apiRepository = ApiRepository();
  //
  final progressController = BehaviorSubject<bool>();

  Stream<bool> get progressStream => progressController.stream;

  StreamSink<bool> get progressSink => progressController.sink;
  //
  // final claimDetailsController = BehaviorSubject<ResponseObject>();
  //
  // Stream<ResponseObject> get claimDetailsStream =>
  //     claimDetailsController.stream;
  //
  // StreamSink<ResponseObject> get claimDetailsSink =>
  //     claimDetailsController.sink;
  //
  // final claimsController = BehaviorSubject<List<ClaimDetailsList>>();
  //
  // Stream<List<ClaimDetailsList>> get claimsStream => claimsController.stream;
  //
  // StreamSink<List<ClaimDetailsList>> get claimsSink => claimsController.sink;
  //
  // void getClaimDetails(
  //     {required BuildContext context, required String claimID}) {
  //   progressSink.add(true);
  //   apiRepository.claimIdDetailsApi(claimId: claimID).then((onResponse) {
  //     if (onResponse.responseType == "Ok") {
  //       claimDetailsSink.add(onResponse.responseObject!);
  //     } else {
  //       // Utils.showErrorSnackBar(
  //       //     message: onResponse.message.toString(), context: context);
  //     }
  //     progressSink.add(false);
  //   }).catchError((onError) {
  //     progressSink.add(false);
  //     print("On_Error" + onError.toString());
  //     // Utils.showErrorSnackBar(message: onError.toString(), context: context);
  //   });
  // }
  //
  // void getClaims({required BuildContext context}) {
  //   progressSink.add(true);
  //   apiRepository.claimApi().then((onResponse) {
  //     if (onResponse.responseType == "Ok") {
  //       claimsSink.add(onResponse.responseObject!);
  //     } else {
  //       // Utils.showErrorSnackBar(
  //       //     message: onResponse.message.toString(), context: context);
  //     }
  //     progressSink.add(false);
  //   }).catchError((onError) {
  //     progressSink.add(false);
  //     print("On_Error" + onError.toString());
  //     // Utils.showErrorSnackBar(message: onError.toString(), context: context);
  //   });
  // }
}
