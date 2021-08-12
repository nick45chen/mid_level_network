import 'package:mid_level_network/mid_level_network.dart';

import 'platform_request.dart';

class DemoRequest extends PlatformRequest {
  @override
  HttpMethod httpMethod() => HttpMethod.POST;

  @override
  bool needLogin() => false;

  @override
  String path() => '/api/user/demo';
}
