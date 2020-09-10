import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final _authentication = Modular.get<AuthenticationService>();

  @observable
  String email;

  @observable
  String emailPlaceholder;

  @observable
  String password;

  @observable
  String passwordPlaceholder;

  @observable
  String type = "Login"; //default value

  @observable
  bool isLogin;

  @observable
  bool enableButton = false;

  void setEmail(String emailSend) {
    email = emailSend;
    isEnableButton();
  }

  void setPassword(String passwordSend) {
    password = passwordSend;
    isEnableButton();
  }

  void setType(String typeSend) {
    type = typeSend;
  }

  @action
  bool isEnableButton() {
    if (_validEmail() && _validPassword()) {
      enableButton = true;
      return true;
    } else {
      enableButton = false;
      return false;
    }
  }

  Future<String> logIn() async {
    String _result = '';
    if (_validEmail() && _validPassword()) {
      await _authentication
          .signInWithEmailAndPassword(email: email, password: password)
          .then((user) {
        _result = 'Success';
        isLogin = true;
      }).catchError((error) {
        print('Login error: $error');
        _result = 'Email and Password are not valid';
        print(_result);
        isLogin = false;
      });

      return _result;
    } else {
      isLogin = false;
      return 'Email and Password are not valid';
    }
  }

  Future<void> resetPassword(String email) async {
    await _authentication.resetPassword(email);
  }

  Future<String> createAccount() async {
    String _result = '';
    if (_validEmail() && _validPassword()) {
      await _authentication
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        print('Created user: $user');
        _result = 'Created user: $user';
        isLogin = true;
        _authentication
            .signInWithEmailAndPassword(email: email, password: password)
            .then((user) {
          isLogin = true;
        }).catchError((error) async {
          print('Login error: $error');
          isLogin = false;
          _result = error;
        });
      }).catchError((error) async {
        isLogin = false;
        print('Creating user error: $error');
      });
      return _result;
    } else {
      isLogin = false;
      return 'Error creating user';
    }
  }

  bool _validEmail() {
    if (email == null) {
      return false;
    } else if (email.contains('@') && email.contains('.')) {
      emailPlaceholder = "";
      return true;
    } else if (email.length > 0) {
      emailPlaceholder = 'Enter a valid email';
      return false;
    } else {
      return false;
    }
  }

  bool _validPassword() {
    if (password == null) {
      return false;
    } else if (password.length >= 6) {
      passwordPlaceholder = "";
      return true;
    } else if (password.length > 0) {
      passwordPlaceholder = 'Password needs to be at least 6 characters';
      return false;
    } else {
      return false;
    }
  }
}
