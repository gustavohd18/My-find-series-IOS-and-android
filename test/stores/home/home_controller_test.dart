import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myFindMovies/app/app_module.dart';
import 'package:myFindMovies/service/authentication/authentification_abstract.dart';
import 'package:myFindMovies/service/content_handle_abstract.dart';
import 'package:myFindMovies/service/content_handle_mock.dart';
import 'package:myFindMovies/stores/home/home_controller.dart';
import 'package:myFindMovies/stores/login/login_controller.dart';
import 'package:myFindMovies/stores/splash/mock_auth.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

void main() {
  initModule(AppModule(), changeBinds: [
    Bind<Authentication>((i) => AuthMock()),
    Bind<ContentHandleAbs>((i) => ContentHandleMock()),
  ]);

  test('home should load list of movies and series from contentHandle',
      () async {
    final HomeController home = Modular.get();

    var resultHomeMovies = await home.movieList;
    var resultHomeSeries = await home.serieList;

    expect(resultHomeMovies[0].id, "test");
    expect(resultHomeSeries[0].id, "test");
  });
}
