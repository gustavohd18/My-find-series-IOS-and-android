import 'package:flutter/material.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/widgets/serie/series_card.dart';

class SeriesList extends StatelessWidget {
  final Future<List<SerieList>> _future;
  final bool isPortuguese;

  SeriesList(this._future, this.isPortuguese);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SerieList>>(
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
                  return SeriesCard(item.id, item.originalName, item.overview,
                      item.voteAverage, item.posterPath, false, isPortuguese);
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
