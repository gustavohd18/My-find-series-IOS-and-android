class FavoriteList {
  FavoriteList({this.id, this.title, this.voteAverage, this.posterPath});

  FavoriteList.origin(
      String id, String title, String voteAverage, String posterPath) {
    this.id = id;
    this.title = title;
    this.voteAverage = voteAverage;
    this.posterPath = posterPath;
  }

  String id, title, posterPath, voteAverage;
  // Convert a FavoriteList into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'voteAverage': voteAverage,
      'posterPath': posterPath,
    };
  }
}
