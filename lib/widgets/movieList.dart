import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/movieCard.dart';
import 'package:myFindMovies/model/MovieList.dart';

Widget movieList(Future<List<MovieList>> future) {
  return FutureBuilder<List<MovieList>>(
    future: future,
    builder: (context, snapshot) {
      return snapshot.hasData
          ? ListView.builder(
              // scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(6.0),
              itemCount: snapshot.data.length,
              itemBuilder: (_, int position) {
                final item = snapshot.data[position];
                return movieCard(item.posterPath, item.title, item.overview);
              })
          : Center(
              child: CircularProgressIndicator(),
            );
    },
  );
}
