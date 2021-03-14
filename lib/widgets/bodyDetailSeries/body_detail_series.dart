import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_find_series_and_movies/controller/details.dart';
import 'package:my_find_series_and_movies/model/serie.dart';
import 'package:my_find_series_and_movies/responsive.dart';
import 'package:my_find_series_and_movies/util/constants.dart';
import 'package:my_find_series_and_movies/widgets/castList/cast_list.dart';

class BodyDetailSeries extends StatefulWidget {
  final Serie serie;
  BodyDetailSeries({@required this.serie});

  @override
  _BodyDetailState createState() => _BodyDetailState();
}

class _BodyDetailState extends ModularState<BodyDetailSeries, DetailsController> {
  @override
  void initState() {
    super.initState();
    this.controller.setCastSeries(widget.serie.id);
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
                                    "https://image.tmdb.org/t/p/w185${widget.serie.posterPath}"),
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
                          widget.serie.originalName,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      SizedBox(height: kDefaultPadding / 2),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              widget.serie.releaseDate.split("-")[0],
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
                    widget.serie.overview,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 160,
                  child: CardList(cast: this.controller.castSeries.value,)
      
                )
              ],
            ),
          ],
        ),
        tablet: Container(),
        web: Container());
  }
}

