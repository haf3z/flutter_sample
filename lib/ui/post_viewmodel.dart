import 'package:flutter/foundation.dart';
import 'package:sample_app/data/models/post/post.dart';
import 'package:sample_app/data/repositories/post_repository.dart';
import 'package:sample_app/utils/results.dart';

class PostViewmodel extends ChangeNotifier {
  PostViewmodel({required PostRepository postRepository})
    : _postRepository = postRepository {
    getPosts();
    getPost();
  }
  final PostRepository _postRepository;
  List<Post> _postList = [];
  List<Post> get postList => _postList;

  Post? _post;
  Post? get post => _post;

  Future<void> getPosts() async {
    final result = await _postRepository.getPosts();
    switch (result) {
      case Ok():
        {
          _postList = result.value;
        }
      case Error():
        {}
    }
    notifyListeners();
  }

  Future<void> getPost() async {
    final result = await _postRepository.getPost();
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
