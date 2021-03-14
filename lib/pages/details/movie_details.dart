import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/model/movies.dart';
import 'package:my_find_series_and_movies/widgets/bodyDetail/body_detail.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;
  MovieDetails({@required this.movie});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyDetail(movie: widget.movie),
    );
  }
}
