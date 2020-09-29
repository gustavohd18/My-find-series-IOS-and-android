import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:myFindMovies/service/translator/languages.dart';
import 'package:myFindMovies/service/translator/translator.dart';
part 'settings_controller.g.dart';

class SettingsController = _SettingsControllerBase with _$SettingsController;

abstract class _SettingsControllerBase with Store {
  final _translator = Modular.get<Translator>();

  _SettingsControllerBase() {
    _getTranslator();
  }

  @observable
  String english = 'English';

  @observable
  String portuguese = 'Portuguese';

  @observable
  String spanish = 'Spanish';

  @observable
  String title = 'Settings';

  @observable
  String subTitle = 'Languages';

  void _getTranslator() async {
    var result = await _translator.getLanguage();

    if (result == Languages.english) {
      english = 'English';
      portuguese = 'Portuguese';
      spanish = 'Spanish';
      title = 'Settings';
      subTitle = 'Languages';
    } else if (result == Languages.portuguese) {
      english = 'Inglês';
      portuguese = 'Português ';
      spanish = 'Espanhol';
      title = 'Configurações';
      subTitle = 'Idiomas';
    } else {
      english = 'Inglés';
      portuguese = 'portugués';
      spanish = 'Español';
      title = 'ajustes';
      subTitle = 'Idiomas';
    }
  }

  void setTranslator(int index) async {
    if (index == 0) {
      _translator.setLanguage(Languages.english);
    } else if (index == 1) {
      _translator.setLanguage(Languages.portuguese);
    } else {
      _translator.setLanguage(Languages.spanish);
    }

    _getTranslator();
  }
}
