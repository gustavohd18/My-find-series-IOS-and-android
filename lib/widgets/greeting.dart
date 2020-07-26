import 'package:flutter/material.dart';

Widget greeting() {
  return Text(
    'Top 10 movies',
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(fontWeight: FontWeight.bold),
  );
}
