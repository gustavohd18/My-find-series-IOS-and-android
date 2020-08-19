import 'package:flutter/material.dart';
import 'package:myFindMovies/pages/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myFindMovies/pages/login/login.dart';
import 'package:myFindMovies/pages/serie/serie.dart';
import 'package:myFindMovies/service/authentication/authenticationBloc.dart';
import 'package:myFindMovies/service/authentication/authentication_provider.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
            return _buildMaterialApp(Login());
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
