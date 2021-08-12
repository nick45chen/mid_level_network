import 'package:flutter_test/flutter_test.dart';
import 'package:mid_level_network/mid_level_network.dart';

void main() {
  test('test network', () async {
    final MNetRequest mockRequest = MockRequest();
    final MNetAdapter mockAdapter = MockAdapter();
    MNetResponse response = await mockAdapter.send(mockRequest);
    expect(response.statusCode, 400);
    expect(response.data['data']['message'], 'success');
    expect(response.request.path(), '/api/user/demo');
  });
}

class MockRequest extends MNetRequest {
  @override
  String authority() => 'example.com';

  @override
  HttpMethod httpMethod() => HttpMethod.POST;

  @override
  bool needLogin() => false;

  @override
  String path() => '/api/user/demo';
}

class MockAdapter extends MNetAdapter {
  @override
  Future<MNetResponse> send(MNetRequest request) {
    // 可以根據不同的 request 來 mock 數據
    return Future<MNetResponse>.delayed(Duration(milliseconds: 1000), () {
      Map<String, dynamic> mockJsonDecodeMap = {
        "statusCode": 200,
        "data": {
          "code": 0,
          "message": 'success',
        },
      };
      return MNetResponse(
        data: mockJsonDecodeMap,
        statusCode: 200,
        request: request,
      );
    });
  }
}
