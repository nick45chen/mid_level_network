part of '../../mid_level_network.dart';

enum HttpMethod {
  GET,
  POST,
  DELETE,
}

/// 基礎請求
abstract class BaseRequest {
  // curl -X GET "http://authority/path?requestParam=11"
  // curl -X GET "https://authority.path/11"

  var useHttps = true;
  var pathParameters;
  Map<String, String> parameters = Map();
  Map<String, String> header = {
    'content-type': 'application/json; charset=utf-8',
  };

  String authority();

  HttpMethod httpMethod();

  String path();

  /// 如果需要登入，可以向 header 添加 token
  bool needLogin();

  String url() {
    Uri uri;
    var pathStr = path();
    // 拼接 path 參數
    if (pathParameters != null) {
      if (path().endsWith('/')) {
        pathStr = '${path()}$pathParameters';
      } else {
        pathStr = '${path()}/$pathParameters';
      }
    }

    // http & https
    if (useHttps) {
      uri = Uri.https(authority(), pathStr, parameters);
    } else {
      uri = Uri.http(authority(), pathStr, parameters);
    }
    return uri.toString();
  }

  /// 添加參數
  BaseRequest addParam(String key, Object v) {
    parameters[key] = v.toString();
    return this;
  }

  /// 添加 header
  BaseRequest addHeader(String key, Object v) {
    header[key] = v.toString();
    return this;
  }
}
