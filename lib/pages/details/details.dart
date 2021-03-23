import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_find_series_and_movies/controller/home.dart';
import 'package:my_find_series_and_movies/model/content.dart';
import 'package:my_find_series_and_movies/widgets/DetailsInformation/details_information.dart';

class Details extends StatefulWidget {
  final Content content;

  Details({@required this.content});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends ModularState<Details, HomeController> {
  @override
  void initState() {
    super.initState();
    if (this.controller.isMovies.value) {
      this.controller.setCastMovies(widget.content.id);
      this.controller.setVideoMovies(widget.content.id);
    } else {
      this.controller.setCastSeries(widget.content.id);
      this.controller.setVideoSeries(widget.content.id);
    }
  }

  Widget build(BuildContext context) {
    return DetailsInformation(
        video: this.controller.isMovies.value
            ? this.controller.videosMovies.value
            : this.controller.videosSeries.value,
        content: widget.content,
        cast: this.controller.isMovies.value
            ? this.controller.castMovies.value
            : this.controller.castSeries.value);
  }
}
