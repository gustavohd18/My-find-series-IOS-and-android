import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  final int media;

  Stars(this.media);

  @override
  Widget build(BuildContext context) {
    return stars();
  }

  Widget stars() {
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
}
