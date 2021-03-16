import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_find_series_and_movies/controller/home.dart';
import 'package:my_find_series_and_movies/responsive.dart';
import 'package:my_find_series_and_movies/util/constants.dart';
import 'package:my_find_series_and_movies/widgets/BodyMenu/body_menu.dart';
import 'package:my_find_series_and_movies/widgets/Carousel/carousel.dart';
import 'package:my_find_series_and_movies/widgets/HomeWeb/home_web.dart';
import 'package:rx_notifier/rx_notifier.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ModularState<Home, HomeController> {

  @override
  void initState() {
    super.initState();
    this.controller.setTopMovies();
    this.controller.setTopSeries();
  }

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
            RxBuilder(
              builder: (_) => this.controller.isMovies.value
                  ? Carousel(this.controller.movies.value)
                  : Carousel(this.controller.series.value),
            )
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
            children: [
              BodyMenu(),
              Expanded(
                  child: RxBuilder(
                builder: (_) => this.controller.isMovies.value
                    ? Carousel(this.controller.movies.value)
                    : Carousel(this.controller.series.value),
              )),
            ],
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
          children: [
            BodyMenu(),
            Expanded(
                child: RxBuilder(
              builder: (_) => this.controller.isMovies.value
                  ? HomeWeb(this.controller.movies.value)
                  : HomeWeb(this.controller.series.value),
            ))
          ],
        ),
      ),
    );
  }
}
