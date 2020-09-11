import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:myFindMovies/service/authentication/authentification_abstract.dart';

class AuthMock implements Authentication {
  final _firebaseAuth = MockFirebaseAuth();

  MockFirebaseAuth getFirebaseAuth() {
    return _firebaseAuth;
  }

  Future<String> currentUserUid() async {
    var user = "test";
    return user;
  }

  Future<void> signOut() async {}

  Future<String> signInWithEmailAndPassword(
      {String email, String password}) async {
    return "test@gmail.com";
  }

  Future<String> createUserWithEmailAndPassword(
      {String email, String password}) async {
    return "credential";
  }

  Future<void> sendEmailVerification() async {}

  Future<bool> isEmailVerified() async {}

  Future<void> resetPassword(String email) async {}
}
