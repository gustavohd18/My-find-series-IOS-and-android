import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myFindMovies/pages/movies/movie.dart';

void main() {
  Future _createWidgets(WidgetTester test) async {
    await test.pumpWidget(
      MaterialApp(
        title: 'My find series and movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Movie(),
      ),
    );

    await test.pump();
  }

  testWidgets("Test element present to UI Movie page",
      (WidgetTester tester) async {
    await _createWidgets(tester);

    final Finder scaffoldFinder = find.byType(Scaffold);

    expect(scaffoldFinder, findsOneWidget);

    final Scaffold scaffold = tester.widget(scaffoldFinder);

    final Finder columnFinder = find.byType(Column);

    expect(columnFinder, findsOneWidget);

    final Column column = tester.widget(columnFinder);

    final Finder containerFinder = find.byType(Container);

    expect(containerFinder, findsOneWidget);

    final Container container = tester.widget(containerFinder);

    final Finder rowFinder = find.byType(Row);

    expect(rowFinder, findsOneWidget);

    final Row row = tester.widget(rowFinder);

    final Finder flexFinder = find.byType(Flexible);

    expect(flexFinder, findsOneWidget);

    final Flexible flex = tester.widget(flexFinder);

    final Finder textFinder = find.byType(TextField);

    expect(textFinder, findsOneWidget);

    final TextField text = tester.widget(textFinder);

    expect(find.text("Search for movies"), findsOneWidget);
    expect(find.text("Search"), findsOneWidget);

    expect(scaffold.body, column);
    expect(container.child, row);
    expect(row.children, [flex]);
    expect(flex.child, text);
    expect(container.padding, EdgeInsets.all(10));
    expect(text.textInputAction, TextInputAction.search);
  });
}
