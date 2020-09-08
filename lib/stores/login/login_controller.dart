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
  bool isLogin;

  void setEmail(String emailSend) {
    email = emailSend;
  }

    void setPassword(String passwordSend) {
    password = passwordSend;
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

  bool _validEmail() {
    if(email == null) {
        return false;
    } else if (email.contains('@') && email.contains('.')) {
     emailPlaceholder = "Email valid";
     return true;
    } else if (email.length > 0) {
      emailPlaceholder = 'Enter a valid email';
      return false;
    }
  }

  bool _validPassword() {
    if(password == null) {
        return false;
    } else if (password.length >= 6) {
      passwordPlaceholder = "password valid";
      return true;
    } else if (password.length > 0) {
      passwordPlaceholder = 'Password needs to be at least 6 characters';
      return false;
    }
  }
}
