import 'package:my_find_series_and_movies/model/youtubeVideo.dart';

import 'content.dart';

abstract class ServiceTMDB {
  Future<List<Content>> getTop10Movies();
  Future<List<Content>> getTop10Series();
  Future<YoutubeVideo> getSerieVideo(String id);
  Future<YoutubeVideo> getMovieVideo(String id);
  void setKey(String key);
  String getKey();
}
