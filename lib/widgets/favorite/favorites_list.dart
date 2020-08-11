import 'package:flutter/material.dart';
import 'package:myFindMovies/model/FavoriteList.dart';
import 'package:myFindMovies/widgets/favorite/favorite_card.dart';

class FavoritesList extends StatelessWidget {
  final Future<List<FavoriteList>> _future;
  final Function() _f;
  final bool isPortuguese;

  FavoritesList(this._future, this._f, this.isPortuguese);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FavoriteList>>(
      future: _future,
      builder: (context, snapshot) {
        return snapshot.hasData && snapshot.data.length > 0
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(6.0),
                itemCount: snapshot.data.length,
                itemBuilder: (_, int position) {
                  final item = snapshot.data[position];
                  bool _isMovies;

                  if (item.isMovie == 's') {
                    _isMovies = true;
                  } else {
                    _isMovies = false;
                  }

                  return FavoriteCard(
                      item.id,
                      item.title,
                      item.overview,
                      item.voteAverage,
                      item.posterPath,
                      _isMovies,
                      _f,
                      isPortuguese);
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
}
