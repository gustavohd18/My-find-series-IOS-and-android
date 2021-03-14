import 'package:my_find_series_and_movies/model/cast.dart';
import 'package:my_find_series_and_movies/model/content.dart';
import 'package:my_find_series_and_movies/model/youtubeVideo.dart';
import 'package:my_find_series_and_movies/services/imdb_service.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomeController {
  static final HomeController _singleton = HomeController._internal();

  factory HomeController() {
    return _singleton;
  }

  final _imdb = IMDBService("c1abb65895a3fdceff4cfaa0d2dbdfc2");

  final isMovies = RxNotifier<bool>(true);

  final movies = RxNotifier<Future<List<Content>>>(null);

  final series = RxNotifier<Future<List<Content>>>(null);

  final castMovies = RxNotifier<Future<List<Cast>>>(null);

  final castSeries = RxNotifier<Future<List<Cast>>>(null);

  final videosMovies = RxNotifier<Future<YoutubeVideo>>(null);

  final videosSeries = RxNotifier<Future<YoutubeVideo>>(null);

  setIsMovie() {
    isMovies.value = true;
  }

  setIsSeries() {
    isMovies.value = false;
  }

  setTopMovies() {
    movies.value = _imdb.getTop10Movies();
  }

  setTopSeries() {
    series.value = _imdb.getTop10Series();
  }


  setCastMovies(String id) {
    castMovies.value = _imdb.getMovieCast(id);
  }

  setCastSeries(String id) {
    castSeries.value = _imdb.getSeriesCast(id);
  }

  setVideoMovies(String id) {
    videosMovies.value = _imdb.getMovieVideo(id);
  }

  setVideoSeries(String id) {
    videosSeries.value = _imdb.getSerieVideo(id);
  }

  HomeController._internal();
}
