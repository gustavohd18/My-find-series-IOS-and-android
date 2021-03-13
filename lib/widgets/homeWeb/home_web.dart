import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/model/movies.dart';
import 'package:my_find_series_and_movies/widgets/movieCardWeb/movie_card_web.dart';

class HomeWeb extends StatelessWidget {
  final List<Movie> movies;

  HomeWeb(this.movies);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: MovieCardWeb(
                  movie: movies[1],
                ),
              ),
              Expanded(
                child: MovieCardWeb(
                  movie: movies[1],
                ),
              ),
              Expanded(
                child: MovieCardWeb(
                  movie: movies[1],
                ),
              ),
              Expanded(
                child: MovieCardWeb(
                  movie: movies[1],
                ),
              ),
              Expanded(
                child: MovieCardWeb(
                  movie: movies[1],
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: MovieCardWeb(
                movie: movies[0],
              ),
            ),
            Expanded(
              child: MovieCardWeb(
                movie: movies[0],
              ),
            ),
            Expanded(
              child: MovieCardWeb(
                movie: movies[0],
              ),
            ),
            Expanded(
              child: MovieCardWeb(
                movie: movies[0],
              ),
            ),
            Expanded(
              child: MovieCardWeb(
                movie: movies[0],
              ),
            ),
          ],
        ))
      ],
    );
  }
}
