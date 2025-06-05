
import 'package:flutter/foundation.dart';
import 'package:sample_app/data/api_client.dart';
import 'package:sample_app/data/dio.dart';
import 'package:sample_app/data/post.dart';

class PostViewmodel extends ChangeNotifier {

  PostViewmodel({
    required ApiClient apiClient
  }): _apiClient = apiClient {
    getPosts();
  }
  final ApiClient _apiClient; 
  List<Post> _post = [];
  List<Post> get post => _post;
  String text = "view model working?";

  Future<void> getPosts() async {
    _post = await _apiClient.getPosts();
    notifyListeners();
  }
}
