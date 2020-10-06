import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:myFindMovies/service/authentication/authentification_abstract.dart';
import 'package:myFindMovies/service/translator/languages.dart';
import 'package:myFindMovies/service/translator/translator.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final Authentication _authentication = Modular.get();
  final _translator = Modular.get<Translator>();
  String _placeholder;
  String _placeholderPassword;

  _LoginControllerBase() {
    _getTranslator();
  }

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

  @observable
  String passwordWord = "Password";
  @observable
  String cancelButton = "Cancel";
  @observable
  String errorLoginMessage = "Error with login: Password or email invalid";
  @observable
  String resetPasswordMessage =
      "To reset password, please type your email and follow instruction sent to email";

  @observable
  String resetPasswordTitle = "Reset password";
  @observable
  String createAccountText = "Create Account";

  @observable
  String sendButton = "Send";
  @observable
  String sendButtonOk = "Email sent";

  @observable
  String errorSendReset = "Email not send try again";

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
      emailPlaceholder = _placeholder;
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
      passwordPlaceholder = _placeholderPassword;
      return false;
    } else {
      return false;
    }
  }

  void _getTranslator() async {
    var result = await _translator.getLanguage();

    if (result == Languages.english) {
      passwordWord = "Password";
      cancelButton = "Cancel";
      errorLoginMessage = "Error with login: Password or email invalid";
      resetPasswordMessage =
          "To reset password, please type your email and follow instruction sent to email";
      resetPasswordTitle = "Reset password";
      createAccountText = "Create Account";
      sendButton = "Send";
      sendButtonOk = "Email sent";
      errorSendReset = "Email not send try again";
      _placeholder = "Enter a valid email";
      _placeholderPassword = 'Password needs to be at least 6 characters';
    } else if (result == Languages.portuguese) {
      passwordWord = "Senha";
      errorLoginMessage = "Erro com o login: Senha ou Email invalido";
      resetPasswordMessage =
          "Para redefinir a senha, por favor digite seu email e siga as instruções enviadas para o Email";
      resetPasswordTitle = "Redefinir a senha";
      createAccountText = "Criar uma conta";
      sendButton = "Enviar";
      cancelButton = "Cancelar";
      sendButtonOk = "Email enviado";
      errorSendReset = "Email não enviado, tente novamente";
      _placeholder = "Entre com um email valido";
      _placeholderPassword = 'Senha precisa ter mais de 6 digitos';
    } else {
      passwordWord = "contraseña";
      errorLoginMessage =
          "Error de inicio de sesión: contraseña o correo electrónico no válidos";
      resetPasswordMessage =
          "Para restablecer la contraseña, ingrese su correo electrónico y siga las instrucciones enviadas a Correo electrónico";
      resetPasswordTitle = "Restablecer la contraseña";
      createAccountText = "Crear una cuenta";
      sendButton = "Enviar";
      cancelButton = "Cancelar";
      sendButtonOk = "Correo electrónico enviado";
      errorSendReset = "Correo electrónico no enviado, inténtalo de nuevo";
      _placeholder = "Introduzca una dirección de correo electrónico válida";
      _placeholderPassword = 'La contraseña debe tener más de 6 dígitos';
    }
  }

  void reload() async {
    _getTranslator();
  }
}
