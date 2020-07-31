class VideoContentList {
  VideoContentList(
      {this.id,
      this.iso,
      this.iso2,
      this.key,
      this.name,
      this.site,
      this.size,
      this.type});

  final String id, iso, iso2, key, name, site, size, type;

  factory VideoContentList.fromJSON(Map<String, dynamic> json) {
    return VideoContentList(
      id: json['id'].toString(),
      iso: json['iso_639_1'].toString(),
      iso2: json['iso_3166_1'].toString(),
      key: json['key'].toString(),
      name: json['name'].toString(),
      site: json['site'].toString() ?? null,
      size: json['size'].toString() ?? null,
      type: json['type'].toString() ?? null,
    );
  }
}
