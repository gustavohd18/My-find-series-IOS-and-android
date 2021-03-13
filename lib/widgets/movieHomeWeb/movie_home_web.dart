import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/model/movies.dart';
import 'package:my_find_series_and_movies/widgets/movieCardWeb/movie_card_web.dart';

class MovieHomeWeb extends StatelessWidget {
  final Future<List<Movie>> movies;

  MovieHomeWeb(this.movies);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return snapshot.hasData && snapshot.data.length > 0
              ? Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: MovieCardWeb(
                              movie: snapshot.data[0],
                            ),
                          ),
                          Expanded(
                            child: MovieCardWeb(
                              movie: snapshot.data[1],
                            ),
                          ),
                          Expanded(
                            child: MovieCardWeb(
                              movie: snapshot.data[2],
                            ),
                          ),
                          Expanded(
                            child: MovieCardWeb(
                              movie: snapshot.data[3],
                            ),
                          ),
                          Expanded(
                            child: MovieCardWeb(
                              movie: snapshot.data[4],
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
                            movie: snapshot.data[5],
                          ),
                        ),
                        Expanded(
                          child: MovieCardWeb(
                            movie: snapshot.data[6],
                          ),
                        ),
                        Expanded(
                          child: MovieCardWeb(
                            movie: snapshot.data[7],
                          ),
                        ),
                        Expanded(
                          child: MovieCardWeb(
                            movie: snapshot.data[8],
                          ),
                        ),
                        Expanded(
                          child: MovieCardWeb(
                            movie: snapshot.data[9],
                          ),
                        ),
                      ],
                    ))
                  ],
                )
              : Center(
                  child: Text(
                    "nothing to show",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
        });
  }
}
