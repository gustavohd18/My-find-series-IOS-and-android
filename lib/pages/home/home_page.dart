import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_find_series_and_movies/widgets/cardInformation/card_infomation.dart';
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
    body: CardInformation(urlImage: "https://lumiere-a.akamaihd.net/v1/images/bigred_ka_vert_brpo_cddc98da.jpeg", title: "Wandavision", rate: "10"),
    );
  } 
}
