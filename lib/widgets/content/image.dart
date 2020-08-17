import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String posterPath;

  ImageWidget(this.posterPath);

  @override
  Widget build(BuildContext context) {
    final image = "https://image.tmdb.org/t/p/w185$posterPath";
    return SafeArea(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Stack(children: <Widget>[
          Image(
              image: AssetImage('assets/images/movie.jpeg'),
              fit: BoxFit.fill,
              width: 410,
              height: 300),
          Positioned(
            child: Align(
              alignment: Alignment.center,
              child: Image.network(
                image,
                width: 250,
                height: 220,
              ),
            ),
          ),
          Positioned(
            top: 15.0,
            left: 10.0,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 34.0,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
