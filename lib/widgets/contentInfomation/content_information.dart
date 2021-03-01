import 'package:flutter/material.dart';

class ContentInformation extends StatelessWidget {
  ContentInformation(
      {@required this.urlImage, this.title, this.rate, this.type});

  final String urlImage, title, rate, type;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      urlImage,
                      fit: BoxFit.fill,
                      width: 60,
                      height: 70,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child:
                          Text(type, style: TextStyle(color: Colors.white54)))
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 15, top: 20),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text(rate, style: TextStyle(color: Colors.white))
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: (type.toLowerCase() == "movie")
              ? Colors.blue[300]
              : Colors.purple[300]),
    );
  }
}
