import 'package:flutter/foundation.dart';
import 'package:sample_app/data/models/post/post.dart';
import 'package:sample_app/data/repositories/post_repository.dart';
import 'package:sample_app/utils/results.dart';

class PostViewModel extends ChangeNotifier {
  PostViewModel({required PostRepository postRepository, required int index})
    : _postRepository = postRepository,
      _index = index {
    getPost();
  }
  final PostRepository _postRepository;
  final int _index;

  Post? _post;
  Post? get post => _post;
  bool isSaved = false;

  Future<void> getPost() async {
    final result = await _postRepository.getPost(_index);
    switch (result) {
      case Ok():
        {
          _post = result.value;
          isSaved = _post!.isSaved;
        }
      case Error():
        {}
    }
    notifyListeners();
  }

  void toggleSave() {
    isSaved = !isSaved;
    if (isSaved) {
      _postRepository.savePost(_post!);
    } else {
      _postRepository.deletePost(post!.id);
    }
    notifyListeners();
  }
}
