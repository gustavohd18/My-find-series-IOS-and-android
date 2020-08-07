import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/content/dialog_information.dart';
import 'package:myFindMovies/widgets/utils/stars.dart';

class FavoriteCard extends StatelessWidget {
  final String id, title, information, voteAverage, posterPath;
  final bool isMovie;

  final Function() f;

  FavoriteCard(this.id, this.title, this.information, this.voteAverage,
      this.posterPath, this.isMovie, this.f);

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
        if (f != null) {
          f();
        }

        showDialog(
          context: context,
          builder: (BuildContext context) => CustomDialog(
            id: id,
            title: title,
            information: information,
            voteAverage: voteAverage,
            posterPath: posterPath,
            isMovie: isMovie,
            isFavorite: true,
            f: f,
          ),
        );
      },
    )));
  }
}
