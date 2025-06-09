import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sample_app/data/models/post/post.dart';
import 'package:sample_app/utils/results.dart';

class ApiClient {
  ApiClient({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<Result<List<Post>>> getPosts() async {
    try {
      final response = await _dio.get("/posts");
      if (response.statusCode == 200) {
        final List<Post> list = (response.data as List)
            .map((element) => Post.fromJson(element))
            .toList();
        return Result.ok(list);
      } else {
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  Future<Result<Post>> getPost(int index) async {
    try {
      final response = await _dio.get("/posts/$index");
      if (response.statusCode == 200) {
        final post = Post.fromJson(response.data);
        return Result.ok(post);
      } else {
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}

