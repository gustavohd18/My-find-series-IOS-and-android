import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myFindMovies/app/app_module.dart';
import 'package:myFindMovies/pages/splash/splash.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';
import 'package:myFindMovies/stores/splash/splash_controller.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:flutter_modular/flutter_modular.dart';

class MockAuthentication extends Mock implements AuthenticationService {}

void main() {
  SplashController splash;

  setUpAll(() {
    initModules([AppModule()]);
    splash = Modular.get<SplashController>();
  });

  test('be default when user log should be empty string', () async {
    expect(splash.addUser, "test");
  });
}
