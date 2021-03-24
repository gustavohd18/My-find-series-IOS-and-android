import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_find_series_and_movies/controller/home.dart';
import 'package:my_find_series_and_movies/model/content.dart';
import 'package:my_find_series_and_movies/responsive.dart';
import 'package:my_find_series_and_movies/util/constants.dart';
import 'package:my_find_series_and_movies/widgets/DetailsInformation/details_information.dart';
import 'package:my_find_series_and_movies/widgets/castList/cast_list.dart';
import 'package:my_find_series_and_movies/widgets/player/player.dart';

class BodyDetails extends StatefulWidget {
  final Content content;
  BodyDetails({@required this.content});

  @override
  _BodyDetailState createState() => _BodyDetailState();
}

class _BodyDetailState extends ModularState<BodyDetails, HomeController> {
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
