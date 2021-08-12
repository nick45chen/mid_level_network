part of '../../mid_level_network.dart';

class MNet {
  MNet._();

  static late MNet? _instance;

  static MNet getInstance() {
    if (_instance == null) {
      _instance = MNet._();
    }
    return _instance!;
  }
}
