import 'package:flutter/material.dart';
import 'package:myFindMovies/service/traslator.dart';
import 'package:myFindMovies/widgets/serie/series_list.dart';
import 'package:myFindMovies/service/content_handle.dart';

class Series extends StatefulWidget {
  @override
  SerieState createState() => SerieState();
}

class SerieState extends State<Series> {
  final searchTextController = TextEditingController();
  String searchText = "";
  bool isPortuguese;
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
          Expanded(child: SeriesList(ContentHandler().searchSeries(searchText)))
      ],
    ));
  }

  Future<Null> getLanguage() async {
    bool isPortuguese = await Traslator().isPortuguese();
    setState(() {
      isPortuguese = isPortuguese;
      _searchSeries =
          (isPortuguese == false) ? "Pesquisa por Series" : "Search for Series";

      _search = (isPortuguese == false) ? "Pesquisar" : "Search";

      _searchPerSeries =
          (isPortuguese == false) ? "Pesquisar Series" : 'Search Series';
    });
  }
}
