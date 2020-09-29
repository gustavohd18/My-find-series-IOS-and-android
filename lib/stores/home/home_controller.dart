import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/service/content_handle_abstract.dart';
import 'package:myFindMovies/service/translator/languages.dart';
import 'package:myFindMovies/service/translator/translator.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ContentHandleAbs contentHandle = Modular.get();
  final _translator = Modular.get<Translator>();

  _HomeControllerBase() {
    _loadContent();
    _getTranslator();
  }

  @observable
  Future<List<MovieList>> movieList;

  @observable
  Future<List<SerieList>> serieList;

  @observable
  String topSeries = 'Top 10 Series in the world';

  @observable
  String topMovies = 'Top 10 Movies in the world';

  @observable
  String title = 'Home';

  void _loadContent() {
    movieList = contentHandle.getMovieList();
    serieList = contentHandle.getSerieList();
  }

  void _getTranslator() async {
    var result = await _translator.getLanguage();

    if (result == Languages.english) {
      title = "Home";
      topSeries = "Top 10 Series in the world";
      topMovies = "Top 10 Movies in the world";
    } else if (result == Languages.portuguese) {
      title = "Inicio";
      topSeries = "Top 10 Series no mundo";
      topMovies = "Top 10 Filmes no mundo";
    } else {
      title = "Comienzo";
      topSeries = "Top 10 Serie en el mundo";
      topMovies = "Top 10 Películas en el mundo";
    }
  }

  void reload() async {
    _loadContent();
    _getTranslator();
  }
}
