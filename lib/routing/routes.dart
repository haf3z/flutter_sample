abstract final class Routes {
  static const home = '/home';
  static const post = 'post/';
  static const postId = 'postId';
  static const savedPosts = '/saved_posts';
  static const postPath = '$post:$postId';
  static String postWithId(int id) => '$home/$post$id';
  static String savedPostWithId(int id) => '$savedPosts/$post$id';
}
