import 'package:flutter/material.dart';

class CardInformation extends StatelessWidget {
  CardInformation({@required this.urlImage, this.color, this.rate});

  final String urlImage, rate;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 180,
      margin: EdgeInsets.all(10),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(5),
        child: Stack(children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0)),
                  child: Image.network(
                    urlImage,
                    fit: BoxFit.fill,
                    width: 180,
                    height: 200,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 5, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    Text(rate,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15))
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: color),
    );
  }
}
