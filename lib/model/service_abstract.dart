
import 'package:my_find_series_and_movies/model/serie.dart';
import 'package:my_find_series_and_movies/model/movies.dart';

abstract class Service {
  Future<List<Movie>> getTop10Movies();
  Future<List<Serie>> getTop10Series();
  void setKey(String key);
  String getKey();
}
