import 'package:flutter/material.dart';
import 'package:myFindMovies/pages/serie/serie.dart';
import 'package:myFindMovies/service/traslator.dart';
import 'package:myFindMovies/widgets/home/content_movies_list.dart';
import 'package:myFindMovies/widgets/home/content_series_list.dart';
import 'package:myFindMovies/widgets/home/drawer_menu.dart';
import 'package:myFindMovies/widgets/home/subtitle.dart';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/service/content_handle.dart';
import 'package:myFindMovies/pages/favorite/favorite.dart';
import 'package:myFindMovies/pages/movies/movie.dart';
import 'package:myFindMovies/pages/settings/settings.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with TickerProviderStateMixin {
  Future<List<MovieList>> _movieList;
  Future<List<SerieList>> _serieList;

  bool isPortugues;

  String _topMovies = 'top', _topSeries = 'top';
  List<String> _tabs = ["Home", "Favorite", "Series", "Movies", "Settings"];
  String _myHandler;
  TabController _controller;
  String _homeName = 'Home';

  @override
  void initState() {
    super.initState();
    // this should not be done in build method.
    getLanguage();
    _controller = TabController(length: 5, vsync: this);
    _myHandler = _homeName;
    _controller.addListener(_handleSelected);
  }

  void _handleSelected() {
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      _myHandler = _tabs[_controller.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: DrawerMenu(Main(), Favorite(), Series(), Movie(),
          Settings(_reloadTab), isPortugues),
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
        Expanded(flex: 1, child: ContentMoviesList(_movieList, isPortugues)),
        Subtitle(_topSeries),
        Expanded(flex: 1, child: ContentSeriesList(_serieList, isPortugues)),
      ],
    ));
  }

  Future<Null> getLanguage() async {
    bool isPortuguese = await Traslator().isPortuguese();
    setState(() {
      isPortugues = isPortuguese;

      if (!isPortuguese) {
        _tabs[0] = "Inicio";
        _homeName = "Inicio";
        _tabs[1] = "Favoritos";
        _tabs[3] = "Filmes";
        _tabs[4] = "Configurar";
        _topSeries = "Top 10 Series no mundo";
        _topMovies = "Top 10 Filmes no mundo";
      } else {
        _tabs[0] = "Home";
        _homeName = "Home";
        _tabs[1] = "Favorite";
        _tabs[3] = "Movies";
        _tabs[4] = "Settings";
        _topSeries = "Top 10 Series in the World";
        _topMovies = "Top 10 Movies in the World";
      }

      _movieList = ContentHandler().getMovieList();
      _serieList = ContentHandler().getSerieList();
    });
  }
}
