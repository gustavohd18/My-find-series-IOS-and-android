import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/content/dialog_information.dart';
import 'package:myFindMovies/widgets/utils/stars.dart';

class SeriesCard extends StatelessWidget {
  final String id, title, information, voteAverage, posterPath;
  final bool isMovie;

  SeriesCard(this.id, this.title, this.information, this.voteAverage,
      this.posterPath, this.isMovie);

  @override
  Widget build(BuildContext context) {
    final media = (voteAverage != null) ? double.parse(voteAverage).round() : 3;
    final image = "https://image.tmdb.org/t/p/w185$posterPath";
    return Card(
        child: Container(
            child: ListTile(
      leading: Image.network(image),
      title: Text(title),
      subtitle: Stars(media),
      trailing: Icon(Icons.slow_motion_video, color: Colors.black),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => CustomDialog(
            id: id,
            title: title,
            information: information,
            voteAverage: voteAverage,
            posterPath: posterPath,
            isMovie: isMovie,
            isFavorite: false,
          ),
        );
      },
    )));
  }
}
