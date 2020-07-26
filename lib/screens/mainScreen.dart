import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/appbar.dart';
import 'package:myFindMovies/widgets/greeting.dart';
import 'package:myFindMovies/widgets/movieList.dart';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/service/movie_list_handle.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  Future<List<MovieList>> _test;

  @override
  void initState() {
    super.initState();
    print(_test);
    // this should not be done in build method.
    _test = MovieListHandler().getMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(),
      body: _buildScreen(),
    );
  }

  Widget _buildScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: greeting(),
        ),
        Expanded(flex: 1, child: movieList(_test)),
      ],
    );
  }
}
