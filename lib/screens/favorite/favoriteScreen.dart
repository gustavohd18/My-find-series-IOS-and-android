import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/favorite/favoriteList.dart';
import 'package:myFindMovies/model/FavoriteList.dart';
import 'package:myFindMovies/service/database/favoriteDatabase.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final dbHelper = FavoriteDatabase.instance;

  Future<List<FavoriteList>> _favoriteList;

  @override
  void initState() {
    super.initState();
    _favoriteList = dbHelper.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(),
    );
  }

  Widget _buildScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(child: favoriteList(_favoriteList)),
      ],
    );
  }
}
