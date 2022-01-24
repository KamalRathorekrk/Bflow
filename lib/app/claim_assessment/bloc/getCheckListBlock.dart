import 'dart:async';

import 'package:bflow/app/claim_assessment/models/get_check_list_model.dart';
import 'package:bflow/network/api_repository.dart';
import 'package:rxdart/rxdart.dart';

class CheckListBlock{
  ApiRepository _apiRepository=ApiRepository();
  final progressController = BehaviorSubject<bool>();

  Stream<bool> get progressStream => progressController.stream;

  StreamSink<bool> get progressSink => progressController.sink;
  final checkListController = BehaviorSubject<CheckList>();
  Stream<CheckList> get checkListStream => checkListController.stream;

  StreamSink<CheckList> get checkListSink => checkListController.sink;
 getCheckList(orderId){
  progressSink.add(true);
  _apiRepository.getCheckList(orderId).then((onResponse){
    progressSink.add(false);
    checkListSink.add(onResponse.responseObject!);
  });
}


}