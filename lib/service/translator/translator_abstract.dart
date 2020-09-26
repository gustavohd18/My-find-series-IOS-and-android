import 'package:myFindMovies/service/translator/languages.dart';

abstract class ITranslator {
  void setLanguage(Languages language);
  Future<Languages> getLanguage();
}
