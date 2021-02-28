import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: "/splash",
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
