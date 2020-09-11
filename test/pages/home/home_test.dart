import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myFindMovies/pages/home/home.dart';

void main() {
  Future _createWidgets(WidgetTester test) async {
    await test.pumpWidget(
      MaterialApp(
        title: 'My find series and movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Main(),
      ),
    );

    await test.pump();
  }

  testWidgets("Test element present to UI Home page",
      (WidgetTester tester) async {
    await _createWidgets(tester);

    final Finder scaffoldFinder = find.byType(Scaffold);

    expect(scaffoldFinder, findsOneWidget);

    final Scaffold scaffold = tester.widget(scaffoldFinder);

    final Finder columnFinder = find.byType(Column);

    expect(columnFinder, findsOneWidget);

    final Finder safeAreaFinder = find.byType(SafeArea);

    expect(safeAreaFinder, findsNWidgets(3));

    final SafeArea safe = tester.widget(safeAreaFinder.at(1));

    expect(scaffold.body, safe);
  });
}
