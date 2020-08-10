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
      await prefs.setString('pt', 'pt');
      print("cheguei aqui no portugues");
      return 'pt';
    } else {
      await prefs.setString('pt', 'es');
      print("cheguei aqui no ingles");
      return 'es';
    }
  }
}
