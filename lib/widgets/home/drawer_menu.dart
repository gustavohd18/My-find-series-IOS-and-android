import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final Widget home, favorite, series, movies, settings;
  final bool isPortugues;

  DrawerMenu(this.home, this.favorite, this.series, this.movies, this.settings,
      this.isPortugues);
  @override
  Widget build(BuildContext context) {
    String _homeName, _favoriteName, _moviesName, _settingsName;

    if (!isPortugues) {
      _homeName = "Inicio";
      _favoriteName = "Favoritos";
      _moviesName = "Filmes";
      _settingsName = "Configurar";
    } else {
      _homeName = "Home";
      _favoriteName = "Favorite";
      _moviesName = "Movies";
      _settingsName = "Settings";
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('My find'),
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
              // Navigator.push(context,
              //    MaterialPageRoute(builder: (BuildContext context) => /////home));
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
        ],
      ),
    );
  }
}
