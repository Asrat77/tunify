// class User {
//   String userId;
//   String? username;
//   String? email;
//   String? password;
//   String? profile_picture_url;

//   User(
//        this.username,
//        this.password,
//        this.profile_picture_url,
//       {required String this.userId, required String this.email});
// }

class User {
  final String uid;
  final String? email;
  String _token="";

  User(this.uid, this.email);

  set token(String token){
    this._token=token;
  }

}
