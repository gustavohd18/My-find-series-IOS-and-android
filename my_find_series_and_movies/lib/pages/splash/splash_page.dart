import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_find_series_and_movies/util/routerNames/router_names.dart';

class Splash extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<Splash>
    with SingleTickerProviderStateMixin {
  Tween<double> _scaleTween = Tween<double>(begin: 1, end: 2);
  Tween<double> _opacityTween = Tween<double>(begin: 0.0, end: 1.0);

  AnimationController _controller;

  Timer _timer;
  startTimeout() {
    _timer = Timer(Duration(seconds: 5), _goToLogin);
    return _timer;
  }

  _goToLogin() async {
    Modular.to.pushReplacementNamed(home);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.forward();
    startTimeout();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
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
                child: TweenAnimationBuilder(
                  tween: _scaleTween,
                  duration: Duration(seconds: 2),
                  builder: (context, scale, child) {
                    return Transform.scale(scale: scale, child: child);
                  },
                  child: Text(
                    "My find Series and Movies",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: 15.0,
                ),
                child: TweenAnimationBuilder(
                  tween: _opacityTween,
                  duration: Duration(seconds: 2),
                  builder: (context, opacity, child) {
                    return Opacity(
                      opacity: opacity,
                      child: child,
                    );
                  },
                  child: Text(
                    "Built with",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 1.0),
              AnimatedBuilder(
                animation: _controller.view,
                builder: (context, child) {
                  return Transform.rotate(
                      angle: _controller.value * 2 * pi, child: child);
                },
                child: Image(
                    image: AssetImage('assets/images/Tmdb-logo.png'),
                    width: 60,
                    height: 60),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
