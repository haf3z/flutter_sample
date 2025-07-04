import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/routing/routes.dart';
import 'package:sample_app/ui/album/album_screen.dart';
import 'package:sample_app/ui/album/album_view_model.dart';
import 'package:sample_app/ui/home/home_screen.dart';
import 'package:sample_app/ui/post_list/post_list_screen.dart';
import 'package:sample_app/ui/post/post_screen.dart';
import 'package:sample_app/ui/post/post_view_model.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
GoRouter router() => GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.home,
  routes: [root],
);

final root = StatefulShellRoute.indexedStack(
  builder:
      (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return HomeScreen(navigationShell: navigationShell);
      },
  branches: [
    StatefulShellBranch(routes: [_home]),
    StatefulShellBranch(routes: [_album]),
  ],
);

GoRoute _home = GoRoute(
  path: Routes.home,
  builder: (context, state) {
    return PostListScreen(viewModel: context.read());
  },
  routes: [_post],
);

GoRoute _post = GoRoute(
  path: Routes.postPath,
  builder: (context, state) {
    final id = int.parse(state.pathParameters[Routes.postId] ?? "1");
    final viewModel = PostViewModel(postRepository: context.read(), index: id);
    return PostScreen(viewModel: viewModel);
  },
);

GoRoute _album = GoRoute(
  path: '/album',
  builder: (context, state) {
    return AlbumScreen(
      viewModel: AlbumViewModel(albumRepository: context.read()),
    );
  },
);
