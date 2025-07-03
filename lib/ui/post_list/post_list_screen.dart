import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/data/models/post/post.dart';
import 'package:sample_app/routing/routes.dart';
import 'package:sample_app/ui/post/post_screen.dart';
import 'package:sample_app/ui/post/post_view_model.dart';
import 'package:sample_app/ui/post_list/home_view_model.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      body: Center(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            if (viewModel.postList.isEmpty) {
              return const CircularProgressIndicator();
            } else {
              return PostList(viewModel.postList);
            }
          },
        ),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  const PostList(this.postList, {super.key});

  final List<Post> postList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: postList.length,
      itemBuilder: (context, index) {
        return PostItem(postList[index]);
      },
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem(this.item, {super.key});

  final Post item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.headlineMedium;
    return GestureDetector(
      onTap: () => context.go(Routes.postWithId(item.id)),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.title, style: style, maxLines: 1),
                Text(item.body),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

MaterialPageRoute getPostScreen(BuildContext context, int id) {
  return MaterialPageRoute(
    builder: (context) => PostScreen(
      viewModel: PostViewModel(postRepository: context.read(), index: id),
    ),
  );
}
