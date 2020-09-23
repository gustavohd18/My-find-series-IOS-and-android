import 'dart:async';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/model/VideoContentList.dart';
import 'package:myFindMovies/model/shareContent.dart';
import 'package:myFindMovies/service/content_handle_abstract.dart';

class ContentHandleMock implements ContentHandleAbs {
  Future<List<MovieList>> getMovieList() async {
    final movie = MovieList(
        id: "test",
        title: "Avengers",
        overview: "test two",
        voteAverage: "5",
        posterPath: "http",
        backdropPath: "http2",
        releaseDate: "23/08",
        videoUrl: "youtube");

    final list = [movie];

    return list;
  }

  Future<List<SerieList>> getSerieList() async {
    final serie = SerieList(
        id: "test",
        originalName: "How I met your mother",
        overview: "test two",
        voteAverage: "5",
        posterPath: "http",
        backdropPath: "http2",
        releaseDate: "23/08",
        videoUrl: "youtube");

    final list = [serie];

    return list;
  }

  Future<List<MovieList>> searchMovies(keyword) async {
    final movie = MovieList(
        id: "test",
        title: "Avengers",
        overview: "test two",
        voteAverage: "5",
        posterPath: "http",
        backdropPath: "http2",
        releaseDate: "23/08",
        videoUrl: "youtube");

    final list = [movie];

    return list;
  }

  Future<List<SerieList>> searchSeries(keyword) async {
    final serie = SerieList(
        id: "test",
        originalName: "How I met your mother",
        overview: "test two",
        voteAverage: "5",
        posterPath: "http",
        backdropPath: "http2",
        releaseDate: "23/08",
        videoUrl: "youtube");

    final list = [serie];

    return list;
  }

  Future<List<VideoContentList>> videoMovies(id) async {
    final videos = VideoContentList(
        id: "test",
        iso: "How I met your mother",
        iso2: "test two",
        key: "5",
        name: "test",
        site: "test",
        size: "23",
        type: "youtube");

    final list = [videos];

    return list;
  }

  Future<List<MovieList>> searchMoviesPage(keyword, page) async {
    final movie = MovieList(
        id: "test",
        title: "Avengers",
        overview: "test two",
        voteAverage: "5",
        posterPath: "http",
        backdropPath: "http2",
        releaseDate: "23/08",
        videoUrl: "youtube");

    final list = [movie];

    return list;
  }

  Future<List<SerieList>> searchSeriesPage(keyword, page) async {
    final serie = SerieList(
        id: "test",
        originalName: "How I met your mother",
        overview: "test two",
        voteAverage: "5",
        posterPath: "http",
        backdropPath: "http2",
        releaseDate: "23/08",
        videoUrl: "youtube");

    final list = [serie];

    return list;
  }

  Stream<List<ShareContent>> getShareList(String email) {
    final share = ShareContent();

    return null;
  }

  Future<bool> addShareContent(ShareContent shareContent) async {
    return shareContent != null;
  }

  void deleteShareContent(ShareContent shareContent) async {}
}
