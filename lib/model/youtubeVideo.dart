class YoutubeVideo {
  YoutubeVideo({
    this.id,
    this.key,
    this.name,
  });

  final String id, key, name;

  factory YoutubeVideo.fromJSON(Map<String, dynamic> json) {
    return YoutubeVideo(
      id: json['id'].toString(),
      key: json['key'].toString(),
      name: json['name'].toString(),
    );
  }
}
