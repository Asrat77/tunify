class User {
  int userId;
  String username;
  String email;
  String password;
  String profile_picture_url;

  User(
    {required this.userId,
    required this.username,
    required this.email,
    required this.password,
    required this.profile_picture_url}
      );
}