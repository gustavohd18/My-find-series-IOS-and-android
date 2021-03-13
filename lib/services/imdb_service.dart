import 'dart:convert';
import 'dart:developer';

import 'package:my_find_series_and_movies/model/movies.dart';
import 'package:my_find_series_and_movies/model/serie.dart';

import 'package:http/http.dart' as http;

class IMDBService implements Service {
  String _key;
  IMDBService(this._key);

  static const String TMDB_API_BASE_URL = "https://api.themoviedb.org/3";

  final _https = http.Client();

  void setKey(String key) {
    this._key = key;
  }

  String getKey() {
    return this._key;
  }

  Future<List<Movie>> getTop10Movies() async {
    final String _language = 'en-US';

    final response = await _https.get(
        "$TMDB_API_BASE_URL/movie/popular?api_key=$_key&language=$_language");

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      var list = (data['results'] as List)
          .map((listMovies) => Movie.fromJSON(listMovies))
          .toList();

      if (list.length >= 10) {
        list = list.take(10).toList();
      }

      return list;
    } else {
      throw ("some error happen");
    }
  }

  Future<List<Serie>> getTop10Series() async {
    final String _language = 'en-US';

    final response = await _https
        .get("$TMDB_API_BASE_URL/tv/popular?api_key=$_key&language=$_language");

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      var list = (data['results'] as List)
          .map((listSeries) => Serie.fromJSON(listSeries))
          .toList();

      if (list.length >= 10) {
        list = list.take(10).toList();
      }

      return list;
    } else {
      throw ("some error happen");
    }
  }
}
