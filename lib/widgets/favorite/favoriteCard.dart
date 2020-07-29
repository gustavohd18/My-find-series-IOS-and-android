import 'package:flutter/material.dart';
import 'package:myFindMovies/service/database/favoriteDatabase.dart';
import 'package:myFindMovies/screens/favorite/favoriteScreen.dart';

Widget favoriteCard(String id, String title, String posterUrl, String average,
    BuildContext context) {
  final dbHelper = FavoriteDatabase.instance;

  final image = "https://image.tmdb.org/t/p/w185$average";
  final media = (posterUrl != null) ? double.parse(posterUrl).round() : 3;
  return Card(
      child: Container(
          child: ListTile(
    leading: Image.network(image),
    title: Text(title),
    subtitle: stars(media),
    trailing: Icon(Icons.favorite, color: Colors.red),
    onTap: () {
      dbHelper.delete(id);
      Favorite();
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('removed to Favorite'),
      ));
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
