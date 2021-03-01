import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_find_series_and_movies/widgets/contentInfomation/content_information.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "My find Series And movies", style: GoogleFonts.pacifico(fontSize: 25
        ),
      ),
    ),
    body: ContentInformation(urlImage: "https://cdn.dribbble.com/users/2345673/screenshots/7879826/downloads/movie4.png", title: "Avenger end game", rate: "10", type: "Movie",),
    );
  } 
}
