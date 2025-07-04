import 'package:flutter/material.dart';
import 'package:sample_app/data/models/post/post.dart';
import 'package:sample_app/data/repositories/post_repository.dart';

class SavedPostViewModel extends ChangeNotifier {
  SavedPostViewModel({required PostRepository postRepository})
    : _postRepository = postRepository {
    getPosts();
  }

  final PostRepository _postRepository;
  List<Post> _postList = [];
  List<Post> get postList => _postList;

  Future<void> getPosts() async {
    _postList = await _postRepository.getSavedPosts();
    notifyListeners();
  }
}
