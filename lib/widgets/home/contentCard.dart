import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/content/dialog_information.dart';

Widget contentCard(BuildContext context, String id, String title,
    String information, String voteAverage, String posterPath, bool isMovie) {
  final media = (voteAverage != null) ? double.parse(voteAverage).round() : 3;
  final image = "https://image.tmdb.org/t/p/w185$posterPath";
  return GestureDetector(
      child: Card(
          child: Container(
        height: 10,
        width: 200,
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Flexible(
              child: Image.network(
                image,
                width: 130,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            Padding(padding: EdgeInsets.all(4.0), child: stars(media))
          ],
        ),
      )),
      onTap: () => {
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
            )
            //showAlertDialog(context, id, title, information, voteAverage,
            //    posterPath, isMovie, false)
          });
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
