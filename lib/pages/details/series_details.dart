import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/model/serie.dart';
import 'package:my_find_series_and_movies/widgets/bodyDetailSeries/body_detail_series.dart';

class SeriesDetails extends StatefulWidget {
  final Serie serie;
  SeriesDetails({@required this.serie});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<SeriesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyDetailSeries(serie: widget.serie),
    );
  }
}
