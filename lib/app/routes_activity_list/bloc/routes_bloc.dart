import 'dart:async';

import 'package:bflow/app/common_widget/snackbar/utils.dart';
import 'package:bflow/app/routes_activity_list/model/routes_model.dart';
import 'package:bflow/network/api_repository.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:rxdart/rxdart.dart';

class RoutesBloc {
  ApiRepository _apiRepository = ApiRepository();
  final progressController = BehaviorSubject<bool>();

  Stream<bool> get progressStream => progressController.stream;

  StreamSink<bool> get progressSink => progressController.sink;

  final routesListController = BehaviorSubject<List<RoutesDetails>>();

  Stream<List<RoutesDetails>> get routesListStream =>
      routesListController.stream;

  StreamSink<List<RoutesDetails>> get routesListSink =>
      routesListController.sink;

  getCompletedRoutes({context}) {
    print(AppStrings.userId);
    progressSink.add(true);

    _apiRepository
        .routeacivitylist(userId: AppStrings.userId)
        .then((onResponse) {
      progressSink.add(false);
      if (onResponse.responseType == "Ok") {
        routesListSink.add(onResponse.responseObject!);
      } else {
        SnackBarUtils.showErrorSnackBar(
            onResponse.responseMessage.toString(), context);
      }
    }).catchError((onError) {
      progressSink.add(false);
      SnackBarUtils.showErrorSnackBar(AppStrings.something_went_wrong, context);
    });
  }
}
