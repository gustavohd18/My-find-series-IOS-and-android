import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/model/serie.dart';
import 'package:my_find_series_and_movies/util/constants.dart';

class SerieCardWeb extends StatelessWidget {
  final Serie serie;

  SerieCardWeb({@required this.serie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: 220,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [kDefaultShadow],
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w185${serie.posterPath}"),
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: Text(
              serie.originalName,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: kFillStarColor,
                size: 20,
              ),
              Text(
                serie.voteAverage,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              )
            ],
          ),
        ],
      ),
    );
  }
}
