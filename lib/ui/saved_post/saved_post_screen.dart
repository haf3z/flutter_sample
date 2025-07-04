import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/routing/routes.dart';
import 'package:sample_app/ui/post_list/post_list_screen.dart';
import 'package:sample_app/ui/saved_post/saved_post_view_model.dart';

class SavedPostScreen extends StatelessWidget {
  const SavedPostScreen({super.key, required this.viewModel});

  final SavedPostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Saved Posts")),
      body: Center(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            if (viewModel.postList.isEmpty) {
              return const CircularProgressIndicator();
            } else {
              return PostList(
                viewModel.postList,
                (post) => context.go(Routes.savedPostWithId(post.id)),
              );
            }
          },
        ),
      ),
    );
  }
}
