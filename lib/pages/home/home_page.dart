import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/model/movies.dart';
import 'package:my_find_series_and_movies/responsive.dart';
import 'package:my_find_series_and_movies/util/constants.dart';
import 'package:my_find_series_and_movies/widgets/BodyMenu/body_menu.dart';

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
            MovieCarousel()
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
            children: [BodyMenu(), Expanded(child: MovieCarousel())],
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
                child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: MovieCardWeb(
                          movie: mock[1],
                        ),
                      ),
                      Expanded(
                        child: MovieCardWeb(
                          movie: mock[1],
                        ),
                      ),
                      Expanded(
                        child: MovieCardWeb(
                          movie: mock[1],
                        ),
                      ),
                      Expanded(
                        child: MovieCardWeb(
                          movie: mock[1],
                        ),
                      ),
                      Expanded(
                        child: MovieCardWeb(
                          movie: mock[1],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: MovieCardWeb(
                        movie: mock[0],
                      ),
                    ),
                    Expanded(
                      child: MovieCardWeb(
                        movie: mock[0],
                      ),
                    ),
                    Expanded(
                      child: MovieCardWeb(
                        movie: mock[0],
                      ),
                    ),
                    Expanded(
                      child: MovieCardWeb(
                        movie: mock[0],
                      ),
                    ),
                    Expanded(
                      child: MovieCardWeb(
                        movie: mock[0],
                      ),
                    ),
                  ],
                ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class MovieCarousel extends StatefulWidget {
  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  PageController _pageController;
  int initialPage = 1;
  double aspectRadio = 0.85;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(viewportFraction: 0.8, initialPage: initialPage);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: setAspectRatio(),
        child: PageView.builder(
          controller: _pageController,
          itemCount: mock.length,
          itemBuilder: (context, index) => MovieCard(movie: mock[index]),
        ),
      ),
    );
  }

  double setAspectRatio() {
    if (Responsive.isMobile(context)) {
      return 0.85;
    } else if (Responsive.isTable(context)) {
      return 1.75;
    } else {
      return 2.0;
    }
  }
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [kDefaultShadow],
                image: DecorationImage(
                  image: NetworkImage(movie.posterPath),
                  fit: BoxFit.fill,
                )),
          )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: Text(
              movie.title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: kFillStarColor,
                size: 30,
              ),
              Text(
                movie.voteAverage,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MovieCardWeb extends StatelessWidget {
  final Movie movie;

  MovieCardWeb({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: 220,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [kDefaultShadow],
                  image: DecorationImage(
                    image: NetworkImage(movie.posterPath),
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: Text(
              movie.title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: kFillStarColor,
                size: 20,
              ),
              Text(
                movie.voteAverage,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              )
            ],
          ),
        ],
      ),
    );
  }
}
