import 'package:flutter_modular/flutter_modular.dart';
import 'package:myFindMovies/app/app_widget.dart';
import 'package:myFindMovies/pages/home/home.dart';
import 'package:myFindMovies/pages/login/login.dart';
import 'package:myFindMovies/pages/settings/settings.dart';
import 'package:myFindMovies/pages/splash/splash.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';
import 'package:myFindMovies/service/authentication/authentification_abstract.dart';
import 'package:myFindMovies/service/content_handle.dart';
import 'package:flutter/material.dart';
import 'package:myFindMovies/service/content_handle_abstract.dart';
import 'package:myFindMovies/service/database/favoriteDatabase.dart';
import 'package:myFindMovies/service/database/favorites_database_abstract.dart';
import 'package:myFindMovies/service/translator/translator.dart';
import 'package:myFindMovies/service/translator/translator_abstract.dart';
import 'package:myFindMovies/stores/favorites/favorites_controller.dart';
import 'package:myFindMovies/stores/home/home_controller.dart';
import 'package:myFindMovies/stores/settings/settings_controller.dart';
import 'package:myFindMovies/stores/splash/splash_controller.dart';
import 'package:myFindMovies/stores/login/login_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<ContentHandleAbs>((i) => ContentHandler()),
        Bind<Authentication>((i) => AuthenticationService()),
        Bind<ITranslator>((i) => Translator()),
        Bind<IFavorites>((i) => FavoriteDatabase.instance),
        Bind((i) => SplashController()),
        Bind((i) => LoginController()),
        Bind((i) => HomeController()),
        Bind((i) => SettingsController()),
        Bind((i) => FavoritesController()),
      ];

  @override
  List<Router> get routers => [
        Router("/", child: (_, args) => Splash()),
        Router("/login", child: (_, args) => Login()),
        Router("/home", child: (_, args) => Main()),
        Router("/settings", child: (_, args) => Settings()),
      ];

  static Inject get to => Inject.of();

  @override
  Widget get bootstrap => AppWidget();
}
