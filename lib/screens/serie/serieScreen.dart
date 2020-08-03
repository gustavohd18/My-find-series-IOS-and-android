import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/serie/serieListRequest.dart';
import 'package:myFindMovies/service/content_handle.dart';

class Serie extends StatefulWidget {
  @override
  SerieState createState() => SerieState();
}

class SerieState extends State<Serie> {
  final searchTextController = TextEditingController();
  String searchText = "";

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
                  labelText: "Search for series",
                  hintText: "Search",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    tooltip: 'Search Series',
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
              child:
                  serieListRequest(ContentHandler().searchSeries(searchText)))
      ],
    ));
  }
}
