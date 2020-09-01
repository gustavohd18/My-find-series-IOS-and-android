import 'package:flutter/semantics.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myFindMovies/app/app_widget.dart';
import 'package:myFindMovies/pages/home/home.dart';
import 'package:myFindMovies/pages/splash/splash.dart';
import 'package:myFindMovies/service/content_handle.dart';
import 'package:flutter/material.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [Bind((i) => ContentHandler())];

  @override
  List<Router> get routers => [
        //here will be splash first
        Router("/", child: (_, args) => Splash()),
        Router("/home", child: (_, args) => Main()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
