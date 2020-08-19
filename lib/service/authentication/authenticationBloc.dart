import 'dart:async';
import 'package:myFindMovies/service/authentication/authentication_service.dart';

class AuthenticationBloc {
  final AuthenticationService authentication;

  AuthenticationBloc(this.authentication) {
    onAuthChanged();
  }

  final StreamController<String> _authenticationController =
      StreamController<String>();

  Sink<String> get addUser => _authenticationController.sink;
  Stream<String> get user => _authenticationController.stream;

  final StreamController<bool> _logoutController = StreamController<bool>();
  Sink<bool> get logoutUser => _logoutController.sink;
  Stream<bool> get listLogoutUser => _logoutController.stream;

  void dispose() {
    _authenticationController.close();
    _logoutController.close();
  }

  void onAuthChanged() {
    authentication.getFirebaseAuth().authStateChanges().listen((user) {
      final String uid = user != null ? user.uid : null;
      addUser.add(uid);
    });
    _logoutController.stream.listen((logout) {
      if (logout == true) {
        _signOut();
      }
    });
  }

  void _signOut() {
    authentication.signOut();
  }
}
