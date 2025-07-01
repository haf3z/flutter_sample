import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/routing/routes.dart';
import 'package:sample_app/ui/home/home_page.dart';
import 'package:sample_app/ui/home/home_view_model.dart';
import 'package:sample_app/ui/post/post_screen.dart';
import 'package:sample_app/ui/post_view_model.dart';

GoRouter router() =>
    GoRouter(initialLocation: Routes.home, routes: [_home]);

GoRoute _home = GoRoute(
  path: Routes.home,
  builder: (context, state) {
    return HomePage(viewModel: HomeViewModel(postRepository: context.read()));
  },
  routes: [_post]
);

GoRoute _post = GoRoute(
  path: Routes.postPath,
  builder: (context, state) {
    final id = int.parse(state.pathParameters[Routes.postId] ?? "1");
    final viewModel = PostViewModel(postRepository: context.read(), index: id);
    return PostScreen(viewModel: viewModel);
  },
);
