part of '../../mid_level_network.dart';

/// 網路請求抽象類
abstract class MNetAdapter {
  Future<MNetResponse<T>> send<T>(BaseRequest request);
}

/// 統一網路層返回模式
class MNetResponse<T> {
  final T data;
  final BaseRequest request;
  final int statusCode;
  final String statusMessage;
  final dynamic extra;

  MNetResponse({
    required this.data,
    required this.request,
    required this.statusCode,
    required this.statusMessage,
    this.extra,
  });

  @override
  String toString() {
    if (data is Map)
      return json.encode(data);
    else
      return data.toString();
  }
}
