

class Movie {
  Movie(
      {this.id,
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


  factory Movie.fromJSON(Map<String, dynamic> json) {
    return Movie(
      id: json['id'].toString(),
      title: json['title'].toString(),
      overview: json['overview'].toString(),
      voteAverage: json['vote_average'].toString(),
      posterPath: json['poster_path'].toString(),
      backdropPath: json['backdrop_path'].toString() ?? null,
    );
  }
}
