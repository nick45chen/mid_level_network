part of '../../mid_level_network.dart';

/// 統一網路層返回模式
class MNetResponse {
  final Map<String, dynamic> data;
  final MNetRequest request;
  final int statusCode;
  final String? statusMessage;
  final dynamic extra;

  MNetResponse({
    required this.data,
    required this.request,
    required this.statusCode,
    this.statusMessage,
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
