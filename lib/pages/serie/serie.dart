import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myFindMovies/stores/series/series_controller.dart';
import 'package:myFindMovies/widgets/serie/series_list.dart';
import 'package:myFindMovies/widgets/home/drawer_menu.dart';
class Series extends StatefulWidget {
  @override
  SerieState createState() => SerieState();
}

class SerieState extends ModularState<Series, SeriesController> {
  final searchTextController = TextEditingController();
  String searchText = "";

  @override
  void initState() {
    super.initState();
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
        drawer: DrawerMenu(),
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
                        focusColor: Colors.black,
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
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
              padding: EdgeInsets.all(10),
            ),
            if (searchText.length > 0)
              Expanded(
                  child: SeriesList(
                      this.controller.searchSeries(searchText), true, this.controller.errorMessage))
          ],
        )));
  }
}
