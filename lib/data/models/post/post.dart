import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  Post(this.userId, this.id, this.title, this.body);
  int userId;
  int id;
  String title;
  String body;
  bool isSaved = false;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  Map<String, Object?> toMap() {
    return {'id': id, 'userId': userId, 'title': title, 'body': body};
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    Post post = Post(map['userId'], map['id'], map['title'], map['body']);
    post.isSaved = true;
    return post;
  }

  @override
  String toString() {
    return 'Post{id: $id, title: $title, body: $body}';
  }
}
