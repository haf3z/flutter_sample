
import 'package:dio/dio.dart';
import 'package:sample_app/data/dio.dart';
import 'package:sample_app/data/post.dart';

class ApiClient {

  ApiClient({
    required Dio dio
  }): _dio = dio;
  
  final Dio _dio;

  Future<List<Post>> getPosts() async {
    final response = await _dio.get("/posts");
    final List<Post> list = (response.data as List)
        .map((element) => Post.fromJson(element))
        .toList();
    return list;
  }
}