import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sample_app/data/models/post/post.dart';
import 'package:sqflite/sqflite.dart';

class DBService {
  // const DBService({required this.db});
  // final Database db;

  Future<void> insertPost(Post post) async {
    final db = await initDB();
    await db.insert(
      'posts',
      post.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

Future<Database> initDB() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'post_db.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE posts(id INTEGER PRIMARY KEY, userId INTEGER, title TEXT, body TEXT)',
      );
    },
    version: 1,
  );
  return database;
}
