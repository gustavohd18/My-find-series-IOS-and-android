import 'package:myFindMovies/service/translator/languages.dart';
import 'package:myFindMovies/service/translator/translator.dart';

class MockTranslator implements Translator {
  var _mock = 'es';
  void setLanguage(Languages language) {
    if (language == Languages.portuguese) {
      _mock = 'pr';
    } else if (language == Languages.english) {
      _mock = 'es';
    } else {
      _mock = 'sp';
    }
  }

  String getMock() {
    return _mock;
  }

  Future<Languages> getLanguage() async {
    if (_mock == 'pr') {
      return Languages.portuguese;
    } else if (_mock == 'es') {
      return Languages.english;
    } else {
      return Languages.spanish;
    }
  }
}
