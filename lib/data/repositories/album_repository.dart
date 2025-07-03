import 'package:sample_app/data/api_client.dart';
import 'package:sample_app/data/models/album/album.dart';
import 'package:sample_app/utils/results.dart';

class AlbumRepository {
  AlbumRepository({required ApiClient apiClient}) : _apiClient = apiClient;
  final ApiClient _apiClient;

  Future<Result<List<Album>>> getAlbumList() async {
    final result = await _apiClient.getAlbumList();
    return result;
  }

  // Future<Result<Album>> getPost(int index) async {
  //   final result = await _apiClient.getAlbum(index);
  //   return result;
  // }
}
