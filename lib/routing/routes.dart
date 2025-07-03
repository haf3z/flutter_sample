abstract final class Routes {
  static const home = '/home';
  static const post = 'post/';
  static const postId = 'postId';
  static const postPath = '$post:$postId';
  static String postWithId(int id) => '$home/$post$id';
}
