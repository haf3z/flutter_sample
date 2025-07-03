import 'package:flutter/material.dart';
import 'package:sample_app/data/models/album/album.dart';
import 'package:sample_app/ui/album/album_view_model.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key, required this.viewModel});
  final AlbumViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Albums")),
      body: Center(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            if (viewModel.albumList.isEmpty) {
              return const CircularProgressIndicator();
            } else {
              return AlbumList(viewModel.albumList);
            }
          },
        ),
      ),
    );
  }
}

class AlbumList extends StatelessWidget {
  const AlbumList(this.albumList, {super.key});
  final List<Album> albumList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: albumList.length,
      itemBuilder: (context, index) {
        return AlbumItem(albumList[index]);
      },
    );
  }
}

class AlbumItem extends StatelessWidget {
  const AlbumItem(this.item, {super.key});
  final Album item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.headlineMedium;
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(item.title, style: style)],
          ),
        ),
      ),
    );
  }
}
