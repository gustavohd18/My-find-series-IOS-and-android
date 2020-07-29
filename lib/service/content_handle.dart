import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/model/SerieList.dart';

class ContentHandler {
  static const String baseURL = "api.themoviedb.org";
  static const String key = "c1abb65895a3fdceff4cfaa0d2dbdfc2";

  final _httpClient = new HttpClient();
  Future<List<MovieList>> getMovieList() async {
    var uri =
        Uri.https(baseURL, '3/movie/popular', <String, String>{'api_key': key});
    var response = await _getRequest(uri);
    var data = json.decode(response);

    var list = (data['results'] as List)
        .take(10)
        .map((listMovie) => MovieList.fromJSON(listMovie))
        .toList();

    return list;
  }

  Future<List<SerieList>> getSerieList() async {
    var uri =
        Uri.https(baseURL, '3/tv/popular', <String, String>{'api_key': key});
    var response = await _getRequest(uri);
    var data = json.decode(response);

    var list = (data['results'] as List)
        .take(10)
        .map((listMovie) => SerieList.fromJSON(listMovie))
        .toList();

    return list;
  }

  Future<String> _getRequest(Uri uri) async {
    var request = await _httpClient.getUrl(uri);
    var response = await request.close();

    return response.transform(utf8.decoder).join();
  }
}
