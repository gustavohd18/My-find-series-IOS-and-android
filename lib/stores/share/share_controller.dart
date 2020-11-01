import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:myFindMovies/model/SerieList.dart';
import 'package:myFindMovies/model/shareContent.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';
import 'package:myFindMovies/service/content_handle_abstract.dart';
import 'package:myFindMovies/service/translator/languages.dart';
import 'package:myFindMovies/service/translator/translator.dart';
part 'share_controller.g.dart';

class ShareController = _ShareControllerBase with _$ShareController;

abstract class _ShareControllerBase with Store {
  final ContentHandleAbs contentHandle = Modular.get();
  final AuthenticationService _authentication = Modular.get();
  final _translator = Modular.get<Translator>();

  _ShareControllerBase() {
    _getTranslator();
  }

  @observable
  String title = 'Shared';

  @observable
  String empty = 'No have content shared';

  Stream<List<ShareContent>> getShareList() {
    return contentHandle
        .getShareList(_authentication.getFirebaseAuth().currentUser.email);
  }

  void _getTranslator() async {
    var result = await _translator.getLanguage();

    if (result == Languages.english) {
      title = "Shared";
      empty = "No have content shared";
    } else if (result == Languages.portuguese) {
      title = "Compartilhados";
      empty = "Nenhum conteúdo compartilhado";
    } else {
      title = "Compartido";
      empty = "No hay contenido compartido en la lista";
    }
  }

  void reload() async {
    _getTranslator();
    getShareList();
  }
}
