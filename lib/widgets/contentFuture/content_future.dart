import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/util/types/content_type.dart';

class ContentFuture extends StatelessWidget {
  final Future<List> future;
  final ContentType type;

  ContentFuture({@required this.future, this.type});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return snapshot.hasData && snapshot.data.length > 0
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(6.0),
                itemCount: snapshot.data.length,
                itemBuilder: (_, int position) {
                  final item = snapshot.data[position];
                  return Text("teste");
                })
            : Center(
                child: Text(
                  "nothing to show",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
      },
    );
  }
}
