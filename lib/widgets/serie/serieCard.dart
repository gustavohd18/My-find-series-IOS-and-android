import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/content/dialog_information.dart';

Widget serieCard(BuildContext context, String id, String title,
    String information, String voteAverage, String posterPath, bool isMovie) {
  final media = (voteAverage != null) ? double.parse(voteAverage).round() : 3;
  final image = "https://image.tmdb.org/t/p/w185$posterPath";
  return Card(
      child: Container(
          child: ListTile(
    leading: Image.network(image),
    title: Text(title),
    subtitle: stars(media),
    trailing: Icon(Icons.slow_motion_video, color: Colors.black),
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(
          id: id,
          title: title,
          information: information,
          voteAverage: voteAverage,
          posterPath: posterPath,
          isMovie: isMovie,
          isFavorite: false,
        ),
      );
    },
  )));
}

Widget stars(int media) {
  if (media >= 0 && media <= 2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 10.0,
        ),
      ],
    );
  } else if (media >= 3 && media <= 5) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 10.0,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 10.0,
        ),
      ],
    );
  } else if (media >= 6 && media <= 7) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 10.0,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 10.0,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 10.0,
        ),
      ],
    );
  } else if (media > 6 && media <= 8) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 10.0,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 10.0,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 10.0,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 10.0,
        ),
      ],
    );
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const <Widget>[
      Icon(
        Icons.star,
        color: Colors.yellow,
        size: 10.0,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow,
        size: 10.0,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow,
        size: 10.0,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow,
        size: 10.0,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow,
        size: 10.0,
      ),
    ],
  );
}
