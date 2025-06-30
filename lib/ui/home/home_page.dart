import 'package:flutter/material.dart';
import 'package:sample_app/data/models/post/post.dart';
import 'package:sample_app/ui/post_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.viewModel});
  final PostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Center(
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
    return Card(
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
    );
  }
}
