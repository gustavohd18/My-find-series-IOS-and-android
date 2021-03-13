import 'package:intl/intl.dart';

class Serie {
  Serie(
      {this.id,
      this.originalName,
      this.overview,
      this.voteAverage,
      this.posterPath,
      this.backdropPath,
      this.releaseDate});

  final String id,
      originalName,
      overview,
      voteAverage,
      posterPath,
      backdropPath,
      releaseDate;

  factory Serie.fromJSON(Map<String, dynamic> json) {
    final dateParser = DateTime.parse(json['first_air_date']);
    final dateFormatter = DateFormat('yMMM');
    String finalDate = (dateFormatter.format(dateParser)).toString();
    return Serie(
      id: json['id'].toString(),
      originalName: json['original_name'].toString(),
      overview: json['overview'].toString(),
      voteAverage: json['vote_average'].toString(),
      posterPath: json['poster_path'].toString(),
      backdropPath: json['backdrop_path'].toString() ?? null,
      releaseDate: finalDate.replaceAll(',', ''),
    );
  }
}
