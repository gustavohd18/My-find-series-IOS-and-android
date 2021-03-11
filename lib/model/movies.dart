class Movie {
  Movie({
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

final List<Movie> mock = [
  Movie(
     id: "123",
     title: "Vingadores ultimato",
     overview: "historia top",
     posterPath: "https://lumiere-a.akamaihd.net/v1/images/690x0w_br_9e5801a5.jpeg?region=0%2C0%2C690%2C1035",
     backdropPath: "https://lumiere-a.akamaihd.net/v1/images/690x0w_br_9e5801a5.jpeg?region=0%2C0%2C690%2C1035",
     releaseDate: "24/04/12",
    voteAverage:  "8.5"),
      Movie(
     id: "1234",
     title: "Vingadores guerra infinita",
     overview: "historia top",
     posterPath: "https://assets0.minhaserie.com.br/uploads/editor_pictures/000/060/166/content_pic.jpg",
     backdropPath: "https://assets0.minhaserie.com.br/uploads/editor_pictures/000/060/166/content_pic.jpg",
     releaseDate: "24/04/22",
    voteAverage:  "8.5")
];
