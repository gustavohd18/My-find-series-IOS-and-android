class Cast {
  Cast({
    this.id,
    this.character,
    this.name,
    this.profilePath,
  });

  final String id, character, name, profilePath;

  factory Cast.fromJSON(Map<String, dynamic> json) {
    return Cast(
      id: json['cast_id'].toString(),
      character: json['character'].toString(),
      name: json['name'].toString(),
      profilePath: json['profile_path'].toString(),
    );
  }
}
