import 'package:flutter/material.dart';
import 'package:myFindMovies/pages/movies/movie.dart';
import 'package:myFindMovies/pages/share/share.dart';
import 'package:myFindMovies/service/translator/traslator.dart';
import 'package:myFindMovies/widgets/serie/series_list.dart';
import 'package:myFindMovies/service/content_handle.dart';
import 'package:myFindMovies/pages/settings/settings.dart';
import 'package:myFindMovies/widgets/home/drawer_menu.dart';
import 'package:myFindMovies/pages/home/home.dart';
import 'package:myFindMovies/pages/favorite/favorite.dart';

class Series extends StatefulWidget {
  @override
  SerieState createState() => SerieState();
}

class SerieState extends State<Series> {
  final searchTextController = TextEditingController();
  String searchText = "";
  bool isPortugues;
  String _searchSeries;
  String _search;
  String _searchPerSeries;

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
        drawer: DrawerMenu(Main(), Favorite(), Series(), Movie(), Settings(),
            Share(), isPortugues),
        appBar: AppBar(
          title: Text("Series"),
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
                      focusColor: Colors.black,
                      labelText: _searchSeries,
                      hintText: _search,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        tooltip: _searchPerSeries,
                        onPressed: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          setState(() {
                            searchText = searchTextController.text;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ]),
              padding: EdgeInsets.all(10),
            ),
            if (searchText.length > 0)
              Expanded(
                  child: SeriesList(
                      ContentHandler().searchSeries(searchText), isPortugues))
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
      _searchSeries =
          (isPortuguese == false) ? "Pesquisa por Series" : "Search for Series";

      _search = (isPortuguese == false) ? "Pesquisar" : "Search";

      _searchPerSeries =
          (isPortuguese == false) ? "Pesquisar Series" : 'Search Series';
    });
  }
}
