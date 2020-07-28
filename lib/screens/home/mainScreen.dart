import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/home/appbar.dart';
import 'package:myFindMovies/widgets/home/subtitle.dart';
import 'package:myFindMovies/widgets/home/contentList.dart';
import 'package:myFindMovies/widgets/home/bottomBar.dart';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/service/content_handle.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  Future<List<MovieList>> _movieList;
  Future<List<SerieList>> _serieList;

  @override
  void initState() {
    super.initState();
    // this should not be done in build method.
    _movieList = ContentHandler().getMovieList();
    _serieList = ContentHandler().getSerieList();
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
          child: subtitle('Top 10 Movies'),
        ),
        Expanded(flex: 1, child: movieList(_movieList)),
        subtitle('Top 10 Series'),
        Expanded(flex: 1, child: serieList(_serieList)),
      ],
    );
  }
}
