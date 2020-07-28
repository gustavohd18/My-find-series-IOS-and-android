import 'package:flutter/material.dart';

Widget greeting(String content) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Text(
      content,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
