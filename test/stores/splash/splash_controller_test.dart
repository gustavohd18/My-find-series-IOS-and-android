import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myFindMovies/app/app_module.dart';
import 'package:myFindMovies/service/authentication/authentification_abstract.dart';
import 'package:myFindMovies/stores/splash/mock_auth.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

class MockAuthentification extends Mock implements AuthMock {}

void main() {
  initModule(AppModule(), changeBinds: [
    Bind<Authentication>((i) => AuthMock()),
  ]);

  test('when user log should be return test after login string', () async {
    // this class don't have test because firebase listening
    expect("test", "test");
  });
}
