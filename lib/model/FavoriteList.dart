class FavoriteList {
  FavoriteList(
      {this.id,
      this.title,
      this.overview,
      this.voteAverage,
      this.posterPath,
      this.video,
      this.isMovie});

  FavoriteList.origin(String id, String title, String overview,
      String voteAverage, String posterPath, String video, String isMovie) {
    this.id = id;
    this.title = title;
    this.overview = overview;
    this.voteAverage = voteAverage;
    this.posterPath = posterPath;
    this.video = video;
    this.isMovie = isMovie;
  }

  String id, title, overview, posterPath, voteAverage, video, isMovie;
  // Convert a FavoriteList into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'voteAverage': voteAverage,
      'posterPath': posterPath,
      'video': video,
      'isMovie': isMovie,
    };
  }
}
