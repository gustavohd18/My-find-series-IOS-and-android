import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/util/types/content_type.dart';

class ContentFuture extends StatelessWidget {
  final Future<List> future;
  final ContentType type;

  ContentFuture({@required this.future, this.type});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieList>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return snapshot.hasData && snapshot.data.length > 0
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(6.0),
                itemCount: snapshot.data.length,
                itemBuilder: (_, int position) {
                  final item = snapshot.data[position];
                  return MoviesCard(item.id, item.title, item.overview,
                      item.voteAverage, item.posterPath, true, isPortuguese);
                })
            : Center(
                child: Text(
                  text,
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
