import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/data/models/post/post.dart';
import 'package:sample_app/routing/routes.dart';
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
              return PostList(
                viewModel.postList,
                (post) => context.go(Routes.postWithId(post.id)),
              );
            }
          },
        ),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  const PostList(this.postList, this.onTap, {super.key});

  final List<Post> postList;
  final void Function(Post) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: postList.length,
      itemBuilder: (context, index) {
        return PostItem(postList[index], onTap);
      },
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem(this.item, this.onTap, {super.key});

  final Post item;
  final void Function(Post) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.headlineMedium;
    return GestureDetector(
      onTap: () => {onTap(item)},
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${item.id}. ${item.title}", style: style, maxLines: 1),
                SizedBox(height: 8.0),
                Text(item.body),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
