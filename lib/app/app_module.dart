import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_find_series_and_movies/controller/home.dart';
import 'package:my_find_series_and_movies/pages/home/home_page.dart';
import 'package:my_find_series_and_movies/pages/splash/splash_page.dart';
import 'package:my_find_series_and_movies/util/routerNames/router_names.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
         Bind((i) => HomeController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(home, child: (_, args) => Home()),
        ModularRouter(splash, child: (_, args) => Splash())
      ];

  static Inject get to => Inject.of();

  @override
  Widget get bootstrap => AppWidget();
}
