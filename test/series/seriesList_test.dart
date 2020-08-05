import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/serie/seriesList.dart';
import 'package:myFindMovies/model/SerieList.dart';

void main() {
  Future _createWidgetsWithoutElement(WidgetTester test) async {
    Future<List<SerieList>> _future;
    await test.pumpWidget(
      MaterialApp(
        title: 'My find series and movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SeriesList(_future),
      ),
    );

    await test.pump();
  }

  testWidgets("Test element present to UI without element",
      (WidgetTester test) async {
    await _createWidgetsWithoutElement(test);

    expect(find.text("No have Content to word"), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
  });
}
