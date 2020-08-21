import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/model/VideoContentList.dart';
import 'package:http/http.dart' as http;
import 'package:myFindMovies/model/shareContent.dart';
import 'package:myFindMovies/service/traslator.dart';

class ContentHandler {
  static const String baseURL = "api.themoviedb.org";
  static const String baseSearch = "http://www.omdbapi.com/?apikey=";
  static const String key = "c1abb65895a3fdceff4cfaa0d2dbdfc2";
  static const String TMDB_API_BASE_URL = "https://api.themoviedb.org/3";

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _collectionShares = 'shares';

  var https = http.Client();

  var traslator = Traslator();

  Future<List<MovieList>> getMovieList() async {
    String _language;
    bool isPortuguese = await traslator.isPortuguese();

    if (!isPortuguese) {
      _language = 'pt-BR';
    } else {
      _language = 'en-US';
    }

    final response = await https.get(
        "$TMDB_API_BASE_URL/movie/popular?api_key=$key&language=$_language");

    Map data = jsonDecode(response.body);

    var list = (data['results'] as List)
        .map((listMovies) => MovieList.fromJSON(listMovies))
        .toList();

    if (list.length >= 10) {
      list = list.take(10).toList();
    }

    return list;
  }

  Future<List<SerieList>> getSerieList() async {
    String _language;
    bool isPortuguese = await traslator.isPortuguese();

    if (!isPortuguese) {
      _language = 'pt-BR';
    } else {
      _language = 'en-US';
    }

    final response = await https
        .get("$TMDB_API_BASE_URL/tv/popular?api_key=$key&language=$_language");

    Map data = jsonDecode(response.body);

    var list = (data['results'] as List)
        .map((listSeries) => SerieList.fromJSON(listSeries))
        .toList();

    if (list.length >= 10) {
      list = list.take(10).toList();
    }

    return list;
  }

  // Get list of Movies containing the search keyword
  Future<List<MovieList>> searchMovies(keyword) async {
    String _language;
    bool isPortuguese = await traslator.isPortuguese();

    if (!isPortuguese) {
      _language = 'pt-BR';
    } else {
      _language = 'en-US';
    }
    final response = await https.get(
        "$TMDB_API_BASE_URL/search/movie?query=$keyword&api_key=$key&language=$_language");

    Map data = jsonDecode(response.body);

    List<MovieList> _movies;

    var list = (data['results'] as List)
        .map((item) => MovieList.fromJSON(item))
        .toList();

    int _totPages = (data['total_pages'] as int);

    if (_totPages > 1) {
      List<MovieList> _listResult = await _searchMoviesPage(keyword, 2);
      _movies = _listResult;
    }

    if (_movies != null) {
      return list + _movies;
    } else {
      return list;
    }
  }

  // Get list of Series containing the search keyword
  Future<List<SerieList>> searchSeries(keyword) async {
    String _language;
    bool isPortuguese = await traslator.isPortuguese();
    if (!isPortuguese) {
      _language = 'pt-BR';
    } else {
      _language = 'en-US';
    }

    final response = await https.get(
        "$TMDB_API_BASE_URL/search/tv?query=$keyword&api_key=$key&language=$_language");

    Map data = jsonDecode(response.body);

    List<SerieList> _series;

    var list = (data['results'] as List)
        .map((item) => SerieList.fromJSON(item))
        .toList();

    int _totPages = (data['total_pages'] as int);

    if (_totPages > 1) {
      List<SerieList> _listResult = await _searchSeriesPage(keyword, 2);
      _series = _listResult;
    }

    if (_series != null) {
      return list + _series;
    } else {
      return list;
    }
  }

  // Get list of Videos related with movies
  Future<List<VideoContentList>> videoMovies(id) async {
    final response =
        await https.get("$TMDB_API_BASE_URL/movie/$id/videos?api_key=$key");

    Map data = jsonDecode(response.body);

    var list = (data['results'] as List)
        .map((item) => VideoContentList.fromJSON(item))
        .toList();
    return list;
  }

  // Get list of Videos related with series
  Future<List<VideoContentList>> videoSeries(id) async {
    final response =
        await http.get("$TMDB_API_BASE_URL/tv/$id/videos?api_key=$key");

    Map data = jsonDecode(response.body);

    var list = (data['results'] as List)
        .map((item) => VideoContentList.fromJSON(item))
        .toList();
    return list;
  }

  Future<List<MovieList>> _searchMoviesPage(keyword, page) async {
    String _language;
    bool isPortuguese = await traslator.isPortuguese();
    if (!isPortuguese) {
      _language = 'pt-BR';
    } else {
      _language = 'en-US';
    }
    final response = await https.get(
        "$TMDB_API_BASE_URL/search/movie?api_key=$key&query=$keyword&page=$page&language=$_language");

    Map data = jsonDecode(response.body);

    var list = (data['results'] as List)
        .map((item) => MovieList.fromJSON(item))
        .toList();

    return list;
  }

  Future<List<SerieList>> _searchSeriesPage(keyword, page) async {
    String _language;
    bool isPortuguese = await traslator.isPortuguese();
    if (!isPortuguese) {
      _language = 'pt-BR';
    } else {
      _language = 'en-US';
    }
    final response = await https.get(
        "$TMDB_API_BASE_URL/search/tv?api_key=$key&query=$keyword&page=$page&language=$_language");

    Map data = jsonDecode(response.body);

    var list = (data['results'] as List)
        .map((item) => SerieList.fromJSON(item))
        .toList();

    return list;
  }

  Stream<List<ShareContent>> getShareList(String email) {
    return _firestore
        .collection(_collectionShares)
        .where('email', isEqualTo: email)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      List<ShareContent> _shareDocs = snapshot.docs
          .map((doc) => ShareContent.fromJSON(doc.data()))
          .toList();

      return _shareDocs;
    });
  }

  Future<bool> addShareContent(ShareContent shareContent) async {
    DocumentReference _documentReference =
        await _firestore.collection(_collectionShares).add({
      "id": shareContent.id,
      "title": shareContent.title,
      "overview": shareContent.overview,
      "voteAverage": shareContent.voteAverage,
      "posterPath": shareContent.posterPath,
      "isMovie": shareContent.isMovie,
      "url": shareContent.url,
      "email": shareContent.email,
      "message": shareContent.message
    });
    return _documentReference.id != null;
  }

  void deleteShareContent(ShareContent shareContent) async {
    await _firestore
        .collection(_collectionShares)
        .doc(shareContent.documentID)
        .delete()
        .catchError((error) => print('Error deleting: $error'));
  }
}
