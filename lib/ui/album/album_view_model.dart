import 'package:flutter/material.dart';
import 'package:sample_app/data/models/album/album.dart';
import 'package:sample_app/data/repositories/album_repository.dart';
import 'package:sample_app/utils/results.dart';

class AlbumViewModel extends ChangeNotifier {
  AlbumViewModel({required AlbumRepository albumRepository})
    : _albumRepository = albumRepository {
    getAlbumList();
  }
  final AlbumRepository _albumRepository;

  List<Album> _albumList = [];
  List<Album> get albumList => _albumList;

  Future<void> getAlbumList() async {
    final result = await _albumRepository.getAlbumList();
    switch (result) {
      case Ok():
        {
          _albumList = result.value;
        }
      case Error():
        {}
    }
    notifyListeners();
  }
}
