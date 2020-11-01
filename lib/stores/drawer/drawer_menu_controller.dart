import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';
import 'package:myFindMovies/service/content_handle_abstract.dart';
import 'package:myFindMovies/service/translator/languages.dart';
import 'package:myFindMovies/service/translator/translator.dart';
part 'drawer_menu_controller.g.dart';

class DrawerMenuController = _DrawerMenuControllerBase
    with _$DrawerMenuController;

abstract class _DrawerMenuControllerBase with Store {
  final ContentHandleAbs contentHandle = Modular.get();
  final AuthenticationService _authentication = Modular.get();
  final _translator = Modular.get<Translator>();

  _DrawerMenuControllerBase() {
    _getTranslator();
  }

  @observable
  String home = 'Home';

  @observable
  String favorite = 'Favorites';

  @observable
  String movies = 'Movies';
  @observable
  String series = 'Series';

  @observable
  String settings = 'Settings';

  @observable
  String logout = 'Logout';

  @observable
  String shared = 'Shared';

  String getAuthEmail() {
    return _authentication.getFirebaseAuth().currentUser.email;
  }

  void signOut() {
    _authentication.signOut();
  }

  void _getTranslator() async {
    var result = await _translator.getLanguage();

    if (result == Languages.english) {
      home = 'Home';
      favorite = 'Favorites';
      movies = 'Movies';
      series = 'Series';
      settings = 'Settings';
      logout = 'Logout';
      shared = 'Shared';
    } else if (result == Languages.portuguese) {
      home = 'Inicio';
      favorite = 'Favoritos';
      movies = 'Filmes';
      series = 'Séries';
      settings = 'Configurações';
      logout = 'Sair';
      shared = 'Compartilhados';
    } else {
      home = 'Comienzo';

      favorite = 'Marcadores';

      movies = 'Pelicula';
      series = 'Serie';

      settings = 'Marcadores';

      logout = 'Sal';

      shared = 'Compartido';
    }
  }

  void reload() async {
    _getTranslator();
  }
}
