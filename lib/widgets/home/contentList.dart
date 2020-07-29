import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/home/contentCard.dart';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/model/FavoriteList.dart';
import 'package:myFindMovies/service/database/favoriteDatabase.dart';

Widget movieList(Future<List<MovieList>> future) {
  // reference to single class that manages the database
  final dbHelper = FavoriteDatabase.instance;

  return FutureBuilder<List<MovieList>>(
    future: future,
    builder: (context, snapshot) {
      return snapshot.hasData
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(6.0),
              itemCount: snapshot.data.length,
              itemBuilder: (_, int position) {
                final item = snapshot.data[position];
                final favorite = new FavoriteList.origin(
                    item.id, item.title, item.posterPath, item.voteAverage);
                return GestureDetector(
                    child: contentCard(
                        item.posterPath, item.title, item.voteAverage),
                    onTap: () => {
                          dbHelper.insertFavorite(favorite),
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('added to Favorite'),
                          ))
                        });
              })
          : Center(
              child: CircularProgressIndicator(),
            );
    },
  );
}

Widget serieList(Future<List<SerieList>> future) {
  // reference to single class that manages the database
  final dbHelper = FavoriteDatabase.instance;

  return FutureBuilder<List<SerieList>>(
    future: future,
    builder: (context, snapshot) {
      return snapshot.hasData
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(6.0),
              itemCount: snapshot.data.length,
              itemBuilder: (_, int position) {
                final item = snapshot.data[position];
                final favorite = new FavoriteList.origin(item.id,
                    item.originalName, item.posterPath, item.voteAverage);
                return GestureDetector(
                    child: contentCard(
                        item.posterPath, item.originalName, item.voteAverage),
                    onTap: () => {
                          dbHelper.insertFavorite(favorite),
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('added to Favorite'),
                          ))
                        });
              })
          : Center(
              child: CircularProgressIndicator(),
            );
    },
  );
}
