abstract final class Routes {
  static const home = '/';
  static const post = 'post/';
  static const postId = 'postId';
  static const postPath = '$post:$postId';
  static String postWithId(int id) => '/$post$id';
}
