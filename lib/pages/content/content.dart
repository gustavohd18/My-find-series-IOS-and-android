import 'package:flutter/material.dart';
import 'package:myFindMovies/service/content_handle.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:myFindMovies/service/database/favoriteDatabase.dart';
import 'package:myFindMovies/model/FavoriteList.dart';
import 'package:myFindMovies/widgets/content/circle_image.dart';
import 'package:myFindMovies/widgets/content/image.dart';

class Content extends StatelessWidget {
  final String id, title, information, voteAverage, posterPath;
  final bool isMovie, isFavorite, isPortuguese;
  final BuildContext contextFinal;
  final Function() f;

  Content(
      {@required this.id,
      @required this.title,
      @required this.information,
      @required this.voteAverage,
      @required this.posterPath,
      @required this.isMovie,
      @required this.isFavorite,
      @required this.isPortuguese,
      this.contextFinal,
      this.f});

  // reference to our single class that manages the database
  final dbHelper = FavoriteDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dialogContent(),
    );
  }

  Widget dialogContent() {
    String _url;
    String delete;
    String add;
    String cancel;
    String added;
    String removed;

    if (isPortuguese) {
      delete = 'delete Favorite';
      add = 'add favorite';
      cancel = 'Close';
      added = 'Added with sucess';
      removed = 'Removed with sucess';
    } else {
      delete = 'deletar dos Favoritos';
      add = 'Adicionar aos favoritos';
      cancel = 'Fechar';
      added = 'Adicionado com sucesso';
      removed = 'Removidos com sucesso';
    }

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
    return Column(
      children: <Widget>[
        ImageWidget(posterPath),
        Container(
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
              Flexible(
                child: Text(
                  information,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
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
                      Expanded(
                        child: FlatButton(
                          child:
                              (isFavorite == true) ? Text(delete) : Text(add),
                          onPressed: () {
                            if (isFavorite) {
                              dbHelper.delete(id);
                              if (f != null) {
                                f();
                              }

                              Navigator.of(contextFinal).pop();
                              showDialog(
                                  context: contextFinal,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    Future.delayed(Duration(milliseconds: 300),
                                        () {
                                      Navigator.of(context).pop(true);
                                    });
                                    return AlertDialog(
                                      title: Icon(Icons.check),
                                      content: Text(
                                        removed,
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
                              Navigator.of(contextFinal).pop();
                              showDialog(
                                  context: contextFinal,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      Navigator.of(context).pop();
                                    });
                                    return AlertDialog(
                                      title: Icon(Icons.check),
                                      content: Text(
                                        added,
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  });
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(contextFinal).pop();
                          },
                          child: Text(cancel),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
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
