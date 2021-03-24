import 'package:intl/intl.dart';

class Content {
  Content({
    this.id,
    this.title,
    this.overview,
    this.voteAverage,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
  });

  final String id,
      title,
      overview,
      posterPath,
      backdropPath,
      releaseDate,
      voteAverage;

  factory Content.movieFromJSON(Map<String, dynamic> json) {
    return Content(
      id: json['id'].toString(),
      title: json['title'].toString(),
      overview: json['overview'].toString(),
      voteAverage: json['vote_average'].toString(),
      releaseDate: json['release_date'].toString(),
      posterPath: json['poster_path'].toString(),
      backdropPath: json['backdrop_path'].toString() ?? null,
    );
  }

  factory Content.seriesFromJSON(Map<String, dynamic> json) {
    final dateParser = DateTime.parse(json['first_air_date']);
    final dateFormatter = DateFormat('yMMM');
    String finalDate = (dateFormatter.format(dateParser)).toString();
    return Content(
      id: json['id'].toString(),
      title: json['original_name'].toString(),
      overview: json['overview'].toString(),
      voteAverage: json['vote_average'].toString(),
      posterPath: json['poster_path'].toString(),
      backdropPath: json['backdrop_path'].toString() ?? null,
      releaseDate: finalDate.replaceAll(',', ''),
    );
  }
}
