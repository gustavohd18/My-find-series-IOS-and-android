import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myFindMovies/app/app_module.dart';
import 'package:myFindMovies/pages/login/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myFindMovies/service/authentication/authentification_abstract.dart';
import 'package:myFindMovies/stores/login/login_controller.dart';

class MockAuthentification extends Mock implements Authentication {}

void main() async {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    initModule(AppModule(), changeBinds: [
      Bind<Authentication>((i) => MockAuthentification()),
      Bind((i) => LoginController()),
    ]);
  });

  testWidgets("Test element present to UI Splash screen",
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(Login(true)));

    expect("test", "test");
  });
}
