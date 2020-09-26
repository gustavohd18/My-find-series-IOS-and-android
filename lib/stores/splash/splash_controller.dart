import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:myFindMovies/service/authentication/authentification_abstract.dart';
import 'package:myFindMovies/service/translator/languages.dart';
import 'package:myFindMovies/service/translator/translator.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final _authentication = Modular.get<Authentication>();
  final _translator = Modular.get<Translator>();

  _SplashControllerBase() {
    _onAuthChanged();
    _getTranslator();
  }

  @observable
  String addUser;

  @observable
  String builtDescription = 'Built with';

  void _onAuthChanged() {
    _authentication.getFirebaseAuth().authStateChanges().listen((user) {
      final String uid = user != null ? user.uid : null;
      addUser = uid;
    });
  }

  void _getTranslator() async {
    var result = await _translator.getLanguage();
    print("resultado");
    print(result);

    if (result == Languages.english) {
      builtDescription = "Built with";
    } else if (result == Languages.portuguese) {
      builtDescription = "Construido com";
    } else {
      builtDescription = "Construido con";
    }

    print(this.builtDescription);
  }
}
