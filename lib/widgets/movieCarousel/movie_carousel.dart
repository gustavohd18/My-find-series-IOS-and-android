import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/model/movies.dart';
import 'package:my_find_series_and_movies/util/constants.dart';
import 'package:my_find_series_and_movies/widgets/movieCard/movie_card.dart';

import '../../responsive.dart';

class MovieCarousel extends StatefulWidget {
  final Future<List<Movie>> movies;
  MovieCarousel(this.movies);

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
    return FutureBuilder<List<Movie>>(
      future: widget.movies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return snapshot.hasData && snapshot.data.length > 0
            ?     Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: setAspectRatio(),
        child: PageView.builder(
          controller: _pageController,
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) => MovieCard(movie: snapshot.data[index]),
        ),
      ),
    )
            : Center(
                child: Text(
                  "nothing to show",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
      },
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
