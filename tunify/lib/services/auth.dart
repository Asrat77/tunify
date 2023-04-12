import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tunify/data/models/user.dart';

class Auth {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _fireBaseUser(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map(_fireBaseUser);
  }

  Future<User?> handleSignUp(String email, String password) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return _fireBaseUser(result.user);
  }

  Future<User?> handleSignInEmail(String email, String password) async {
    //7
    final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    String userToken = await result.user!.getIdToken();
    await saveUserToken(userToken);
    //8
    return _fireBaseUser(result.user);
  }
  //save user token to shared_pref
  Future<void> saveUserToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("userToken", token);
  }
  Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userToken");

  }

  Future<void> logout() async {
    return await _firebaseAuth.signOut();
  }
}
