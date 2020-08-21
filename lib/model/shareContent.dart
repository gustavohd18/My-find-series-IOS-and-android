class ShareContent {
  String documentID;
  String id;
  String title;
  String overview;
  String voteAverage;
  String posterPath;
  String isMovie;
  String url;
  String email;
  String message;

  ShareContent({
    this.documentID,
    this.id,
    this.title,
    this.overview,
    this.voteAverage,
    this.posterPath,
    this.isMovie,
    this.url,
    this.email,
    this.message,
  });

  factory ShareContent.fromDoc(dynamic doc) => ShareContent(
        documentID: doc.documentID,
        id: doc["id"],
        title: doc["title"],
        overview: doc["overview"],
        voteAverage: doc["voteAverage"],
        posterPath: doc["posterPath"],
        isMovie: doc["isMovie"],
        url: doc["url"],
        email: doc["email"],
        message: doc["message"],
      );
}
