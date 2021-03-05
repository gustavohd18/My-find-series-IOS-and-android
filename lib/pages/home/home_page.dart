import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_find_series_and_movies/widgets/cardInformation/card_infomation.dart';

//CardInformation(urlImage: "https://lumiere-a.akamaihd.net/v1/images/bigred_ka_vert_brpo_cddc98da.jpeg", color: Colors.blue[300], rate: "10")
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My find Series And movies",
          style: GoogleFonts.pacifico(fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Top 10 popular Movies",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children:<Widget> [

            ],
          )
        ],
      ),
    );
  }
}
