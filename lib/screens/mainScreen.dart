import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/appbar.dart';
import 'package:myFindMovies/widgets/greeting.dart';
import 'package:myFindMovies/widgets/movieList.dart';
import 'package:myFindMovies/widgets/bottomBar.dart';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/service/movie_list_handle.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  Future<List<MovieList>> _test;
  Future<List<SerieList>> _test2;

  @override
  void initState() {
    super.initState();
    print(_test);
    // this should not be done in build method.
    _test = MovieListHandler().getMovieList();
    _test2 = MovieListHandler().getSerieList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: appBarMain(),
            body: _buildScreen(),
            bottomNavigationBar: bottomBar(context)));
  }

  Widget _buildScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: greeting('Top 10 Movies'),
        ),
        Expanded(flex: 1, child: movieList(_test)),
        greeting('Top 10 Series'),
        Expanded(flex: 1, child: serieList(_test2)),
      ],
    );
  }
}
