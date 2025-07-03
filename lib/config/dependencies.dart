import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sample_app/data/api_client.dart';
import 'package:sample_app/data/dio.dart';
import 'package:sample_app/data/repositories/album_repository.dart';
import 'package:sample_app/data/repositories/post_repository.dart';

List<SingleChildWidget> providersList = [
  Provider(create: (context) => getDio()),
  Provider(create: (context) => ApiClient(dio: context.read())),
  Provider(create: (context) => PostRepository(apiClient: context.read())),
  Provider(create: (context) => AlbumRepository(apiClient: context.read())),
];
