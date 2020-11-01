import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';
import 'package:myFindMovies/service/content_handle_abstract.dart';
import 'package:myFindMovies/service/translator/languages.dart';
import 'package:myFindMovies/service/translator/translator.dart';
part 'content_controller.g.dart';

class ContentController = _ContentControllerBase
    with _$ContentController;

abstract class _ContentControllerBase with Store {
  final ContentHandleAbs contentHandle = Modular.get();
  final AuthenticationService _authentication = Modular.get();
  final _translator = Modular.get<Translator>();

  _ContentControllerBase() {
    _getTranslator();
  }

  @observable
  String delete = 'delete Favorite';

  @observable
  String add = 'add favorite';

  @observable
  String cancel = 'Share';

  @observable
  String sendContent = 'Share';

  @observable
  String added = 'Added with sucess';

  @observable
  String removed = 'Removed with sucess';

  @observable
  String message = "Message";

  @observable
  String error = "error with share, email blank";

  @observable
  String ok = "shared with success";

  @observable
  String close = "Close";

  @observable
  String send = "Send";

  @observable
  String messageField = "Comment";

   String getAuthEmail() {
    return _authentication.getFirebaseAuth().currentUser.email;
  }

  void _getTranslator() async {
    var result = await _translator.getLanguage();

    if (result == Languages.english) {
      delete = 'delete Favorite';
      add = 'add favorite';
      cancel = 'Share';
      added = 'Added with sucess';
      removed = 'Removed with sucess';
      sendContent = "Share";
      message = "Message";
      error = "error with share, email blank";
      ok = "shared with success";
      close = "Close";
      send = "Send";
      messageField = "Comment";
    } else if (result == Languages.portuguese) {
      delete = 'deletar dos Favoritos';
      add = 'Adicionar aos favoritos';
      cancel = 'Compartilhar';
      added = 'Adicionado com sucesso';
      removed = 'Removidos com sucesso';
      sendContent = "Compartilhar";
      message = "Mensagem";
      error = "falha com o compartilhamento, email em branco";
      ok = "Compartilhado com sucesso";
      close = "Fechar";
      send = "Enviar";
      messageField = "Comentário";
    } else {
      delete = 'eliminar de Favoritos';
      add = 'Añadir a los favoritos';
      cancel = 'Para compartir';
      added = 'Agregado exitosamente';
      removed = 'Eliminado con éxito';
      sendContent = "Para compartir";
      message = "Mensaje";
      error = "falla al compartir, correo electrónico en blanco";
      ok = "Compartido con éxito";
      close = "Cerca";
      send = "Enviar";
      messageField = "Comentario";
    }
  }

  void reload() async {
    _getTranslator();
  }
}
