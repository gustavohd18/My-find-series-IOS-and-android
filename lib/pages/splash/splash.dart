import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myFindMovies/stores/splash/splash_controller.dart';

class Splash extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<Splash, SplashController> {
  Timer _timer;
  startTimeout() {
    _timer = Timer(Duration(seconds: 5), changeScreen);
    return _timer;
  }

  changeScreen() async {
    (this.controller.addUser != null)
        ? Modular.to.pushReplacementNamed('/home')
        : Modular.to.pushReplacementNamed('/login');
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: 15.0,
                ),
                child: Text(
                  "My find Series and Movies",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}