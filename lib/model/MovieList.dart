import 'package:intl/intl.dart';

class MovieList {
  MovieList(
      {this.id,
      this.title,
      this.overview,
      this.voteAverage,
      this.posterPath,
      this.backdropPath,
      this.releaseDate,
      this.videoUrl});

  final String id,
      title,
      overview,
      posterPath,
      backdropPath,
      releaseDate,
      voteAverage;

  String videoUrl;

  factory MovieList.fromJSON(Map<String, dynamic> json) {
    var dateParser = DateTime.parse(json['release_date']);
    var dateFormatter = DateFormat('yMMM');
    String finalDate = (dateFormatter.format(dateParser)).toString();
    return MovieList(
      id: json['id'].toString(),
      title: json['title'].toString(),
      overview: json['overview'].toString(),
      voteAverage: json['vote_average'].toString(),
      posterPath: json['poster_path'].toString(),
      backdropPath: json['backdrop_path'].toString() ?? null,
      releaseDate: finalDate.replaceAll(',', ''),
    );
  }
}
