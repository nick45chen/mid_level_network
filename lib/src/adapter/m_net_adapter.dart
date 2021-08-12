part of '../../mid_level_network.dart';

/// 網路請求抽象類
abstract class MNetAdapter {
  Future<MNetResponse> send(MNetRequest request);
}
