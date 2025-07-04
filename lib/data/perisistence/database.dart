import 'package:sample_app/data/models/post/post.dart';
import 'package:sample_app/data/perisistence/app_database.dart';
import 'package:sqflite/sqflite.dart';

class DBService {
  const DBService(this._appDb);
  final AppDatabase _appDb;

  Future<void> insertPost(Post post) async {
    final db = await _appDb.database;
    await db.insert(
      'posts',
      post.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
