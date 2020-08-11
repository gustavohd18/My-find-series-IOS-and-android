import 'package:flutter/material.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/widgets/home/content_card.dart';

class ContentSeriesList extends StatelessWidget {
  final Future<List<SerieList>> _future;
  final bool isPortuguese;

  ContentSeriesList(this._future, this.isPortuguese);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SerieList>>(
      future: _future,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(6.0),
                itemCount: snapshot.data.length,
                itemBuilder: (_, int position) {
                  final item = snapshot.data[position];

                  return ContentCard(item.id, item.originalName, item.overview,
                      item.voteAverage, item.posterPath, false, isPortuguese);
                })
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
