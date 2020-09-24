import 'package:myFindMovies/service/translator/languages.dart';

abstract class Translator {
  void setLanguage(Languages language);
  Languages getLanguage();
}
