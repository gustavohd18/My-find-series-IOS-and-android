import 'package:flutter/material.dart';
import 'package:myFindMovies/pages/share/share.dart';
import 'package:myFindMovies/service/traslator.dart';
import 'package:myFindMovies/widgets/movies/movies_list.dart';
import 'package:myFindMovies/service/content_handle.dart';
import 'package:myFindMovies/pages/settings/settings.dart';
import 'package:myFindMovies/widgets/home/drawer_menu.dart';
import 'package:myFindMovies/pages/serie/serie.dart';
import 'package:myFindMovies/pages/home/home.dart';
import 'package:myFindMovies/pages/favorite/favorite.dart';

class Movie extends StatefulWidget {
  @override
  MovieState createState() => MovieState();
}

class MovieState extends State<Movie> {
  final searchTextController = TextEditingController();
  String searchText = "";

  bool isPortugues;
  String _searchMovies;
  String _search;
  String _searchPerMovies;
  String _moviesTitle;

  @override
  void initState() {
    super.initState();
    // this should not be done in build method.
    getLanguage();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerMenu(Main(), Favorite(), Series(), Movie(),
            Settings(_reloadTab), Share(), isPortugues),
        appBar: AppBar(
          title: Text(_moviesTitle),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Container(
              child: Row(children: <Widget>[
                Flexible(
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      setState(() {
                        searchText = searchTextController.text;
                      });
                    },
                    controller: searchTextController,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      labelText: _searchMovies,
                      hintText: _search,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        tooltip: _searchPerMovies,
                        onPressed: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          setState(() {
                            searchText = searchTextController.text;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ]),
              padding: EdgeInsets.all(10),
            ),
            if (searchText.length > 0)
              Expanded(
                  child: MoviesList(
                      ContentHandler().searchMovies(searchText), isPortugues))
          ],
        )));
  }

  void _reloadTab() {
    setState(() {
      getLanguage();
    });
  }

  Future<Null> getLanguage() async {
    bool isPortuguese = await Traslator().isPortuguese();
    setState(() {
      isPortugues = isPortuguese;
      _searchMovies = (isPortuguese == false)
          ? "Pesquisa para Filmes"
          : "Search for movies";

      _search = (isPortuguese == false) ? "Pesquisar " : "Search";

      _searchPerMovies =
          (isPortuguese == false) ? "Pesquisar Filme" : 'Search Movies';

      _moviesTitle = (isPortuguese == false) ? "Filme" : 'Movies';
    });
  }
}
