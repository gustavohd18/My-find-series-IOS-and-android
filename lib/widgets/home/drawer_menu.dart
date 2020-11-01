import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myFindMovies/pages/favorite/favorite.dart';
import 'package:myFindMovies/pages/home/home.dart';
import 'package:myFindMovies/pages/movies/movie.dart';
import 'package:myFindMovies/pages/serie/serie.dart';
import 'package:myFindMovies/pages/settings/settings.dart';
import 'package:myFindMovies/pages/share/share.dart';
import 'package:myFindMovies/stores/drawer/drawer_menu_controller.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends ModularState<DrawerMenu, DrawerMenuController> {
  @override
  void initState() {
    super.initState();
    this.controller.reload();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  this.controller.getAuthEmail(),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 24,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10, top: 2),
                      child: Text(
                        this.controller.home,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18),
                      )),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Main()));
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 24,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10, top: 2),
                      child: Text(
                        this.controller.favorite,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18),
                      )),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Favorite()));
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.slow_motion_video,
                    color: Colors.white,
                    size: 24,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10, top: 2),
                      child: Text(
                        this.controller.series,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18),
                      )),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Series()));
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.movie,
                    color: Colors.white,
                    size: 24,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10, top: 2),
                      child: Text(
                        this.controller.movies,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18),
                      )),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Movie()));
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 24,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10, top: 2),
                      child: Text(
                        this.controller.shared,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18),
                      )),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Share()));
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 24,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10, top: 2),
                      child: Text(
                        this.controller.settings,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18),
                      )),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Settings()));
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                    size: 24,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10, top: 2),
                      child: Text(
                        this.controller.logout,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18),
                      )),
                ],
              ),
              onTap: () {
                this.controller.signOut();
                Modular.to.pushReplacementNamed('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
