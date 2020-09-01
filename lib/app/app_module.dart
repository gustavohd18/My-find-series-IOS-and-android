import 'package:flutter/semantics.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myFindMovies/app/app_widget.dart';
import 'package:myFindMovies/pages/home/home.dart';
import 'package:myFindMovies/pages/login/login.dart';
import 'package:myFindMovies/pages/splash/splash.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';
import 'package:myFindMovies/service/content_handle.dart';
import 'package:flutter/material.dart';
import 'package:myFindMovies/stores/splash/splash_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ContentHandler()),
        Bind((i) => AuthenticationService()),
        Bind((i) => SplashController()),
      ];

  @override
  List<Router> get routers => [
        Router("/", child: (_, args) => Splash()),
        Router("/login", child: (_, args) => Login(true)),
        Router("/home", child: (_, args) => Main()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
