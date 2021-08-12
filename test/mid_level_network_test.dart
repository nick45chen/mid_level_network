import 'package:flutter_test/flutter_test.dart';

import 'package:mid_level_network/mid_level_network.dart';

void main() {
  // test('adds one to input values', () {
  //   final calculator = Calculator();
  //   expect(calculator.addOne(2), 3);
  //   expect(calculator.addOne(-7), -6);
  //   expect(calculator.addOne(0), 1);
  // });
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
