import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_find_series_and_movies/controller/home.dart';
import 'package:my_find_series_and_movies/model/content.dart';
import 'package:my_find_series_and_movies/responsive.dart';
import 'package:my_find_series_and_movies/util/constants.dart';
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
    Size size = MediaQuery.of(context).size;
    return Responsive(
        mobile: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                Container(
                  height: size.height * 0.4,
                  child: Stack(
                    children: [
                      Container(
                        height: size.height * 0.4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w185${widget.content.posterPath}"),
                                fit: BoxFit.fill)),
                      ),
                      SafeArea(
                          child: BackButton(
                        color: Colors.white,
                      ))
                    ],
                  ),
                ),
                Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10),
                        child: Text(
                          widget.content.title,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      SizedBox(height: kDefaultPadding / 2),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              widget.content.releaseDate.split("-")[0],
                              style: TextStyle(color: kTextLightColor),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.content.overview,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Player(
                        video: this.controller.isMovies.value
                            ? this.controller.videosMovies.value
                            : this.controller.videosSeries.value),
                SizedBox(height: 15),
                SizedBox(
                    height: 160,
                    child: CardList(
                        cast: this.controller.isMovies.value
                            ? this.controller.castMovies.value
                            : this.controller.castSeries.value))
              ],
            ),
          ],
        ),
        tablet: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                Container(
                  height: size.height * 0.4,
                  child: Stack(
                    children: [
                      Container(
                        height: size.height * 0.4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w185${widget.content.posterPath}"),
                                fit: BoxFit.fill)),
                      ),
                      SafeArea(
                          child: BackButton(
                        color: Colors.white,
                      ))
                    ],
                  ),
                ),
                Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10),
                        child: Text(
                          widget.content.title,
                          style: Theme.of(context).textTheme.headline5.copyWith(fontSize: 32),
                        ),
                      ),
                      SizedBox(height: kDefaultPadding / 2),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              widget.content.releaseDate.split("-")[0],
                              style: TextStyle(color: kTextLightColor, fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.content.overview,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Player(
                        video: this.controller.isMovies.value
                            ? this.controller.videosMovies.value
                            : this.controller.videosSeries.value),
                SizedBox(height: 15),
                SizedBox(
                    height: 160,
                    child: CardList(
                        cast: this.controller.isMovies.value
                            ? this.controller.castMovies.value
                            : this.controller.castSeries.value))
              ],
            ),
          ],
        ),
        web: Container());
  }
}
