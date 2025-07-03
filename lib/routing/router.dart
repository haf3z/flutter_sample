import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/main.dart';
import 'package:sample_app/routing/routes.dart';
import 'package:sample_app/ui/album/album_screen.dart';
import 'package:sample_app/ui/album/album_view_model.dart';
import 'package:sample_app/ui/post_list/post_list_screen.dart';
import 'package:sample_app/ui/post_list/home_view_model.dart';
import 'package:sample_app/ui/post/post_screen.dart';
import 'package:sample_app/ui/post/post_view_model.dart';

GoRouter router() => GoRouter(initialLocation: Routes.home, routes: [_home1]);

final _home1 = StatefulShellRoute.indexedStack(
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
    return PostListScreen(
      viewModel: HomeViewModel(postRepository: context.read()),
    );
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
