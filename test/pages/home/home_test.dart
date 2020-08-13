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

    expect(scaffoldFinder, findsNWidgets(2));

    final Scaffold scaffold = tester.widget(scaffoldFinder.at(0));

    final Scaffold scaffold1 = tester.widget(scaffoldFinder.at(1));

    final Finder tabFinder = find.byType(TabBarView);

    expect(tabFinder, findsOneWidget);

    final TabBarView tab = tester.widget(tabFinder);

    final Finder columnFinder = find.byType(Column);

    expect(columnFinder, findsNWidgets(7));

    final Finder tab1Finder = find.byType(DefaultTabController);

    expect(tab1Finder, findsOneWidget);

    final DefaultTabController tab1 = tester.widget(tab1Finder);

    expect(scaffold.body, tab1);
    expect(tab1.child, scaffold1);
  });
}
