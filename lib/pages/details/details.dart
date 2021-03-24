import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/model/content.dart';
import 'package:my_find_series_and_movies/widgets/bodyDetail/body_detail.dart';

class Details extends StatelessWidget {
  final Content content;
  Details({@required this.content});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyDetails(content: content),
    );
  }
}


