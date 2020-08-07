import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  final String _text;

  Subtitle(this._text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        _text,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
