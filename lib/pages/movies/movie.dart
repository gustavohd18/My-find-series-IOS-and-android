import 'package:flutter/material.dart';
import 'package:myFindMovies/service/traslator.dart';
import 'package:myFindMovies/widgets/movies/movies_list.dart';
import 'package:myFindMovies/service/content_handle.dart';

class Movie extends StatefulWidget {
  @override
  MovieState createState() => MovieState();
}

class MovieState extends State<Movie> {
  final searchTextController = TextEditingController();
  String searchText = "";

  bool isPortuguese;
  String _searchMovies;
  String _search;
  String _searchPerMovies;

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
        body: Column(
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
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
          ]),
          padding: EdgeInsets.all(10),
        ),
        if (searchText.length > 0)
          Expanded(child: MoviesList(ContentHandler().searchMovies(searchText)))
      ],
    ));
  }

  Future<Null> getLanguage() async {
    bool isPortuguese = await Traslator().isPortuguese();
    setState(() {
      isPortuguese = isPortuguese;
      _searchMovies = (isPortuguese == false)
          ? "Pesquisa para Filmes"
          : "Search for movies";

      _search = (isPortuguese == false) ? "Pesquisar " : "Search";

      _searchPerMovies =
          (isPortuguese == false) ? "Pesquisar Filme" : 'Search Movies';
    });
  }
}
