import 'package:flutter/material.dart';
import 'package:myFindMovies/pages/content/content.dart';
import 'package:myFindMovies/widgets/utils/stars.dart';

class FavoriteCard extends StatelessWidget {
  final String id, title, information, voteAverage, posterPath;
  final bool isMovie;
  final bool isPortuguese;

  final Function() f;

  FavoriteCard(this.id, this.title, this.information, this.voteAverage,
      this.posterPath, this.isMovie, this.f, this.isPortuguese);

  @override
  Widget build(BuildContext context) {
    final image = "https://image.tmdb.org/t/p/w185$posterPath";
    final media = (voteAverage != null) ? double.parse(voteAverage).round() : 3;
    return Card(
        child: Container(
            child: ListTile(
      leading: Image.network(image),
      title: Text(title),
      subtitle: Stars(media),
      trailing: Icon(Icons.favorite, color: Colors.red),
      onTap: () {
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
              isFavorite: true,
              f: f,
              isPortuguese: isPortuguese,
            ),
          ),
        );

        if (f != null) {
          f();
        }
      },
    )));
  }
}
