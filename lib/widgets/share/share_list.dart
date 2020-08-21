import 'package:flutter/material.dart';
import 'package:myFindMovies/model/shareContent.dart';
import 'package:myFindMovies/widgets/share/share_card.dart';

class ShareList extends StatelessWidget {
  final Future<List<ShareContent>> _future;
  final Function() _f;
  final bool isPortuguese;
  final String text;

  ShareList(this._future, this._f, this.isPortuguese, this.text);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ShareContent>>(
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

                  return ShareCard(
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
