part of '../mid_level_network.dart';

class MidLevelNet {
  MidLevelNet._();

  static late MidLevelNet? _instance;

  static MidLevelNet getInstance() {
    if (_instance == null) {
      _instance = MidLevelNet._();
    }
    return _instance!;
  }
}
