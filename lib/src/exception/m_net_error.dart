part of '../../mid_level_network.dart';

/// 網路異常統一格式類
class MNetError implements Exception {
  final int code;
  final String message;
  final dynamic data;

  MNetError({
    required this.code,
    required this.message,
    this.data,
  });
}

/// 需要登錄的異常
class NeedLoginError extends MNetError {
  NeedLoginError({
    int code = 401,
    String message = '請先登錄',
  }) : super(code: code, message: message);
}

/// 需要授權的異常
class NeedAuthError extends MNetError {
  NeedAuthError(
    String message, {
    int code = 403,
    dynamic data,
  }) : super(code: code, message: message, data: data);
}
