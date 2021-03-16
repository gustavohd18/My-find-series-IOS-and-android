import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/model/cast.dart';
import 'package:my_find_series_and_movies/model/content.dart';
import 'package:my_find_series_and_movies/model/youtubeVideo.dart';
import 'package:my_find_series_and_movies/responsive.dart';
import 'package:my_find_series_and_movies/util/constants.dart';
import 'package:my_find_series_and_movies/widgets/castList/cast_list.dart';
import 'package:my_find_series_and_movies/widgets/player/player.dart';

class DetailsInformation extends StatelessWidget {
  final Future<YoutubeVideo> video;
  final Content content;
  final Future<List<Cast>> cast;

  DetailsInformation(
      {@required this.video, @required this.content, @required this.cast});

    TextStyle _getTextTitle(BuildContext context) {
      if (Responsive.isMobile(context)) {
        return Theme.of(context).textTheme.headline5;
      } else if (Responsive.isTable(context)) {
        return Theme.of(context).textTheme.headline5.copyWith(fontSize: 32);
      } else {
        return Theme.of(context).textTheme.headline5.copyWith(fontSize: 44);
      }
    }

    TextStyle _getTextReleaseDate(BuildContext context) {
      if (Responsive.isMobile(context)) {
        return TextStyle(color: kTextLightColor);
      } else if (Responsive.isTable(context)) {
        return TextStyle(color: kTextLightColor, fontSize: 20);
      } else {
        return  TextStyle(color: kTextLightColor, fontSize: 26);
      }
    }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          children: [
            Container(
              height: size.height * 0.4,
              child: Stack(
                children: [
                  Player(video: video),
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
                      content.title,
                      style: _getTextTitle(context),
                    ),
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          content.releaseDate.split("-")[0],
                          style: _getTextReleaseDate(context)),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.star,
                          color: kFillStarColor,
                          size: 14,
                        ),
                      ),
                      Text(
                        "${content.voteAverage}/10",
                        style: TextStyle(color: kTextLightColor, fontSize: 12),
                      )
                    ],
                  ),
                ],
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                content.overview,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(height: 15),
            SizedBox(height: 160, child: CardList(cast: cast))
          ],
        ),
      ],
    );

  }
}
