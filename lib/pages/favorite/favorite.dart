import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myFindMovies/pages/home/home.dart';
import 'package:myFindMovies/pages/share/share.dart';
import 'package:myFindMovies/stores/favorites/favorites_controller.dart';
import 'package:myFindMovies/widgets/favorite/favorites_list.dart';
import 'package:myFindMovies/pages/movies/movie.dart';
import 'package:myFindMovies/pages/settings/settings.dart';
import 'package:myFindMovies/widgets/home/drawer_menu.dart';
import 'package:myFindMovies/pages/serie/serie.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends ModularState<Favorite, FavoritesController> {
  @override
  void initState() {
    super.initState();
    this.controller.reload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(),
      drawer: DrawerMenu(
          Main(), Favorite(), Series(), Movie(), Settings(), Share(), true),
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(this.controller.title),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
    );
  }

  Widget _buildScreen() {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Observer(
            builder: (_) => FavoritesList(
              this.controller.favoriteList,
              _reloadFavorite,
              true,
              this.controller.text,
            ),
          ),
        ),
      ],
    ));
  }

  //this will be remove
  void _reloadFavorite() {
    setState(() {});
  }
}
