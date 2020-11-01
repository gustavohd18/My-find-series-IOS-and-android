import 'package:shared_preferences/shared_preferences.dart';

class Traslator {
  isPortuguese() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String language = (prefs.getString('pt') ?? 'es');

    return language == "pt";
  }

  setLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (language == 'Portuguese') {
      await prefs.setString('pt', 'pt');
      return 'pt';
    } else {
      await prefs.setString('pt', 'es');
      return 'es';
    }
  }
}
