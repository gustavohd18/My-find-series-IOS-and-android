import 'package:flutter/material.dart';

Widget movieCard(String posterUrl, String title, String description) {
  final image = "https://image.tmdb.org/t/p/w185$posterUrl";
  return Card(
      child: Container(
    padding: EdgeInsets.all(32.0),
    child: Column(
      children: <Widget>[
        Image.network(
          image,
          // width: 130 work in android,
        ),
        Text(title),
        // Text(description),
      ],
    ),
  ));
}
