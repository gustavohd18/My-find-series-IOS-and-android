import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/model/VideoContentList.dart';
import 'package:myFindMovies/model/shareContent.dart';

abstract class ContentHandleAbs {
  Future<List<MovieList>> getMovieList();
  Future<List<SerieList>> getSerieList();
  Future<List<MovieList>> searchMovies(String keyword);
  Future<List<SerieList>> searchSeries(String keyword);
  Future<List<VideoContentList>> videoMovies(String id);
  void deleteShareContent(ShareContent shareContent);
  Future<bool> addShareContent(ShareContent shareContent);
  Stream<List<ShareContent>> getShareList(String email);
  Future<List<SerieList>> searchSeriesPage(String keyword, String page);
  Future<List<MovieList>> searchMoviesPage(String keyword, String page);
}
