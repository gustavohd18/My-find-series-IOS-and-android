import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/model/videoMovieList.dart';
import 'package:http/http.dart' as http;

class ContentHandler {
  static const String baseURL = "api.themoviedb.org";
  static const String baseSearch = "http://www.omdbapi.com/?apikey=";
  static const String key = "c1abb65895a3fdceff4cfaa0d2dbdfc2";
  static const String TMDB_API_BASE_URL = "https://api.themoviedb.org/3";

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

  // Get list of Movies containing the search keyword
  Future<List<MovieList>> searchMovies(keyword) async {
    final response = await http
        .get("$TMDB_API_BASE_URL/search/movie?query=$keyword&api_key=$key");

    Map data = jsonDecode(response.body);

    var list = (data['results'] as List)
        .map((item) => MovieList.fromJSON(item))
        .toList();

    return list;
  }

  // Get list of Videos related with video
  Future<List<VideoMovieList>> videoMovies(id) async {
    //http: //api.themoviedb.org/3/movie/157336/videos?api_key=c1abb65895a3fdceff4cfaa0d2dbdfc2
    final response =
        await http.get("$TMDB_API_BASE_URL/movie/$id/videos?api_key=$key");

    Map data = jsonDecode(response.body);

    var list = (data['results'] as List)
        .map((item) => VideoMovieList.fromJSON(item))
        .toList();
    return list;
  }

  // Get list of Videos related with video
  Future<List<VideoMovieList>> videoSeries(id) async {
    //http: //api.themoviedb.org/3/movie/157336/videos?api_key=c1abb65895a3fdceff4cfaa0d2dbdfc2
    final response =
        await http.get("$TMDB_API_BASE_URL/tv/$id/videos?api_key=$key");

    Map data = jsonDecode(response.body);

    var list = (data['results'] as List)
        .map((item) => VideoMovieList.fromJSON(item))
        .toList();
    return list;
  }

  Future<String> _getRequest(Uri uri) async {
    var request = await _httpClient.getUrl(uri);
    var response = await request.close();

    return response.transform(utf8.decoder).join();
  }
}
