import 'package:flutter/material.dart';
import 'package:myFindMovies/service/content_handle.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:myFindMovies/service/database/favoriteDatabase.dart';
import 'package:myFindMovies/model/FavoriteList.dart';
import 'package:myFindMovies/widgets/content/circle_image.dart';

class ContentDialog extends StatelessWidget {
  final String id, title, information, voteAverage, posterPath;
  final bool isMovie, isFavorite;
  final Function() f;

  ContentDialog(
      {@required this.id,
      @required this.title,
      @required this.information,
      @required this.voteAverage,
      @required this.posterPath,
      @required this.isMovie,
      @required this.isFavorite,
      this.f});

  // reference to our single class that manages the database
  final dbHelper = FavoriteDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    String _url;

    if (isMovie) {
      ContentHandler().videoMovies(id).then((data) {
        _url = data[0].key;
      }, onError: (e) {
        print(e);
      });
    } else {
      ContentHandler().videoSeries(id).then((data) {
        _url = data[0].key;
      }, onError: (e) {
        print(e);
      });
    }
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                information,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          child: (_url != null) ? Wrap() : Text('Trailer'),
                          onPressed: () {
                            playYoutubeVideo(_url);
                          },
                        ),
                      ),
                      FlatButton(
                        child: (isFavorite == true)
                            ? Text("delete Favorite")
                            : Text("add favorite"),
                        onPressed: () {
                          if (isFavorite) {
                            dbHelper.delete(id);
                            if (f != null) {
                              f();
                            }

                            Navigator.of(context).pop();
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  Future.delayed(Duration(milliseconds: 300),
                                      () {
                                    Navigator.of(context).pop(true);
                                  });
                                  return AlertDialog(
                                    title: Icon(Icons.check),
                                    content: Text(
                                      'Removed with sucess',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                });
                          } else {
                            String _isMovies;

                            if (isMovie) {
                              _isMovies = 's';
                            } else {
                              _isMovies = 'n';
                            }
                            final _favorite = FavoriteList.origin(
                                id,
                                title,
                                information,
                                voteAverage,
                                posterPath,
                                _url,
                                _isMovies);
                            dbHelper.insertFavorite(_favorite);
                            Navigator.of(context).pop();
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  Future.delayed(Duration(milliseconds: 500),
                                      () {
                                    Navigator.of(context).pop();
                                  });
                                  return AlertDialog(
                                    title: Icon(Icons.check),
                                    content: Text(
                                      'Added with sucess',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                });
                          }
                        },
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('cancel'),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Positioned(
            left: Consts.padding,
            right: Consts.padding,
            child: CircleImage(image: posterPath)),
      ],
    );
  }

  void playYoutubeVideo(key) {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: "key",
      videoUrl: "https://www.youtube.com/watch?v=$key",
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
