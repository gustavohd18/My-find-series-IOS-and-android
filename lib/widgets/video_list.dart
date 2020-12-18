import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:youtube_api/youtube_api.dart';

class VideoList extends StatelessWidget {
  final Future<List<YT_API>> _future;

  VideoList(this._future);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<YT_API>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
                child: CircularProgressIndicator(),
              );
        }

        return snapshot.hasData && snapshot.data.length > 0
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(4.0),
                itemCount: snapshot.data.length,
                itemBuilder: (_, int position) {
                  final item = snapshot.data[position];
                  return FlatButton(
                      child: Image.network(item.thumbnail['default']['url']),
                      onPressed: () {
                        if (item != null) {
                          playYoutubeVideo(item.id);
                        }
                      });
                })
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  void playYoutubeVideo(key) {
    Container(
      width: 50,
      height: 50,
      child: FlutterYoutube.playYoutubeVideoById(
        apiKey: "AIzaSyDbgmL1dVIJ57XMiJMDOWg9Iyv1UqcxJi8",
        videoId: key,
        autoPlay: false,
      ),
    );
  }
}
