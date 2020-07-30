import 'package:flutter/material.dart';
import 'package:myFindMovies/service/database/favoriteDatabase.dart';
import 'package:myFindMovies/model/FavoriteList.dart';

Widget movieCard(String id, String posterUrl, String title, String average,
    BuildContext context) {
  final dbHelper = FavoriteDatabase.instance;
  final favorite = FavoriteList.origin(id, title, posterUrl, average);
  final image = "https://image.tmdb.org/t/p/w185$posterUrl";
  final media = (average != null) ? double.parse(average).round() : 3;
  return Card(
      child: Container(
          child: ListTile(
    leading: Image.network(image),
    title: Text(title),
    subtitle: stars(media),
    trailing: Icon(Icons.movie, color: Colors.black),
    onTap: () {
      dbHelper.insertFavorite(favorite);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('added to Favorite'),
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
