import 'dart:async';

import 'package:myFindMovies/service/authentication/authentication_service.dart';
import 'package:myFindMovies/service/authentication/validators.dart';
import 'package:myFindMovies/service/traslator.dart';

class LoginBloc with Validators {
  final AuthenticationService authenticationApi;
  String _email;
  String _password;
  bool _emailValid;
  bool _passwordValid;

  LoginBloc(this.authenticationApi) {
    _startListenersIfEmailPasswordAreValid();
  }

  void dispose() {
    _passwordController.close();
    _emailController.close();
    _loginOrCreateErrorController.close();
    _enableLoginCreateButtonController.close();
    _loginOrCreateButtonController.close();
    _loginOrCreateController.close();
  }

  final StreamController<String> _emailController =
      StreamController<String>.broadcast();
  Sink<String> get emailChanged => _emailController.sink;
  Stream<String> get email => _emailController.stream.transform(validateEmail);

  final StreamController<String> _passwordController =
      StreamController<String>.broadcast();
  Sink<String> get passwordChanged => _passwordController.sink;
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  final StreamController<bool> _enableLoginCreateButtonController =
      StreamController<bool>.broadcast();
  Sink<bool> get enableLoginCreateButtonChanged =>
      _enableLoginCreateButtonController.sink;

  Stream<bool> get enableLoginCreateButton =>
      _enableLoginCreateButtonController.stream;
  final StreamController<String> _loginOrCreateButtonController =
      StreamController<String>();

  Sink<String> get loginOrCreateButtonChanged =>
      _loginOrCreateButtonController.sink;
  Stream<String> get loginOrCreateButton =>
      _loginOrCreateButtonController.stream;

  final StreamController<String> _loginOrCreateController =
      StreamController<String>();
  Sink<String> get loginOrCreateChanged => _loginOrCreateController.sink;
  Stream<String> get loginOrCreate => _loginOrCreateController.stream;

  final StreamController<bool> _loginOrCreateErrorController =
      StreamController<bool>();
  Sink<bool> get loginOrCreateErrorChanged =>
      _loginOrCreateErrorController.sink;

  Stream<bool> get loginOrCreateError => _loginOrCreateErrorController.stream;

  void _startListenersIfEmailPasswordAreValid() {
    email.listen((email) {
      _email = email;
      _emailValid = true;
      _updateEnableLoginCreateButtonStream();
    }).onError((error) {
      _email = '';
      _emailValid = false;
      _updateEnableLoginCreateButtonStream();
    });
    password.listen((password) {
      _password = password;
      _passwordValid = true;
      _updateEnableLoginCreateButtonStream();
    }).onError((error) {
      _password = '';
      _passwordValid = false;
      _updateEnableLoginCreateButtonStream();
    });
    loginOrCreate.listen((action) {
      action == 'Login' ? _logIn() : _createAccount();
    });
  }

  void _updateEnableLoginCreateButtonStream() {
    if (_emailValid == true && _passwordValid == true) {
      enableLoginCreateButtonChanged.add(true);
    } else {
      enableLoginCreateButtonChanged.add(false);
    }
  }

  Future<String> _logIn() async {
    String _result = '';
    if (_emailValid && _passwordValid) {
      await authenticationApi
          .signInWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        _result = 'Success';
        loginOrCreateErrorChanged.add(false);
      }).catchError((error) {
        print('Login error: $error');
        _result = 'Email and Password are not valid';
        print(_result);
        loginOrCreateErrorChanged.add(true);
      });

      return _result;
    } else {
      loginOrCreateErrorChanged.add(true);
      return 'Email and Password are not valid';
    }
  }

  Future<String> _createAccount() async {
    String _result = '';
    if (_emailValid && _passwordValid) {
      await authenticationApi
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        print('Created user: $user');
        loginOrCreateErrorChanged.add(false);
        _result = 'Created user: $user';
        authenticationApi
            .signInWithEmailAndPassword(email: _email, password: _password)
            .then((user) {
          loginOrCreateErrorChanged.add(false);
        }).catchError((error) async {
          print('Login error: $error');
          loginOrCreateErrorChanged.add(true);
          _result = error;
        });
      }).catchError((error) async {
        loginOrCreateErrorChanged.add(true);
        print('Creating user error: $error');
      });
      return _result;
    } else {
      loginOrCreateErrorChanged.add(true);
      return 'Error creating user';
    }
  }
}
