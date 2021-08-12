part of '../../mid_level_network.dart';

class HttpAdapter extends MNetAdapter {
  @override
  Future<MNetResponse> send(MNetRequest request) async {
    var response, options = request.header;
    var error;
    try {
      if (request.httpMethod() == HttpMethod.GET) {
        response = await httpLib.get(
          Uri.parse(request.url()),
          headers: options,
        );
      } else if (request.httpMethod() == HttpMethod.POST) {
        response = await httpLib.post(
          Uri.parse(request.url()),
          headers: options,
          body: request.parameters,
        );
      } else if (request.httpMethod() == HttpMethod.DELETE) {
        response = await httpLib.delete(
          Uri.parse(request.url()),
          headers: options,
        );
      }
    } catch (e) {
      _printLog('發送網路請求錯誤: $e');
      error = e;
      response = response;
    }

    if (error != null) {
      throw MNetError(
        code: response?.statusCode ?? -1,
        message: error.toString(),
        data: _buildResponse(response, request),
      );
    }
    return _buildResponse(response, request);
  }

  /// 構建 MNetResponse
  MNetResponse _buildResponse(Response response, MNetRequest request) {
    /// 先將 String 類型數據 json 編碼為 Map 數據
    Map<String, dynamic> responseData = jsonDecode(response.body);
    return MNetResponse(
      data: responseData,
      request: request,
      statusCode: response.statusCode,
      statusMessage: response.reasonPhrase,
      extra: response,
    );
  }

  void _printLog(dynamic msg) {
    print('🎁 http: $msg');
  }
}
