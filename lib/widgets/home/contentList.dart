import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/home/contentCard.dart';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/model/SerieList.dart';

Widget movieList(Future<List<MovieList>> future) {
  return FutureBuilder<List<MovieList>>(
    future: future,
    builder: (context, snapshot) {
      return snapshot.hasData
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(6.0),
              itemCount: snapshot.data.length,
              itemBuilder: (_, int position) {
                final item = snapshot.data[position];

                return contentCard(context, item.id, item.title, item.overview,
                    item.voteAverage, item.posterPath, true);
              })
          : Center(
              child: CircularProgressIndicator(),
            );
    },
  );
}

Widget serieList(Future<List<SerieList>> future) {
  return FutureBuilder<List<SerieList>>(
    future: future,
    builder: (context, snapshot) {
      return snapshot.hasData
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(6.0),
              itemCount: snapshot.data.length,
              itemBuilder: (_, int position) {
                final item = snapshot.data[position];

                return contentCard(context, item.id, item.originalName,
                    item.overview, item.voteAverage, item.posterPath, false);
              })
          : Center(
              child: CircularProgressIndicator(),
            );
    },
  );
}
