import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/movies/moviesListRequest.dart';
import 'package:myFindMovies/service/content_handle.dart';

class Movie extends StatefulWidget {
  @override
  MovieState createState() => MovieState();
}

class MovieState extends State<Movie> {
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
                  labelText: "Search for movies",
                  hintText: "Search",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    tooltip: 'Search Movies',
                    onPressed: () {
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
                  moviesListRequest(ContentHandler().searchMovies(searchText)))
      ],
    ));
  }
}
