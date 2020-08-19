import 'package:firebase_auth/firebase_auth.dart';
import 'package:myFindMovies/service/authentication/authentification_abstract.dart';

class AuthenticationService implements Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseAuth getFirebaseAuth() {
    return _firebaseAuth;
  }

  Future<String> currentUserUid() async {
    var user = _firebaseAuth.currentUser;
    return user.uid;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<String> signInWithEmailAndPassword(
      {String email, String password}) async {
    var user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.credential.providerId;
  }

  Future<String> createUserWithEmailAndPassword(
      {String email, String password}) async {
    var user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.credential.providerId;
  }

  Future<void> sendEmailVerification() async {
    var user = _firebaseAuth.currentUser;
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    var user = _firebaseAuth.currentUser;
    return user.emailVerified;
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
