part of '../../mid_level_network.dart';

/// 測試適配器, mock 數據
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
