import 'package:flutter/material.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/widgets/serie/series_card.dart';

class SeriesList extends StatelessWidget {
  final Future<List<SerieList>> _future;
  final bool isPortuguese;
  final String text;

  SeriesList(this._future, this.isPortuguese, this.text);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SerieList>>(
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
                  return SeriesCard(item.id, item.originalName, item.overview,
                      item.voteAverage, item.posterPath, false, isPortuguese);
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
