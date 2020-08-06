import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/content/dialog_information.dart';
import 'package:myFindMovies/widgets/utils/stars.dart';

Widget favoriteCard(
    BuildContext context,
    String id,
    String title,
    String information,
    String voteAverage,
    String posterPath,
    bool isMovie,
    Function() f) {
  final image = "https://image.tmdb.org/t/p/w185$posterPath";
  final media = (voteAverage != null) ? double.parse(voteAverage).round() : 3;
  return Card(
      child: Container(
          child: ListTile(
    leading: Image.network(image),
    title: Text(title),
    subtitle: Stars(media),
    trailing: Icon(Icons.favorite, color: Colors.red),
    onTap: () {
      f();
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(
          id: id,
          title: title,
          information: information,
          voteAverage: voteAverage,
          posterPath: posterPath,
          isMovie: isMovie,
          isFavorite: true,
          f: f,
        ),
      );
      //showAlertDialog(context, id, title, information, voteAverage, posterPath,
      //    isMovie, true);
    },
  )));
}
