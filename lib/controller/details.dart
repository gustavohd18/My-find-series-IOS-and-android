import 'package:my_find_series_and_movies/model/cast.dart';
import 'package:my_find_series_and_movies/services/imdb_service.dart';
import 'package:rx_notifier/rx_notifier.dart';

class DetailsController {
  static final DetailsController _singleton = DetailsController._internal();

  factory DetailsController() {
    return _singleton;
  }

  final _imdb = IMDBService("c1abb65895a3fdceff4cfaa0d2dbdfc2");

  final castMovies = RxNotifier<Future<List<Cast>>>(null);

  final castSeries = RxNotifier<Future<List<Cast>>>(null);

  setCastMovies(String id) {
    castMovies.value = _imdb.getMovieCast(id);
  }

  setCastSeries(String id) {
    castSeries.value = _imdb.getSeriesCast(id);
  }

  DetailsController._internal();
}
