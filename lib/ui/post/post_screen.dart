import 'package:flutter/material.dart';
import 'package:sample_app/data/models/post/post.dart';
import 'package:sample_app/ui/post/post_view_model.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key, required this.viewModel});
  final PostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return Center(
          child: (viewModel.post != null)
              ? PostDetails(viewModel.post!, viewModel)
              : const CircularProgressIndicator(),
        );
      },
    );
  }
}

class PostDetails extends StatelessWidget {
  const PostDetails(this.item, this.viewModel, {super.key});

  final Post item;
  final PostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.headlineMedium;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.toggleSave();
            },
            icon: const Icon(Icons.save_outlined),
            selectedIcon: const Icon(Icons.save),
            isSelected: viewModel.isSaved,
          ),
        ],
      ),
      body: Card(
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
      ),
    );
  }
}
