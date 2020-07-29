import 'package:flutter/material.dart';

Widget bottomFavoriteBar(BuildContext context) {
  return Material(
      color: Theme.of(context).colorScheme.primary,
      child: TabBar(tabs: const <Widget>[
        Tab(icon: Icon(Icons.home), child: Text('Home')),
        Tab(icon: Icon(Icons.favorite), child: Text('Favorite')),
        Tab(icon: Icon(Icons.movie), child: Text('Series')),
        Tab(icon: Icon(Icons.slow_motion_video), child: Text('Movies')),
      ]));
}
