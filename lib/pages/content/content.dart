import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myFindMovies/model/shareContent.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';
import 'package:myFindMovies/service/content_handle.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:myFindMovies/service/database/favoriteDatabase.dart';
import 'package:myFindMovies/model/FavoriteList.dart';
import 'package:myFindMovies/stores/content/content_controller.dart';
import 'package:myFindMovies/widgets/content/image.dart';
import 'package:myFindMovies/widgets/utils/stars.dart';
import 'package:youtube_api/youtube_api.dart';

class Content extends StatefulWidget {
  final String id, title, information, voteAverage, posterPath, messages;
  final bool isMovie, isFavorite, isPortuguese;
  final BuildContext contextFinal;
  final Function() f;

  final AuthenticationService authenticationService = AuthenticationService();

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
      this.messages,
      this.f});

  // reference to our single class that manages the database
  final dbHelper = FavoriteDatabase.instance;

  final myController = TextEditingController();

  final myController2 = TextEditingController();

  var isFavorite2 = true;

  final YoutubeAPI ytApi =
      YoutubeAPI("AIzaSyDbgmL1dVIJ57XMiJMDOWg9Iyv1UqcxJi8");
  List<YT_API> ytResult = [];

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends ModularState<Content, ContentController> {
  @override
  void initState() {
    super.initState();
    this.controller.reload();
    setFavorite();
    callAPI();
  }

  callAPI() async {
    String query = widget.title + "analise";
    widget.ytResult = await widget.ytApi.search(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    final media = (widget.voteAverage != null)
        ? double.parse(widget.voteAverage).round()
        : 3;
    String _url;

    if (widget.isMovie) {
      ContentHandler().videoMovies(widget.id).then((data) {
        _url = data[0].key;
      }, onError: (e) {
        print(e);
      });
    } else {
      ContentHandler().videoSeries(widget.id).then((data) {
        _url = data[0].key;
      }, onError: (e) {
        print(e);
      });
    }
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        ImageWidget(widget.posterPath),
        SizedBox(height: 16.0),
        Padding(
          padding: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: Container(width: 10, height: 10, child: Stars(media))),
        SizedBox(height: 16.0),
        Align(
            alignment: Alignment.bottomRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    child: (_url != null) ? Wrap() : Text('Trailer'),
                    onPressed: () {
                      print(_url);
                      playYoutubeVideo(_url);
                    },
                  ),
                ),
                Expanded(
                  child:  FlatButton(
                    child: (widget.ytResult != null) ? Text('Review'): Wrap(),
                    onPressed: () {
                      if(widget.ytResult != null){
                        playYoutubeVideo(widget.ytResult[0].id);
                      }
                    },
                  ),
                ),
                Observer(
                  builder: (_) => Expanded(
                    child: FlatButton(
                      child: (this.controller.isFavoriteContent == true)
                          ? Text(this.controller.delete)
                          : Text(this.controller.add),
                      onPressed: () {
                        if (this.controller.isFavoriteContent) {
                          widget.dbHelper.delete(widget.id);
                          this.controller.setIsFavorite(false);
                          //maybe will no need more this function because open new screen
                          if (widget.f != null) {
                            widget.f();
                          }

                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                Future.delayed(Duration(milliseconds: 300), () {
                                  Navigator.of(context).pop(true);
                                });
                                return AlertDialog(
                                  title: Icon(Icons.check),
                                  content: Text(
                                    this.controller.removed,
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              });
                        } else {
                          this.controller.setIsFavorite(true);
                          String _isMovies;

                          if (widget.isMovie) {
                            _isMovies = 's';
                          } else {
                            _isMovies = 'n';
                          }
                          final _favorite = FavoriteList.origin(
                              widget.id,
                              widget.title,
                              widget.information,
                              widget.voteAverage,
                              widget.posterPath,
                              _url,
                              _isMovies);
                          widget.dbHelper.insertFavorite(_favorite);
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                Future.delayed(Duration(milliseconds: 500), () {
                                  Navigator.of(context).pop(true);
                                });
                                return AlertDialog(
                                  title: Icon(Icons.check),
                                  content: Text(
                                    this.controller.added,
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              });
                        }
                      },
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => Expanded(
                    child: FlatButton(
                      onPressed: () {
                        String _isMovies;

                        if (widget.isMovie) {
                          _isMovies = 's';
                        } else {
                          _isMovies = 'n';
                        }

                        String overview = widget.information;

                        final shareContent = ShareContent(
                            id: widget.id,
                            title: widget.title,
                            overview: overview,
                            voteAverage: widget.voteAverage,
                            posterPath: widget.posterPath,
                            url: _url,
                            isMovie: _isMovies,
                            email: "",
                            message: "");

                        Widget cancelButton = FlatButton(
                          child: Text(this.controller.close),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        );

                        Widget confirmButton = FlatButton(
                          child: Text(this.controller.send),
                          onPressed: () {
                            if (widget.myController.text != '') {
                              shareContent.email = widget.myController.text;
                              shareContent.message =
                                  "${this.controller.getAuthEmail()}: ${widget.myController2.text}";
                              ContentHandler().addShareContent(shareContent);
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
                                        this.controller.ok,
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  });
                            } else {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    Future.delayed(Duration(milliseconds: 300),
                                        () {
                                      Navigator.of(context).pop(true);
                                    });
                                    return AlertDialog(
                                      title: Icon(Icons.error),
                                      content: Text(
                                        this.controller.error,
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  });
                            }
                          },
                        );

                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "${this.controller.sendContent}: ${widget.title}",
                                  textAlign: TextAlign.center,
                                ),
                                content: _dialogReset(this.controller.message),
                                actions: [confirmButton, cancelButton],
                              );
                            });
                      },
                      child: Text(this.controller.cancel),
                    ),
                  ),
                ),
              ],
            )),
        SizedBox(height: 16.0),
        Padding(
          padding: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Text(
            widget.information,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
        SizedBox(height: 16.0),
        (widget.messages != null)
            ? Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                child: Column(children: [
                  Observer(
                    builder: (_) => Text(
                      this.controller.messageField,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Text(
                    widget.messages,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ]),
              )
            : Wrap()
      ],
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

  Container _dialogReset(String _message) {
    return Container(
      width: 300,
      height: 150,
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              icon: Icon(Icons.mail_outline),
            ),
            controller: widget.myController,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: _message,
              icon: Icon(Icons.message),
            ),
            controller: widget.myController2,
          ),
        ],
      ),
    );
  }

  void setFavorite() async {
    widget.isFavorite2 = await this.controller.isFavorite(widget.id);
    this.controller.setIsFavorite(widget.isFavorite2);
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
