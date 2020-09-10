import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:myFindMovies/app/app_module.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';
import 'package:myFindMovies/service/content_handle.dart';
import 'package:myFindMovies/stores/login/login_controller.dart';
import 'package:myFindMovies/stores/splash/splash_controller.dart';

class InitAppModuleHelper extends IModularTest {
  @override
  List<Bind> get binds => [
        Bind((i) => ContentHandler()),
        Bind((i) => AuthenticationService()),
        Bind((i) => SplashController()),
        Bind((i) => LoginController()),
      ];

  @override
  ChildModule get module => AppModule();

  @override
  IModularTest get modulardependency => null;
}
