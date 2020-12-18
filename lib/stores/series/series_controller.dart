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

  @observable
  String errorMessage = 'No have Content to word';

  Future<List<SerieList>> searchSeries(String text) {
    return contentHandle.searchSeries(text);
  }

  void _getTranslator() async {
    var result = await _translator.getLanguage();

    if (result == Languages.english) {
      title = "Series";
      search = "Search for Series";
      errorMessage = 'No have Content to word';
    } else if (result == Languages.portuguese) {
      title = "Séries";
      search = "Pesquisar por Series";
      errorMessage = 'Não foi encontrado nenhum item com esta palavra';
    } else {
      title = "Serie";
      search = "Búsqueda de Serie";
      errorMessage = 'No se encontraron elementos con esa palabra';
    }
  }

  void reload() async {
    _getTranslator();
  }
}
