// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$movieListAtom = Atom(name: '_HomeControllerBase.movieList');

  @override
  Future<List<MovieList>> get movieList {
    _$movieListAtom.reportRead();
    return super.movieList;
  }

  @override
  set movieList(Future<List<MovieList>> value) {
    _$movieListAtom.reportWrite(value, super.movieList, () {
      super.movieList = value;
    });
  }

  final _$serieListAtom = Atom(name: '_HomeControllerBase.serieList');

  @override
  Future<List<SerieList>> get serieList {
    _$serieListAtom.reportRead();
    return super.serieList;
  }

  @override
  set serieList(Future<List<SerieList>> value) {
    _$serieListAtom.reportWrite(value, super.serieList, () {
      super.serieList = value;
    });
  }

  final _$topSeriesAtom = Atom(name: '_HomeControllerBase.topSeries');

  @override
  String get topSeries {
    _$topSeriesAtom.reportRead();
    return super.topSeries;
  }

  @override
  set topSeries(String value) {
    _$topSeriesAtom.reportWrite(value, super.topSeries, () {
      super.topSeries = value;
    });
  }

  final _$topMoviesAtom = Atom(name: '_HomeControllerBase.topMovies');

  @override
  String get topMovies {
    _$topMoviesAtom.reportRead();
    return super.topMovies;
  }

  @override
  set topMovies(String value) {
    _$topMoviesAtom.reportWrite(value, super.topMovies, () {
      super.topMovies = value;
    });
  }

  final _$titleAtom = Atom(name: '_HomeControllerBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  @override
  String toString() {
    return '''
movieList: ${movieList},
serieList: ${serieList},
topSeries: ${topSeries},
topMovies: ${topMovies},
title: ${title}
    ''';
  }
}
