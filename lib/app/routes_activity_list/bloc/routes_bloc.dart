import 'dart:async';

import 'package:bflow/app/common_widget/snackbar/utils.dart';
import 'package:bflow/app/routes_activity_list/model/get_routes_list.dart';
import 'package:bflow/network/api_repository.dart';
import 'package:bflow/utils/AppStrings.dart';
import 'package:rxdart/rxdart.dart';

class RoutesBloc {
  ApiRepository _apiRepository = ApiRepository();
  final progressController = BehaviorSubject<bool>();

  Stream<bool> get progressStream => progressController.stream;

  StreamSink<bool> get progressSink => progressController.sink;

  final routesListController = BehaviorSubject<List<ResponseRoutes>>();

  Stream<List<ResponseRoutes>> get routesListStream =>
      routesListController.stream;

  StreamSink<List<ResponseRoutes>> get routesListSink =>
      routesListController.sink;

  getCompletedRoutes({context}) {

    progressSink.add(true);

    _apiRepository
        .routeAcivityList()
        .then((onResponse) {
      progressSink.add(false);
      if (onResponse.responseType == "Ok") {
        routesListSink.add(onResponse.responseRoutes!);
      } else {
        SnackBarUtils.showErrorSnackBar(
            onResponse.responseMessage.toString(), context);
      }
    }).catchError((onError) {
      progressSink.add(false);
      print(onError);
      SnackBarUtils.showErrorSnackBar(AppStrings.something_went_wrong, context);
    });
  }
}
