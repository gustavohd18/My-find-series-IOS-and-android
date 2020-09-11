import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myFindMovies/app/app_module.dart';
import 'package:myFindMovies/service/authentication/authentification_abstract.dart';
import 'package:myFindMovies/stores/login/login_controller.dart';
import 'package:myFindMovies/stores/splash/mock_auth.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

void main() {
  initModule(AppModule(), changeBinds: [
    Bind<Authentication>((i) => AuthMock()),
  ]);

  test('Be default login was type', () async {
    final LoginController login = Modular.get();
    expect(login.type, "Login");
  });

  test(
      'set email invalid and password valid should pass email to observable and enableButton false',
      () async {
    final LoginController login = Modular.get();
    login.setEmail("test");
    login.setPassword("testesr");
    expect(login.email, "test");
    expect(login.password, "testesr");
    expect(login.enableButton, false);
  });

  test(
      'set email valid and password invalid should pass email and password to observable and enableButton false',
      () async {
    final LoginController login = Modular.get();
    login.setEmail("test@gmail.com");
    login.setPassword("te");
    expect(login.email, "test@gmail.com");
    expect(login.password, "te");
    expect(login.enableButton, false);
  });

  test(
      'set email valid and password valid should pass email and password to observable and enableButton true',
      () async {
    final LoginController login = Modular.get();
    login.setEmail("test@gmail.com");
    login.setPassword("testesr");
    expect(login.email, "test@gmail.com");
    expect(login.password, "testesr");
    expect(login.enableButton, true);
  });

  test('should call auth service to get invalid created account', () async {
    final LoginController login = Modular.get();
    login.setEmail("test@gmail.com");
    login.setPassword("te");
    var result = await login.createAccount();
    expect(result, "Error creating user");
    expect(login.isLogin, false);
  });

  test('should call auth service to get invalid login account', () async {
    final LoginController login = Modular.get();
    login.setEmail("test@gmail.com");
    login.setPassword("tes");
    var result = await login.logIn();
    expect(result, "Email and Password are not valid");
    expect(login.isLogin, false);
  });
}
