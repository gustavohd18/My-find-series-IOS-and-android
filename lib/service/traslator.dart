import 'package:shared_preferences/shared_preferences.dart';

class Traslator {
  bool _isSomething = true;
  isPortuguese() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String language = (prefs.getString('pt') ?? 'es');

    print(language == "pt");

    return language == "pt";
  }

  setLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (language == 'Portuguese') {
      _isSomething = true;
      await prefs.setString('pt', 'pt');
      print("cheguei aqui no portugues");
      return 'pt';
    } else {
      _isSomething = false;

      await prefs.setString('pt', 'es');
      print("cheguei aqui no ingles");
      return 'es';
    }
  }

  String portuguese() {
    if (isPortuguese()) {
      return 'Português';
    } else {
      return 'Portuguese';
    }
  }

  String english() {
    if (!isPortuguese()) {
      return 'English';
    } else {
      return 'Inglês';
    }
  }
}
