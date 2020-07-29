import 'package:flutter/material.dart';
import 'package:myFindMovies/screens/favorite/favoriteScreen.dart';

Widget bottomBar(BuildContext context) {
  return Material(
      color: Theme.of(context).colorScheme.primary,
      child: TabBar(tabs: const <Widget>[
        Tab(icon: Icon(Icons.home), child: Text('Home')),
        Tab(icon: Icon(Icons.favorite), child: Text('Favorite')),
        Tab(icon: Icon(Icons.movie), child: Text('Series')),
        Tab(icon: Icon(Icons.slow_motion_video), child: Text('Movies')),
      ]));
}

void _pushNavigatorFavorite(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      // NEW lines from here...
      builder: (BuildContext context) {
        return Scaffold(
          body: Favorite(),
        );
      }, // ...to here.
    ),
  );
}
