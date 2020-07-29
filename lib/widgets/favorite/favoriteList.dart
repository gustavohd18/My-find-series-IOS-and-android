import 'package:flutter/material.dart';
import 'package:myFindMovies/model/FavoriteList.dart';
import 'package:myFindMovies/widgets/favorite/favoriteCard.dart';

Widget favoriteList(Future<List<FavoriteList>> future) {
  return FutureBuilder<List<FavoriteList>>(
    future: future,
    builder: (context, snapshot) {
      return snapshot.hasData && snapshot.data.length > 0
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(6.0),
              itemCount: snapshot.data.length,
              itemBuilder: (_, int position) {
                final item = snapshot.data[position];
                return favoriteCard(
                    item.title, item.posterPath, item.voteAverage);
              })
          : Center(
              child: Text(
                "No have Favorite",
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
