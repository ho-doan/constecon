import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_client.dart';
import 'api_interceptors.dart';

class ApiUtil {
  ApiUtil();
  static Dio initApiService({String? apiEndpoint}) {
    final dio = Dio();
    if (apiEndpoint != null) {
      dio.options.baseUrl = apiEndpoint;
    }
    dio.interceptors.add(ApiInterceptors(dio: dio));
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.headers['Content-Type'] = 'application/json';

    dio.options.headers['Accept'] = 'text/json';
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));

    return dio;
  }

  static ApiClient getApiClient() {
    final apiClient = ApiClient(initApiService());
    return apiClient;
  }
}
