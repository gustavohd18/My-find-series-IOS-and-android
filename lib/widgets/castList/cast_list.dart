import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/model/cast.dart';
import 'package:my_find_series_and_movies/widgets/castCard/cast_card.dart';

class CardList extends StatelessWidget {

  final Future<List<Cast>> cast;

  CardList({@required this.cast});
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cast>>(
      future: cast,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return snapshot.hasData && snapshot.data.length > 0
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) =>
                    CastCard(cast: snapshot.data[index]),
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
      },
    );
  }
}
