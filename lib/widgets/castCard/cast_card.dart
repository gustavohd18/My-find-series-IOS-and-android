import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/model/cast.dart';
import 'package:my_find_series_and_movies/util/constants.dart';

class CastCard extends StatelessWidget {
  final Cast cast;

  const CastCard({@required this.cast});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: kDefaultPadding),
      width: 80,
      child: Column(
        children: <Widget>[
          Card(
            elevation: 2,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://image.tmdb.org/t/p/w185${cast.profilePath}",
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding / 2),
          Text(
            cast.name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 2,
          ),
          SizedBox(height: kDefaultPadding / 4),
          Text(
            cast.character,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(color: kTextLightColor),
          ),
        ],
      ),
    );
  }
}
