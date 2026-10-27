import 'package:biztraq_mobile/config/api_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('API_BASE_URL is the compile-time dart-define or the dev default', () {
    const fromEnv = String.fromEnvironment('API_BASE_URL');
    if (fromEnv.isEmpty) {
      expect(ApiConfig.baseUrl, ApiConfig.defaultBaseUrl);
    } else {
      expect(ApiConfig.baseUrl, fromEnv);
    }
  });
}
