import 'package:myFindMovies/model/FavoriteList.dart';

abstract class IFavorites {
  Future<void> insertFavorite(FavoriteList favorite);
  Future<List<FavoriteList>> getFavorites();
  Future<void> delete(String id);
}
