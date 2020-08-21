class ShareContent {
  String documentID;
  String id;
  String title;
  String overview;
  String voteAverage;
  String posterPath;
  String isMovie;
  String email;

  ShareContent(
      {this.documentID,
      this.id,
      this.title,
      this.overview,
      this.voteAverage,
      this.posterPath,
      this.isMovie,
      this.email});

  factory ShareContent.fromDoc(dynamic doc) => ShareContent(
        documentID: doc.documentID,
        id: doc["id"],
        title: doc["title"],
        overview: doc["overview"],
        voteAverage: doc["voteAverage"],
        posterPath: doc["posterPath"],
        isMovie: doc["isMovie"],
        email: doc["email"],
      );
}
