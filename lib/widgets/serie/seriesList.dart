import 'package:flutter/material.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/widgets/serie/serieCard.dart';

class SeriesList extends StatelessWidget {
  final Future<List<SerieList>> _future;

  SeriesList(this._future);

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
                  return serieCard(context, item.id, item.originalName,
                      item.overview, item.voteAverage, item.posterPath, false);
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
