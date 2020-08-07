import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/widgets/home/content_movies_list.dart';

void main() {
  Future _createWidgetsWithoutElement(WidgetTester test) async {
    Future<List<MovieList>> _future;
    await test.pumpWidget(
      MaterialApp(
        title: 'My find series and movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ContentMoviesList(_future),
      ),
    );

    await test.pump();
  }

  testWidgets("Test element present to UI Content movies list",
      (WidgetTester tester) async {
    await _createWidgetsWithoutElement(tester);

    final Finder circularFinder = find.byType(CircularProgressIndicator);

    expect(circularFinder, findsOneWidget);

    final CircularProgressIndicator circular = tester.widget(circularFinder);

    final Finder centerFinder = find.byType(Center);

    expect(centerFinder, findsOneWidget);

    final Center center = tester.widget(centerFinder);

    expect(centerFinder, findsOneWidget);

    expect(center.child, circular);
  });
}
