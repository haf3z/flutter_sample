import 'package:flutter/material.dart';
import 'package:sample_app/data/models/post/post.dart';
import 'package:sample_app/ui/home/home_page.dart';
import 'package:sample_app/ui/post_view_model.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key, required this.viewModel});
  final PostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          if (viewModel.post != null) {
            return PostItem(viewModel.post!);
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class PostDetails extends StatelessWidget {
  const PostDetails(this.item, {super.key});

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
              Text(item.title, style: style),
              Text(item.body),
            ],
          ),
        ),
      ),
    );
  }
}
