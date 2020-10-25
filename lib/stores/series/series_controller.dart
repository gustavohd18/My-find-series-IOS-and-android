import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/service/content_handle_abstract.dart';
import 'package:myFindMovies/service/translator/languages.dart';
import 'package:myFindMovies/service/translator/translator.dart';
part 'series_controller.g.dart';

class SeriesController = _SeriesControllerBase with _$SeriesController;

abstract class _SeriesControllerBase with Store {
  final ContentHandleAbs contentHandle = Modular.get();
  final _translator = Modular.get<Translator>();

  _SeriesControllerBase() {
    _getTranslator();
  }

  @observable
  String title = 'Series';

  @observable
  String search = 'Search for series';

  Future<List<SerieList>> searchSeries(String text) {
    return contentHandle.searchSeries(text);
  }

  void _getTranslator() async {
    var result = await _translator.getLanguage();

    if (result == Languages.english) {
      title = "Series";
      search = "Search for Series";
    } else if (result == Languages.portuguese) {
      title = "Séries";
      search = "Pesquisar por Series";
    } else {
      title = "Serie";
      search = "Búsqueda de Serie";
    }
  }

  void reload() async {
    _getTranslator();
  }
}
