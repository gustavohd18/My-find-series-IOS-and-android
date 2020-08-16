import 'package:flutter/material.dart';
import 'package:myFindMovies/pages/home/home.dart';
import 'package:myFindMovies/service/traslator.dart';
import 'package:myFindMovies/widgets/favorite/favorites_list.dart';
import 'package:myFindMovies/model/FavoriteList.dart';
import 'package:myFindMovies/service/database/favoriteDatabase.dart';
import 'package:myFindMovies/pages/movies/movie.dart';
import 'package:myFindMovies/pages/settings/settings.dart';
import 'package:myFindMovies/widgets/home/drawer_menu.dart';
import 'package:myFindMovies/pages/serie/serie.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final dbHelper = FavoriteDatabase.instance;

  Future<List<FavoriteList>> _favoriteList;
  bool _isPortugues = true;
  String _text = " ";

  String _myHandler;

  @override
  void initState() {
    super.initState();
    _favoriteList = dbHelper.getFavorites();
    getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(),
      drawer: DrawerMenu(Main(), Favorite(), Series(), Movie(),
          Settings(_reloadTab), _isPortugues),
      appBar: AppBar(
        title: Text(_myHandler),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
    );
  }

  Widget _buildScreen() {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: FavoritesList(
              _favoriteList, _reloadFavorite, _isPortugues, _text),
        ),
      ],
    ));
  }

  void _reloadFavorite() {
    setState(() {
      _favoriteList = dbHelper.getFavorites();
    });
  }

  void _reloadTab() {
    setState(() {
      getLanguage();
    });
  }

  Future<Null> getLanguage() async {
    bool isPortuguese = await Traslator().isPortuguese();
    setState(() {
      _isPortugues = isPortuguese;
      _favoriteList = dbHelper.getFavorites();
      _text = (isPortuguese == false)
          ? "Nenhum favorito na lista"
          : "No have Favorite";

      _myHandler = (isPortuguese == false) ? "Favoritos" : "Favorites";
    });
  }
}
