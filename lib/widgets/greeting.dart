import 'package:flutter/material.dart';

Widget greeting(String content) {
  return Text(
    content,
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(fontWeight: FontWeight.bold),
  );
}
