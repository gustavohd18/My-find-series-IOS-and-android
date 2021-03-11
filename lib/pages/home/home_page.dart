import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/model/movies.dart';
import 'package:my_find_series_and_movies/util/constants.dart';
import 'package:my_find_series_and_movies/widgets/BodyMenu/body_menu.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        children: [Padding(padding: EdgeInsets.only(top: 10, bottom: 20),  child:BodyMenu()), MovieCarousel()],
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
        aspectRatio: 0.85,
        child: PageView.builder(
          itemCount: mock.length,
          itemBuilder: (context, index) => MovieCard(
              movie: mock[index]
          ),
        ),
      ),
    );
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
          Expanded(child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [kDefaultShadow],
              image: DecorationImage(
                image: NetworkImage(movie.posterPath),
                fit: BoxFit.fill,
              )
            ),
          )
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: Text(movie.title, style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.w600),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.yellow,size: 30,),
              Text(movie.voteAverage, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),)
            ],
          )
        ],
      ),
    );
  }
}
