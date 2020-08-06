import 'package:flutter/material.dart';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/widgets/movies/movies_card.dart';

class MoviesList extends StatelessWidget {
  final Future<List<MovieList>> _future;

  MoviesList(this._future);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieList>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Wrap();
        }

        return snapshot.hasData && snapshot.data.length > 0
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(6.0),
                itemCount: snapshot.data.length,
                itemBuilder: (_, int position) {
                  final item = snapshot.data[position];
                  return MoviesCard(item.id, item.title, item.overview,
                      item.voteAverage, item.posterPath, true);
                })
            : Center(
                child: Text(
                  "No have Content to word",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
      },
    );
  }
}
