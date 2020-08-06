import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/utils/stars.dart';

void main() {
  Future _createWidgetStars(WidgetTester test, int media) async {
    await test.pumpWidget(
      MaterialApp(
        title: 'My find series and movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Stars(media),
      ),
    );

    await test.pump();
  }

  testWidgets("Test UI with 1 stars", (WidgetTester tester) async {
    await _createWidgetStars(tester, 2);

    final Finder iconFinder = find.byType(Icon);

    expect(iconFinder, findsOneWidget);

    final Icon icon = tester.widget(iconFinder);

    expect(icon.color, Colors.yellow);
    expect(icon.size, 10.0);
    expect(icon.icon, Icons.star);

    final Finder rowFinder = find.byType(Row);

    expect(rowFinder, findsOneWidget);

    final Row row = tester.widget(rowFinder);

    expect(row.children, [icon]);
    expect(row.mainAxisAlignment, MainAxisAlignment.spaceBetween);
  });

  testWidgets("Test UI with 2 stars", (WidgetTester tester) async {
    await _createWidgetStars(tester, 4);

    final Finder iconFinder = find.byType(Icon);

    expect(iconFinder, findsNWidgets(2));

    final Icon icon = tester.widget(iconFinder.first);
    final Icon icon2 = tester.widget(iconFinder.last);

    expect(icon.color, Colors.yellow);
    expect(icon.size, 10.0);
    expect(icon.icon, Icons.star);

    expect(icon2.color, Colors.yellow);
    expect(icon2.size, 10.0);
    expect(icon2.icon, Icons.star);

    final Finder rowFinder = find.byType(Row);

    expect(rowFinder, findsOneWidget);

    final Row row = tester.widget(rowFinder);

    expect(row.children, [icon, icon2]);
    expect(row.mainAxisAlignment, MainAxisAlignment.spaceBetween);
  });

  testWidgets("Test UI with 3 stars", (WidgetTester tester) async {
    await _createWidgetStars(tester, 6);

    final Finder iconFinder = find.byType(Icon);

    expect(iconFinder, findsNWidgets(3));

    final Icon icon = tester.widget(iconFinder.at(0));
    final Icon icon2 = tester.widget(iconFinder.at(1));
    final Icon icon3 = tester.widget(iconFinder.at(2));

    expect(icon.color, Colors.yellow);
    expect(icon.size, 10.0);
    expect(icon.icon, Icons.star);

    expect(icon2.color, Colors.yellow);
    expect(icon2.size, 10.0);
    expect(icon2.icon, Icons.star);

    expect(icon3.color, Colors.yellow);
    expect(icon3.size, 10.0);
    expect(icon3.icon, Icons.star);

    final Finder rowFinder = find.byType(Row);

    expect(rowFinder, findsOneWidget);

    final Row row = tester.widget(rowFinder);

    expect(row.children, [icon, icon2, icon3]);
    expect(row.mainAxisAlignment, MainAxisAlignment.spaceBetween);
  });

  testWidgets("Test UI with 4 stars", (WidgetTester tester) async {
    await _createWidgetStars(tester, 8);

    final Finder iconFinder = find.byType(Icon);

    expect(iconFinder, findsNWidgets(4));

    final Icon icon = tester.widget(iconFinder.at(0));
    final Icon icon2 = tester.widget(iconFinder.at(1));
    final Icon icon3 = tester.widget(iconFinder.at(2));
    final Icon icon4 = tester.widget(iconFinder.at(3));

    expect(icon.color, Colors.yellow);
    expect(icon.size, 10.0);
    expect(icon.icon, Icons.star);

    expect(icon2.color, Colors.yellow);
    expect(icon2.size, 10.0);
    expect(icon2.icon, Icons.star);

    expect(icon3.color, Colors.yellow);
    expect(icon3.size, 10.0);
    expect(icon3.icon, Icons.star);

    expect(icon4.color, Colors.yellow);
    expect(icon4.size, 10.0);
    expect(icon4.icon, Icons.star);

    final Finder rowFinder = find.byType(Row);

    expect(rowFinder, findsOneWidget);

    final Row row = tester.widget(rowFinder);

    expect(row.children, [icon, icon2, icon3, icon4]);
    expect(row.mainAxisAlignment, MainAxisAlignment.spaceBetween);
  });

  testWidgets("Test UI with 5 stars", (WidgetTester tester) async {
    await _createWidgetStars(tester, 10);

    final Finder iconFinder = find.byType(Icon);

    expect(iconFinder, findsNWidgets(5));

    final Icon icon = tester.widget(iconFinder.at(0));
    final Icon icon2 = tester.widget(iconFinder.at(1));
    final Icon icon3 = tester.widget(iconFinder.at(2));
    final Icon icon4 = tester.widget(iconFinder.at(3));
    final Icon icon5 = tester.widget(iconFinder.at(4));

    expect(icon.color, Colors.yellow);
    expect(icon.size, 10.0);
    expect(icon.icon, Icons.star);

    expect(icon2.color, Colors.yellow);
    expect(icon2.size, 10.0);
    expect(icon2.icon, Icons.star);

    expect(icon3.color, Colors.yellow);
    expect(icon3.size, 10.0);
    expect(icon3.icon, Icons.star);

    expect(icon4.color, Colors.yellow);
    expect(icon4.size, 10.0);
    expect(icon4.icon, Icons.star);

    expect(icon5.color, Colors.yellow);
    expect(icon5.size, 10.0);
    expect(icon5.icon, Icons.star);

    final Finder rowFinder = find.byType(Row);

    expect(rowFinder, findsOneWidget);

    final Row row = tester.widget(rowFinder);

    expect(row.children, [icon, icon2, icon3, icon4, icon5]);
    expect(row.mainAxisAlignment, MainAxisAlignment.spaceBetween);
  });
}
