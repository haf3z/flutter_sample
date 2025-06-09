import 'package:sample_app/data/api_client.dart';
import 'package:sample_app/data/models/post/post.dart';
import 'package:sample_app/utils/results.dart';

class PostRepository {
  PostRepository({required ApiClient apiClient}) : _apiClient = apiClient;
  final ApiClient _apiClient;

  Future<Result<List<Post>>> getPosts() async {
    final result = await _apiClient.getPosts();
    return result;
  }

  Future<Result<Post>> getPost() async {
    final result = await _apiClient.getPost(2);
    return result;
  }
}
