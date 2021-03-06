import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/serie/series_list.dart';
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
        home: SeriesList(_future, false, "No have Content to word"),
      ),
    );

    await test.pump();
  }

  testWidgets("Test element present to UI without element",
      (WidgetTester tester) async {
    await _createWidgetsWithoutElement(tester);

    final Finder textFinder = find.byType(Text);

    expect(textFinder, findsOneWidget);

    final Text text = tester.widget(textFinder);

    expect(find.text("No have Content to word"), findsOneWidget);

    expect(text.textAlign, TextAlign.center);
    expect(
        text.style,
        TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ));

    final Finder centerFinder = find.byType(Center);

    expect(centerFinder, findsOneWidget);

    final Center center = tester.widget(centerFinder);

    expect(centerFinder, findsOneWidget);

    expect(center.child, text);
  });
}
