import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/model/content.dart';
import 'package:my_find_series_and_movies/widgets/ContentCardWeb/content_card_web.dart';

class HomeWeb extends StatelessWidget {
  final Future<List<Content>> contents;

  HomeWeb(this.contents);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Content>>(
        future: contents,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return snapshot.hasData && snapshot.data.length > 0
              ? Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ContentCardWeb(
                              content: snapshot.data[0],
                            ),
                          ),
                          Expanded(
                            child: ContentCardWeb(
                              content: snapshot.data[1],
                            ),
                          ),
                          Expanded(
                            child: ContentCardWeb(
                              content: snapshot.data[2],
                            ),
                          ),
                          Expanded(
                            child: ContentCardWeb(
                              content: snapshot.data[3],
                            ),
                          ),
                          Expanded(
                            child: ContentCardWeb(
                              content: snapshot.data[4],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          child: ContentCardWeb(
                            content: snapshot.data[5],
                          ),
                        ),
                        Expanded(
                          child: ContentCardWeb(
                            content: snapshot.data[6],
                          ),
                        ),
                        Expanded(
                          child: ContentCardWeb(
                            content: snapshot.data[7],
                          ),
                        ),
                        Expanded(
                          child: ContentCardWeb(
                            content: snapshot.data[8],
                          ),
                        ),
                        Expanded(
                          child: ContentCardWeb(
                            content: snapshot.data[9],
                          ),
                        ),
                      ],
                    ))
                  ],
                )
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
        });
  }
}
