
import 'content.dart';

abstract class Service {
  Future<List<Content>> getTop10Movies();
  Future<List<Content>> getTop10Series();
  void setKey(String key);
  String getKey();
}
