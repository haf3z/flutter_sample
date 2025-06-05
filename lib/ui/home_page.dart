import 'package:flutter/material.dart';
import 'package:sample_app/data/models/post/post.dart';
import 'package:sample_app/ui/post_viewmodel.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.viewmodel});
  final PostViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListenableBuilder(
        listenable: viewmodel, 
        builder: (context, _) {
          if(viewmodel.post.isEmpty) {
            return Text(viewmodel.text);
          }
          else {
            return PostList(viewmodel.post);
          }
        }

      )
    );
  }
  
}



class PostList extends StatelessWidget {
  const PostList
(
  this.post,
  {
  super.key});
  final List<Post> post;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: post.length,
      itemBuilder: (context, index) {
        return PostItem(post[index]);
      },
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem
  (this.item, {super.key});

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
              Text(item.title,
              style: style,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              ),
              Text(item.body),
            ]
          ),
        ),
      ),
    );
  }
}