import 'package:sample_app/data/models/post/post.dart';
import 'package:sample_app/data/perisistence/app_database.dart';
import 'package:sqflite/sqflite.dart';

class DBService {
  const DBService(this._appDb);
  final AppDatabase _appDb;
  final _postDB = 'posts';

  Future<void> insertPost(Post post) async {
    final db = await _appDb.database;
    await db.insert(
      _postDB,
      post.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Post?>? getPost(int id) async {
    final db = await _appDb.database;
    List<Map<String, dynamic>> maps = await db.query(
      _postDB,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Post.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Post>> getAllPost() async {
    final db = await _appDb.database;
    var list = await db.query(_postDB);
    return list.map((e) => Post.fromMap(e)).toList();
  }

  Future<void> deletePost(int id) async {
    final db = await _appDb.database;
    await db.delete(_postDB, where: 'id = ?', whereArgs: [id]);
  }
}
