import 'package:flutter/material.dart';
import 'package:myFindMovies/pages/content/content.dart';
import 'package:myFindMovies/widgets/content/dialog_content.dart';
import 'package:myFindMovies/widgets/utils/stars.dart';

class ContentCard extends StatelessWidget {
  final String id, title, information, voteAverage, posterPath;
  final bool isMovie, isPortuguese;

  ContentCard(this.id, this.title, this.information, this.voteAverage,
      this.posterPath, this.isMovie, this.isPortuguese);

  @override
  Widget build(BuildContext context) {
    final media = (voteAverage != null) ? double.parse(voteAverage).round() : 3;
    final image = "https://image.tmdb.org/t/p/w185$posterPath";
    return GestureDetector(
        child: Card(
            child: Container(
          height: 10,
          width: 200,
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Flexible(
                child: Image.network(
                  image,
                  width: 130,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
              Padding(padding: EdgeInsets.all(4.0), child: Stars(media))
            ],
          ),
        )),
        onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Content(
                    id: id,
                    title: title,
                    information: information,
                    voteAverage: voteAverage,
                    posterPath: posterPath,
                    isMovie: isMovie,
                    isFavorite: false,
                    isPortuguese: isPortuguese,
                  ),
                ),
              ),
            });
  }
}
