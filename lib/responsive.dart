import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget web;

  Responsive(
      {@required this.mobile, @required this.tablet, @required this.web});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 570;

  static bool isTable(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 570;

  static bool isWeb(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1100) {
        return web;
      } else if (constraints.maxWidth >= 572) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
