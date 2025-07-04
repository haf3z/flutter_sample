import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sample_app/data/api_client.dart';
import 'package:sample_app/data/dio.dart';
import 'package:sample_app/data/perisistence/app_database.dart';
import 'package:sample_app/data/perisistence/db_service.dart';
import 'package:sample_app/data/repositories/album_repository.dart';
import 'package:sample_app/data/repositories/post_repository.dart';
import 'package:sample_app/ui/post_list/home_view_model.dart';

List<SingleChildWidget> providersList = [
  // network
  Provider(create: (context) => getDio()),
  Provider(create: (context) => ApiClient(dio: context.read())),

  // database
  Provider(create: (context) => AppDatabase()),
  Provider(create: (context) => DBService(context.read())),

  // repositories
  Provider(
    create: (context) =>
        PostRepository(apiClient: context.read(), dbService: context.read()),
  ),
  Provider(create: (context) => AlbumRepository(apiClient: context.read())),

  // viewmodels
  ChangeNotifierProvider(
    create: (context) => HomeViewModel(postRepository: context.read()),
  ),
];
