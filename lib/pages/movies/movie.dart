import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myFindMovies/pages/share/share.dart';
import 'package:myFindMovies/stores/movies/movies_controller.dart';
import 'package:myFindMovies/widgets/movies/movies_list.dart';
import 'package:myFindMovies/pages/settings/settings.dart';
import 'package:myFindMovies/widgets/home/drawer_menu.dart';
import 'package:myFindMovies/pages/serie/serie.dart';
import 'package:myFindMovies/pages/home/home.dart';
import 'package:myFindMovies/pages/favorite/favorite.dart';

class Movie extends StatefulWidget {
  @override
  MovieState createState() => MovieState();
}

class MovieState extends ModularState<Movie, MoviesController> {
  final searchTextController = TextEditingController();
  String searchText = "";

  @override
  void initState() {
    super.initState();
    // this should not be done in build method.
    this.controller.reload();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerMenu(
            Main(), Favorite(), Series(), Movie(), Settings(), Share(), true),
        appBar: AppBar(
          title: Observer(
            builder: (_) => Text(this.controller.title),
          ),
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
                Observer(
                  builder: (_) => Flexible(
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
                        labelText: this.controller.search,
                        hintText: this.controller.search,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          tooltip: this.controller.search,
                          onPressed: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
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
                ),
              ]),
              padding: EdgeInsets.all(10),
            ),
            if (searchText.length > 0)
              Expanded(
                  child: MoviesList(
                      this.controller.searchMovies(searchText), true))
          ],
        )));
  }

  void _reloadTab() {
    setState(() {});
  }
}
