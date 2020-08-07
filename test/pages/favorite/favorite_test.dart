import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/favorite/favorites_list.dart';
import 'package:myFindMovies/pages/favorite/favorite.dart';

void main() {
  Future _createWidgets(WidgetTester test) async {
    await test.pumpWidget(
      MaterialApp(
        title: 'My find series and movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Favorite(),
      ),
    );

    await test.pump();
  }

  testWidgets("Test element present to UI Favorite page",
      (WidgetTester tester) async {
    await _createWidgets(tester);

    final Finder scaffoldFinder = find.byType(Scaffold);

    expect(scaffoldFinder, findsOneWidget);

    final Scaffold scaffold = tester.widget(scaffoldFinder);

    final Finder columnFinder = find.byType(Column);

    expect(columnFinder, findsOneWidget);

    final Column column = tester.widget(columnFinder);

    final Finder expandedFinder = find.byType(Expanded);

    expect(expandedFinder, findsOneWidget);

    final Expanded expanded = tester.widget(expandedFinder);

    final Finder favoriteFinder = find.byType(FavoritesList);

    expect(favoriteFinder, findsOneWidget);

    final FavoritesList favoriteList = tester.widget(favoriteFinder);

    expect(expanded.child, favoriteList);
    expect(scaffold.body, column);
    expect(column.crossAxisAlignment, CrossAxisAlignment.start);
    expect(column.mainAxisSize, MainAxisSize.max);
    expect(column.children, [expanded]);
  });
}
