import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:myFindMovies/model/FavoriteList.dart';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/service/content_handle_abstract.dart';
import 'package:myFindMovies/service/translator/languages.dart';
import 'package:myFindMovies/service/translator/translator.dart';
part 'movies_controller.g.dart';

class MoviesController = _MoviesControllerBase with _$MoviesController;

abstract class _MoviesControllerBase with Store {
  final ContentHandleAbs contentHandle = Modular.get();
  final _translator = Modular.get<Translator>();

  _MoviesControllerBase() {
    _getTranslator();
  }

  @observable
  Future<List<FavoriteList>> favoriteList;

  @observable
  String title = 'Movies';

  @observable
  String search = 'Search for movies';

  Future<List<MovieList>> searchMovies(String text) {
    return contentHandle.searchMovies(text);
  }

  void _getTranslator() async {
    var result = await _translator.getLanguage();

    if (result == Languages.english) {
      title = "Movies";
      search = "Search for movie";
    } else if (result == Languages.portuguese) {
      title = "Filmes";
      search = "Pesquisar por filmes";
    } else {
      title = "Peliculas";
      search = "Búsqueda de películas.";
    }
  }

  void reload() async {
    _getTranslator();
  }
}
