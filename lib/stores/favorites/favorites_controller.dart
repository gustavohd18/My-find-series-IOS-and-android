import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:myFindMovies/model/FavoriteList.dart';
import 'package:myFindMovies/service/content_handle_abstract.dart';
import 'package:myFindMovies/service/database/favoriteDatabase.dart';
import 'package:myFindMovies/service/translator/languages.dart';
import 'package:myFindMovies/service/translator/translator.dart';
part 'favorites_controller.g.dart';

class FavoritesController = _FavoritesControllerBase with _$FavoritesController;

abstract class _FavoritesControllerBase with Store {
  final ContentHandleAbs contentHandle = Modular.get();
  final FavoriteDatabase dbHelper = Modular.get();
  final _translator = Modular.get<Translator>();

  _FavoritesControllerBase() {
    _loadContent();
    _getTranslator();
  }

  @observable
  Future<List<FavoriteList>> favoriteList;

  @observable
  String title = 'Favorites';

  @observable
  String text = 'No have Favorites';

  void _loadContent() {
    favoriteList = dbHelper.getFavorites();
  }

  void _getTranslator() async {
    var result = await _translator.getLanguage();

    if (result == Languages.english) {
      title = "Favorites";
      text = "No have Favorites";
    } else if (result == Languages.portuguese) {
      title = "Favoritos";
      text = "Nenhum favorito na lista";
    } else {
      title = "Marcadores";
      text = "No hay favoritos en la lista";
    }
  }

  void reload() async {
    _loadContent();
    _getTranslator();
  }
}
