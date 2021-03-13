import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/model/movies.dart';
import 'package:my_find_series_and_movies/responsive.dart';
import 'package:my_find_series_and_movies/util/constants.dart';
import 'package:my_find_series_and_movies/widgets/BodyMenu/body_menu.dart';
import 'package:my_find_series_and_movies/widgets/homeWeb/home_web.dart';
import 'package:my_find_series_and_movies/widgets/movieCarousel/movie_carousel.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            padding: EdgeInsets.only(left: kDefaultPadding),
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () => print("hello"),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                onPressed: () => print("oii"))
          ],
        ),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 10, bottom: 30),
                child: BodyMenu()),
            MovieCarousel(mock)
          ],
        ),
      ),
      tablet: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              padding: EdgeInsets.only(left: kDefaultPadding),
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () => print("hello"),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  onPressed: () => print("oii"))
            ],
          ),
          body: Column(
            children: [BodyMenu(), Expanded(child: MovieCarousel(mock))],
          )),
      web: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            padding: EdgeInsets.only(left: kDefaultPadding),
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () => print("hello"),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                onPressed: () => print("oii"))
          ],
        ),
        body: Column(
          children: [BodyMenu(), Expanded(child: HomeWeb(mock))],
        ),
      ),
    );
  }
}
