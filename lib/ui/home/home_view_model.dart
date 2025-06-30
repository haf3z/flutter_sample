import 'package:flutter/material.dart';
import 'package:sample_app/data/models/post/post.dart';
import 'package:sample_app/data/repositories/post_repository.dart';
import 'package:sample_app/utils/results.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required PostRepository postRepository})
    : _postRepository = postRepository {
    getPosts();
  }

  final PostRepository _postRepository;
  List<Post> _postList = [];
  List<Post> get postList => _postList;

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
}
