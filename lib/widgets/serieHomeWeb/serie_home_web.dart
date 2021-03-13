import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/model/serie.dart';
import 'package:my_find_series_and_movies/widgets/serieCardWeb/serie_card_web.dart';

class SerieHomeWeb extends StatelessWidget {
  final Future<List<Serie>> series;

  SerieHomeWeb(this.series);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Serie>>(
        future: series,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return snapshot.hasData && snapshot.data.length > 0
              ? Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: SerieCardWeb(
                              serie: snapshot.data[0],
                            ),
                          ),
                          Expanded(
                            child: SerieCardWeb(
                              serie: snapshot.data[1],
                            ),
                          ),
                          Expanded(
                            child: SerieCardWeb(
                              serie: snapshot.data[2],
                            ),
                          ),
                          Expanded(
                            child: SerieCardWeb(
                              serie: snapshot.data[3],
                            ),
                          ),
                          Expanded(
                            child: SerieCardWeb(
                              serie: snapshot.data[4],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          child: SerieCardWeb(
                            serie: snapshot.data[5],
                          ),
                        ),
                        Expanded(
                          child: SerieCardWeb(
                            serie: snapshot.data[6],
                          ),
                        ),
                        Expanded(
                          child: SerieCardWeb(
                            serie: snapshot.data[7],
                          ),
                        ),
                        Expanded(
                          child: SerieCardWeb(
                            serie: snapshot.data[8],
                          ),
                        ),
                        Expanded(
                          child: SerieCardWeb(
                            serie: snapshot.data[9],
                          ),
                        ),
                      ],
                    ))
                  ],
                )
              : Center(
                  child: Text(
                    "nothing to show",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
        });
  }
}
