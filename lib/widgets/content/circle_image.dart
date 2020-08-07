import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String image;

  CircleImage({
    @required this.image,
  });

  @override
  Widget build(BuildContext context) {
    double _size = 150.0;

    return Center(
      child: Container(
          width: _size,
          height: _size,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      NetworkImage('https://image.tmdb.org/t/p/w185$image')))),
    );
  }
}
