import 'package:intl/intl.dart';

class SerieList {
  SerieList(
      {this.id,
      this.originalName,
      this.overview,
      this.voteAverage,
      this.posterPath,
      this.backdropPath,
      this.releaseDate,
      this.videoUrl});

  final String id,
      originalName,
      overview,
      voteAverage,
      posterPath,
      backdropPath,
      releaseDate;

  String videoUrl;

  factory SerieList.fromJSON(Map<String, dynamic> json) {
    var dateParser = DateTime.parse(json['first_air_date']);
    var dateFormatter = DateFormat('yMMM');
    String finalDate = (dateFormatter.format(dateParser)).toString();
    return SerieList(
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
