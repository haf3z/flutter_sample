import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sample_app/data/models/post/post.dart';

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

// Future<List<Post>> getHttp() async {
//   final response = await dio.get("/posts");
//   // print(response);
//   // final stringData = response.data.toString();
//   final List<Post> list = (response.data as List)
//       .map((element) => Post.fromJson(element))
//       .toList();
//   return list;
// }
