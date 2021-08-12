import 'core/platform_net.dart';
import 'request/demo_request.dart';
import 'request/platform_request.dart';

void main(List<String> arguments) async {
  PlatformRequest request = DemoRequest();

  request.addHeader('headerParam01', '')..addHeader('headerParam02', '');

  request.addParam('requestBody01', '')..addParam('requestBody02', '');

  var result = await PlatformNet.getInstance().fire(request);
  print('💻 result: $result');
}
