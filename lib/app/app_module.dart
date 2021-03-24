import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_find_series_and_movies/controller/home.dart';
import 'package:my_find_series_and_movies/model/home_controller_abstract.dart';
import 'package:my_find_series_and_movies/pages/details/details.dart';
import 'package:my_find_series_and_movies/pages/home/home.dart';
import 'package:my_find_series_and_movies/pages/splash/splash.dart';
import 'package:my_find_series_and_movies/util/routerNames/router_names.dart';

import 'app_widget.dart';
class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
         Bind<HomeControllerAB>((i) => HomeController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(home, child: (_, args) => Home()),
        ModularRouter(splash, child: (_, args) => Splash()),
        ModularRouter(details, child: (_, args) => Details(content: args.data,)),
      ];

  static Inject get to => Inject.of();

  @override
  Widget get bootstrap => AppWidget();
}
