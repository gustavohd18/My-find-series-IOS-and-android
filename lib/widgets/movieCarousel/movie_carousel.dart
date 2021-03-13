import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/model/movies.dart';
import 'package:my_find_series_and_movies/util/constants.dart';
import 'package:my_find_series_and_movies/widgets/movieCard/movie_card.dart';

import '../../responsive.dart';

class MovieCarousel extends StatefulWidget {
  final List<Movie> movies;
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: setAspectRatio(),
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.movies.length,
          itemBuilder: (context, index) => MovieCard(movie: widget.movies[index]),
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
