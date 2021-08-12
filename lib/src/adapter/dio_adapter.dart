part of '../../mid_level_network.dart';

/// Dio 適配器
class DioAdapter extends MNetAdapter {
  @override
  Future<MNetResponse> send(MNetRequest request) async {
    var response, options = dioLib.Options(headers: request.header);
    var error;
    try {
      if (request.httpMethod() == HttpMethod.GET) {
        response = await dioLib.Dio().get(
          request.url(),
          options: options,
        );
      } else if (request.httpMethod() == HttpMethod.POST) {
        response = await dioLib.Dio().post(
          request.url(),
          data: request.parameters,
          options: options,
        );
      } else if (request.httpMethod() == HttpMethod.DELETE) {
        response = await dioLib.Dio().post(
          request.url(),
          data: request.parameters,
          options: options,
        );
      }
    } on dioLib.DioError catch (e) {
      error = e;
      response = e.response;
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

  /// 構建 HiNetResponse
  MNetResponse _buildResponse(dioLib.Response response, MNetRequest request) {
    return MNetResponse(
      data: response.data,
      request: request,
      statusCode: response.statusCode ?? -9999,
      statusMessage: response.statusMessage,
      extra: response,
    );
  }
}
