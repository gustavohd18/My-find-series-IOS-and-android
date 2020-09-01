import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myFindMovies/app/app_module.dart';
import 'package:myFindMovies/pages/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myFindMovies/pages/login/login.dart';
import 'package:myFindMovies/service/authentication/authenticationBloc.dart';
import 'package:myFindMovies/service/authentication/authentication_provider.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';
import 'package:myFindMovies/service/traslator.dart';

//Future<void> main() async {
// WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
//  bool isPortuguese = await Traslator().isPortuguese();
////  print(isPortuguese);
// runApp(MyApp(isPortuguese));
//}

void main() {
  runApp(ModularApp(
    module: AppModule(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final bool isPortuguese;

  MyApp(this.isPortuguese);

  @override
  Widget build(BuildContext context) {
    final AuthenticationService _authenticationService =
        AuthenticationService();

    final AuthenticationBloc _authenticationBloc =
        AuthenticationBloc(_authenticationService);

    return AuthenticationBlocProvider(
      authenticationBloc: _authenticationBloc,
      child: StreamBuilder(
        initialData: null,
        stream: _authenticationBloc.user,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.blue,
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return _buildMaterialApp(
              Main(),
            );
          } else {
            return _buildMaterialApp(Login(isPortuguese));
          }
        },
      ),
    );
  }

  MaterialApp _buildMaterialApp(Widget homePage) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My find series and movies',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: homePage,
    );
  }
}
