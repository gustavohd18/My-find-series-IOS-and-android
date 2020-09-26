import 'package:myFindMovies/service/translator/languages.dart';
import 'package:myFindMovies/service/translator/translator_abstract.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Translator extends ITranslator {
  void setLanguage(Languages language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (language == Languages.portuguese) {
      await prefs.setString('pt', 'pr');
    } else if (language == Languages.english) {
      await prefs.setString('pt', 'es');
    } else {
      await prefs.setString('pt', 'sp');
    }
  }

  Future<Languages> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String language = (prefs.getString('pt') ?? 'es');

    if (language == 'pr') {
      return Languages.portuguese;
    } else if (language == 'es') {
      return Languages.english;
    } else {
      return Languages.spanish;
    }
  }
}
