import 'dart:async';

import 'package:bflow/network/api_repository.dart';
import 'package:rxdart/rxdart.dart';

class SettingBlock {
  final progressController = BehaviorSubject<bool>();

  Stream<bool> get progressStream => progressController.stream;

  StreamSink<bool> get progressSink => progressController.sink;

  ApiRepository apiRepository = ApiRepository();

  Future<void> updateProfilePhoto({userId, file})async {
    apiRepository.updateProfile(
      file: file,
      userId: userId,
    );
  }
}
