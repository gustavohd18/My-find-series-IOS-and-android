import 'package:flutter/material.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/widgets/serie/serieCard.dart';

Widget serieListRequest(Future<List<SerieList>> future) {
  return FutureBuilder<List<SerieList>>(
    future: future,
    builder: (context, snapshot) {
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
