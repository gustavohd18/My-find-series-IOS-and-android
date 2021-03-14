import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/model/youtubeVideo.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Player extends StatelessWidget {
  final Future<YoutubeVideo> video;
  Player({@required this.video});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<YoutubeVideo>(
      future: video,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return snapshot.hasData
            ? Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: YoutubePlayerIFrame(
        controller: YoutubePlayerController(
      initialVideoId: snapshot.data.key,
      params: YoutubePlayerParams(
        autoPlay: false,
        showControls: true,
        showFullscreenButton: true,
      ),
    ),
        aspectRatio: 16 / 9,
      ),
    )
            : Center(
                child: Text(
                  "nothing to show",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
      },
    );
  }
}
