import 'package:flutter/material.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';

class DrawerMenu extends StatelessWidget {
  final Widget home, favorite, series, movies, settings, share;
  final bool isPortugues;

  DrawerMenu(this.home, this.favorite, this.series, this.movies, this.settings,
      this.share, this.isPortugues);
  @override
  Widget build(BuildContext context) {
    String _homeName,
        _favoriteName,
        _moviesName,
        _settingsName,
        _logoutName,
        _shareName;
    final AuthenticationService _authenticationService =
        AuthenticationService();

    if (!isPortugues) {
      _homeName = "Inicio";
      _favoriteName = "Favoritos";
      _moviesName = "Filmes";
      _settingsName = "Configurações";
      _logoutName = "Sair";
      _shareName = "Compartilhados";
    } else {
      _homeName = "Home";
      _favoriteName = "Favorites";
      _moviesName = "Movies";
      _settingsName = "Settings";
      _logoutName = "Logout";
      _shareName = "shared";
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                _authenticationService.getFirebaseAuth().currentUser.email,
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
                      _homeName,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => home));
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
                      _favoriteName,
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
                      builder: (BuildContext context) => favorite));
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
                      "Series",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => series));
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
                      _moviesName,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => movies));
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
                      _shareName,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => share));
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
                      _settingsName,
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
                      builder: (BuildContext context) => settings));
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
                      _logoutName,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              _authenticationService.signOut();
            },
          ),
        ],
      ),
    );
  }
}
