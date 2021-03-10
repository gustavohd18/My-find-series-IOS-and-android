
import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/util/constants.dart';
import 'package:my_find_series_and_movies/widgets/BodyMenu/body_menu.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: kDefaultPadding),
          icon: Icon(Icons.menu, color: Colors.black,),
          onPressed: ()=> print("hello"),
          ),
          actions:<Widget> [
            IconButton(
              icon: Icon(Icons.search, color: Colors.black,),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
               onPressed: () => print("oii")
            )
          ],
        ),
        body: BodyMenu(),
    );
  }
}
