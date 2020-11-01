import 'package:flutter_test/flutter_test.dart';
import 'package:myFindMovies/service/translator/languages.dart';
import 'package:myFindMovies/service/translator/translator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('Should be set language correct', () async {
    SharedPreferences.setMockInitialValues({}); //set values here
    SharedPreferences pref = await SharedPreferences.getInstance();
    var translator = Translator();

    translator.setLanguage(Languages.english);
    var result = await translator.getLanguage();

    expect(result, Languages.english);

    translator.setLanguage(Languages.portuguese);
    var result2 = await translator.getLanguage();

    expect(result2, Languages.portuguese);

    translator.setLanguage(Languages.spanish);
    var result3 = await translator.getLanguage();

    expect(result3, Languages.spanish);
  });
}
