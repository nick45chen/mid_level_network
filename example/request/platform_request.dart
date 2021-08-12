import 'package:mid_level_network/mid_level_network.dart';

abstract class PlatformRequest extends MNetRequest {
  @override
  String authority() {
    return 'example.com';
  }

  @override
  String url() {
    /// add access token if need.
    if (needLogin()) {
      addHeader('token', 'token');
    }
    return super.url();
  }
}
