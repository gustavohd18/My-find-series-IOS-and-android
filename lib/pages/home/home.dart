import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myFindMovies/pages/serie/serie.dart';
import 'package:myFindMovies/pages/share/share.dart';
import 'package:myFindMovies/service/translator/traslator.dart';
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
  bool isPortugues;

  String _topMovies = 'top', _topSeries = 'top';
  String _myHandler;
  String _homeName = 'Home';

  @override
  void initState() {
    super.initState();
    // this should not be done in build method.
    getLanguage();
    _myHandler = _homeName;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: DrawerMenu(Main(), Favorite(), Series(), Movie(),
          Settings(_reloadTab), Share(), isPortugues),
      body: _buildScreen(),
      appBar: AppBar(
        title: Text(_myHandler),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
    ));
  }

  void _reloadTab() {
    setState(() {
      getLanguage();
    });
  }

  Widget _buildScreen() {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Subtitle(_topMovies),
        ),
        Expanded(
            flex: 1,
            child: Observer(
                builder: (_) =>
                    ContentMoviesList(this.controller.movieList, isPortugues))),
        Subtitle(_topSeries),
        Expanded(
            flex: 1,
            child: Observer(
                builder: (_) =>
                    ContentSeriesList(this.controller.serieList, isPortugues))),
      ],
    ));
  }

  Future<Null> getLanguage() async {
    bool isPortuguese = await Traslator().isPortuguese();
    setState(() {
      isPortugues = isPortuguese;

      if (!isPortuguese) {
        _homeName = "Inicio";
        _topSeries = "Top 10 Series no mundo";
        _topMovies = "Top 10 Filmes no mundo";
      } else {
        _homeName = "Home";
        _topSeries = "Top 10 Series in the World";
        _topMovies = "Top 10 Movies in the World";
      }
    });
  }
}
