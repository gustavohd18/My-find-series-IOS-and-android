
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:my_find_series_and_movies/pages/splash/splash_page.dart';
void main() {
  testWidgets('Element present in Splash page UI', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // when put firebase need init firebase before screen
    await tester.pumpWidget(
      MaterialApp(
        title: 'My find series and movies',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Splash(),
      ),
    );
    final Finder scaffoldFinder = find.byType(Scaffold);
    final Finder containerFinder = find.byType(Container);
    final Finder imageFinder = find.byType(Image);
    final Finder columnFinder = find.byType(Column);
    final Image image = tester.widget(imageFinder);
    final Scaffold scaffold = tester.widget(scaffoldFinder);
    final Column column = tester.widget(columnFinder);
    final Container container = tester.widget(containerFinder.at(0));

    expect(scaffoldFinder, findsOneWidget);
    expect(columnFinder, findsOneWidget);
    expect(imageFinder, findsOneWidget);
    expect(containerFinder, findsNWidgets(3));
    expect(scaffold.backgroundColor, Colors.blue);
    expect(scaffold.body, container);
    expect(column.mainAxisAlignment, MainAxisAlignment.center);
    expect(column.crossAxisAlignment, CrossAxisAlignment.stretch);
    expect(container.child, column);
    expect(image.width, 60);
    expect(image.height, 60);
    expect(find.text('My find Series and Movies'), findsOneWidget);
    expect(find.text("Built with"), findsOneWidget);
  });
}
