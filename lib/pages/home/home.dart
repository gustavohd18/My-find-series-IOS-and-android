import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myFindMovies/pages/serie/serie.dart';
import 'package:myFindMovies/pages/share/share.dart';
import 'package:myFindMovies/stores/home/home_controller.dart';
import 'package:myFindMovies/widgets/home/content_movies_list.dart';
import 'package:myFindMovies/widgets/home/content_series_list.dart';
import 'package:myFindMovies/widgets/home/drawer_menu.dart';
import 'package:myFindMovies/widgets/home/subtitle.dart';
import 'package:myFindMovies/pages/favorite/favorite.dart';
import 'package:myFindMovies/pages/movies/movie.dart';
import 'package:myFindMovies/pages/settings/settings.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends ModularState<Main, HomeController> {
  @override
  void initState() {
    super.initState();
    // this should not be done in build method.
    this.controller.reload();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: DrawerMenu(
          Main(), Favorite(), Series(), Movie(), Settings(), Share(), true),
      body: _buildScreen(),
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
    ));
  }

  Widget _buildScreen() {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Observer(
            builder: (_) => Subtitle(this.controller.topMovies),
          ),
        ),
        Expanded(
            flex: 1,
            child: Observer(
                builder: (_) =>
                    ContentMoviesList(this.controller.movieList, true))),
        Observer(
          builder: (_) => Subtitle(this.controller.topSeries),
        ),
        Expanded(
            flex: 1,
            child: Observer(
                builder: (_) =>
                    ContentSeriesList(this.controller.serieList, true))),
      ],
    ));
  }
}
