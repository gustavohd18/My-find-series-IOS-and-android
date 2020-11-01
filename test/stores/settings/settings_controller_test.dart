import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myFindMovies/app/app_module.dart';
import 'package:myFindMovies/service/authentication/authentification_abstract.dart';
import 'package:myFindMovies/service/translator/translator_abstract.dart';
import 'package:myFindMovies/stores/settings/settings_controller.dart';
import 'package:myFindMovies/stores/splash/mock_auth.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import '../../pages/splash/splash_test.dart';

class MockAuthentification extends Mock implements AuthMock {}

void main() {
  initModule(AppModule(), changeBinds: [
    Bind<Authentication>((i) => AuthMock()),
    Bind<ITranslator>((i) => MockTranslator()),
  ]);

  test('settings should be call function setTranslator and return english ',
      () async {
    final SettingsController settings = Modular.get();

    settings.setTranslator(0);

    expect(settings.english, "English");
  });
}
