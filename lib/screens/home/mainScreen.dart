import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/home/subtitle.dart';
import 'package:myFindMovies/widgets/home/contentList.dart';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/service/content_handle.dart';
import 'package:myFindMovies/service/database/favoriteDatabase.dart';
import 'package:myFindMovies/screens/favorite/favoriteScreen.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with TickerProviderStateMixin {
  Future<List<MovieList>> _movieList;
  Future<List<SerieList>> _serieList;

  final List<String> _tabs = ["Home", "Favorite", "Series", "Movies"];
  String _myHandler;
  TabController _controller;

  // reference to our single class that manages the database
  final dbHelper = FavoriteDatabase.instance;

  @override
  void initState() {
    super.initState();
    // this should not be done in build method.
    _movieList = ContentHandler().getMovieList();
    _serieList = ContentHandler().getSerieList();
    _controller = TabController(length: 4, vsync: this);
    _myHandler = _tabs[0];
    _controller.addListener(_handleSelected);
  }

  void _handleSelected() {
    setState(() {
      _myHandler = _tabs[_controller.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            controller: _controller,
            children: [
              _buildScreen(),
              Favorite(),
              Text("This will be search series"),
              Text("This will be search movies"),
            ],
          ),
          appBar: AppBar(
            title: Text(_myHandler),
            backgroundColor: Theme.of(context).colorScheme.primary,
            bottom: TabBar(
              controller: _controller,
              tabs: <Tab>[
                Tab(
                  icon: Icon(Icons.home),
                  text: _tabs[0],
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                  text: _tabs[1],
                ),
                Tab(
                  icon: Icon(Icons.slow_motion_video),
                  text: _tabs[2],
                ),
                Tab(
                  icon: Icon(Icons.movie),
                  text: _tabs[3],
                )
              ],
            ),
          ),
          // bottomNavigationBar: bottomBar(context),
        ));
  }

  Widget _buildScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: subtitle('Top 10 Movies'),
        ),
        Expanded(flex: 1, child: movieList(_movieList)),
        subtitle('Top 10 Series'),
        Expanded(flex: 1, child: serieList(_serieList)),
      ],
    );
  }
}
