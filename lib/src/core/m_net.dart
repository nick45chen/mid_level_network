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

  Future fire(MNetRequest request) async {
    MNetResponse? response;
    var error;
    try {
      response = await _send(request);
    } on MNetError catch (e) {
      error = e;
      response = e.data;
      _printLog('HiNetError: ${e.message}');
    } catch (e) {
      // 其他異常
      error = e;
      _printLog('其他異常: $e');
    }

    if (response == null) {
      _printLog('response empty: $error');
    }

    var result = response?.data;
    _printLog('result: $result');

    final statusCode = response?.statusCode ?? -1;
    switch (statusCode) {
      case 200:
        return result;
      case 401:
        throw NeedLoginError();
      case 403:
        throw NeedAuthError(
          result.toString(),
          data: result,
        );
      default:
        throw MNetError(
          code: statusCode,
          message: result.toString(),
          data: result,
        );
    }
  }

  Future<dynamic> _send<T>(MNetRequest request) async {
    _printLog('${request.httpMethod()} url: ${request.url()}');
    // 使用 mock 發送請求數據
    //HiNetAdapter adapter = MockAdapter();

    // 使用 dio 發送請求
    //HiNetAdapter adapter = DioAdapter();

    /// todo: HttpAdapter 有問題，以後再處理
    // 使用 http 發送請求
    //HiNetAdapter adapter = HttpAdapter();
    //return adapter.send(request);

    /// todo: return adapter
  }

  void _printLog(dynamic message) {
    print('🤖 MNet: $message');
  }
}
