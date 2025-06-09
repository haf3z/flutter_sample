import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio getDio() {
  final dio = Dio();

  dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
  // dio.options.baseUrl = "https://www.reddit.com.js
  dio.options.headers = {
    'User-Agent':
        'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36',
    'Accept': 'application/json',
  };

  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );

  return dio;
}
