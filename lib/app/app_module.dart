
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myFindMovies/pages/home/home.dart';
import 'package:myFindMovies/pages/login/login.dart';
import 'package:myFindMovies/pages/movies/movie.dart';
import 'package:myFindMovies/pages/serie/serie.dart';
import 'package:myFindMovies/pages/settings/settings.dart';
import 'package:myFindMovies/pages/share/share.dart';
import 'package:myFindMovies/pages/splash/splash.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';
import 'package:myFindMovies/service/authentication/authentification_abstract.dart';
import 'package:myFindMovies/service/content_handle.dart';
import 'package:myFindMovies/service/content_handle_abstract.dart';
import 'package:myFindMovies/service/database/favoriteDatabase.dart';
import 'package:myFindMovies/service/database/favorites_database_abstract.dart';
import 'package:myFindMovies/service/translator/translator.dart';
import 'package:myFindMovies/service/translator/translator_abstract.dart';
import 'package:myFindMovies/stores/content/content_controller.dart';
import 'package:myFindMovies/stores/favorites/favorites_controller.dart';
import 'package:myFindMovies/stores/home/home_controller.dart';
import 'package:myFindMovies/stores/movies/movies_controller.dart';
import 'package:myFindMovies/stores/series/series_controller.dart';
import 'package:myFindMovies/stores/drawer/drawer_menu_controller.dart';
import 'package:myFindMovies/stores/settings/settings_controller.dart';
import 'package:myFindMovies/stores/share/share_controller.dart';
import 'package:myFindMovies/stores/splash/splash_controller.dart';
import 'package:myFindMovies/stores/login/login_controller.dart';
import 'package:myFindMovies/widgets/home/drawer_menu.dart';

import 'app_widget.dart';

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
        Bind((i) => MoviesController()),
        Bind((i) => SeriesController()),
        Bind((i) => ShareController()),
        Bind((i) => DrawerMenuController()),
        Bind((i) => ContentController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, args) => Splash()),
        ModularRouter("/login", child: (_, args) => Login()),
        ModularRouter("/home", child: (_, args) => Main()),
        ModularRouter("/settings", child: (_, args) => Settings()),
        ModularRouter("/movie", child: (_, args) => Movie()),
        ModularRouter("/series", child: (_, args) => Series()),
        ModularRouter("/share", child: (_, args) => Share()),
        ModularRouter("/drawer", child: (_, args) => DrawerMenu()),
      ];

  static Inject get to => Inject.of();

  @override
  Widget get bootstrap => AppWidget();
}
