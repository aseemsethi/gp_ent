import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';
import 'fireDB.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // auth change user stream
  bool get isSignedIn => _auth.currentUser != null;
  Stream<User?> authStateChange() => _auth.authStateChanges();

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // FirebaseAuth.instance.currentUser
      print("auth pass: ${result.user}");
      return result.user;
    } catch (error) {
      print("auth fail: ${error.toString()}");
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      print("registerWithEmailAndPassword");
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // TBD: need to remove this
      await DatabaseService(uid: result.user!.uid).initializeUserData(
          result.user!.email.toString(), result.user!.uid, {});
      print("registred user: $result");
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
