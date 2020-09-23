import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/service/content_handle_abstract.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ContentHandleAbs contentHandle = Modular.get();

  _HomeControllerBase() {
    _loadContent();
  }

  @observable
  Future<List<MovieList>> movieList;

  @observable
  Future<List<SerieList>> serieList;

  void _loadContent() {
    movieList = contentHandle.getMovieList();
    serieList = contentHandle.getSerieList();
  }
}
