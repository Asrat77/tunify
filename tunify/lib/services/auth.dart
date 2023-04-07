import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:tunify/data/models/user.dart';

class Auth {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _fireBaseUser(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(
        userId: user.uid,
        username: user.displayName,
        email: user.email,
        password: user.email,
        profile_picture_url: user.photoURL);
  }

  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map(_fireBaseUser);
  }

  Future<User?> handleSignUp(String email, String password) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return _fireBaseUser(result.user);
  }

  Future<void> logout() async {
    return await _firebaseAuth.signOut();
  }
}
