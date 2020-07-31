import 'package:flutter/material.dart';
import 'package:myFindMovies/service/content_handle.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:myFindMovies/service/database/favoriteDatabase.dart';
import 'package:myFindMovies/model/FavoriteList.dart';

Widget showAlertDialog(
    BuildContext context,
    String id,
    String title,
    String information,
    String voteAverage,
    String posterPath,
    bool isMovie,
    bool isFavorite) {
  String _url;
  // reference to our single class that manages the database
  final dbHelper = FavoriteDatabase.instance;
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
  // config button
  Widget trailer = FlatButton(
    child: Text("Trailer"),
    onPressed: () {
      playYoutubeVideo(_url);
    },
  );
  Widget favorite = FlatButton(
    child:
        (isFavorite == true) ? Text("remove Favorite") : Text("add favorite"),
    onPressed: () {
      if (isFavorite) {
        dbHelper.delete(id);
        Navigator.of(context).pop();
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('removed to Favorite'),
          ),
        );
      } else {
        String _isMovies;

        if (isMovie) {
          _isMovies = 's';
        } else {
          _isMovies = 'n';
        }
        final _favorite = FavoriteList.origin(
            id, title, information, voteAverage, posterPath, _url, _isMovies);
        dbHelper.insertFavorite(_favorite);
        Navigator.of(context).pop();
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Added to Favorite'),
          ),
        );
      }
    },
  );
  Widget cancel = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // config AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Information"),
    content: Text(information),
    actions: [
      trailer,
      favorite,
      cancel,
    ],
  );
  // show dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void playYoutubeVideo(key) {
  FlutterYoutube.playYoutubeVideoByUrl(
    apiKey: "",
    videoUrl: "https://www.youtube.com/watch?v=$key",
  );
}
