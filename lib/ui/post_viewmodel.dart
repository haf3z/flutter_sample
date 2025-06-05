import 'package:flutter/foundation.dart';
import 'package:sample_app/data/api_client.dart';
import 'package:sample_app/data/models/post/post.dart';
import 'package:sample_app/utils/results.dart';

class PostViewmodel extends ChangeNotifier {
  PostViewmodel({required ApiClient apiClient}) : _apiClient = apiClient {
    getPosts();
  }
  final ApiClient _apiClient;
  List<Post> _post = [];
  List<Post> get post => _post;
  String text = "loading...";

  Future<void> getPosts() async {
    final result = await _apiClient.getPosts();
    switch (result) {
      case Ok():
        {
          _post = result.value;
        }
      case Error():
        {}
    }
    notifyListeners();
  }
}
