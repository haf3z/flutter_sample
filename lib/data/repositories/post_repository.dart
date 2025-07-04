import 'package:sample_app/data/api_client.dart';
import 'package:sample_app/data/models/post/post.dart';
import 'package:sample_app/data/perisistence/database.dart';
import 'package:sample_app/utils/results.dart';

class PostRepository {
  PostRepository({required ApiClient apiClient, required DBService dbService})
    : _apiClient = apiClient,
      _dbService = dbService;
  final ApiClient _apiClient;
  final DBService _dbService;

  Future<Result<List<Post>>> getPosts() async {
    final result = await _apiClient.getPosts();
    return result;
  }

  Future<Result<Post>> getPost(int index) async {
    final result = await _apiClient.getPost(index);
    return result;
  }

  Future<void> savePost(Post post) async {
    _dbService.insertPost(post);
  }
}
