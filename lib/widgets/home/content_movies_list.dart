import 'package:flutter/material.dart';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/widgets/home/contentCard.dart';

class ContentMoviesList extends StatelessWidget {
  final Future<List<MovieList>> _future;

  ContentMoviesList(this._future);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieList>>(
      future: _future,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(6.0),
                itemCount: snapshot.data.length,
                itemBuilder: (_, int position) {
                  final item = snapshot.data[position];

                  return contentCard(context, item.id, item.title,
                      item.overview, item.voteAverage, item.posterPath, true);
                })
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
