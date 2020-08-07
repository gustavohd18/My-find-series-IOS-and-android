import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/home/subtitle.dart';

void main() {
  Future _createWidgets(WidgetTester test) async {
    await test.pumpWidget(
      MaterialApp(
        title: 'My find series and movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Subtitle('abc'),
      ),
    );

    await test.pump();
  }

  testWidgets("Test element present to UI Subtitle",
      (WidgetTester tester) async {
    await _createWidgets(tester);

    final Finder textFinder = find.byType(Text);

    expect(textFinder, findsOneWidget);

    final Text text = tester.widget(textFinder);

    expect(find.text("abc"), findsOneWidget);

    expect(text.textAlign, TextAlign.left);
    expect(
        text.style,
        TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ));

    final Finder paddingFinder = find.byType(Padding);

    expect(paddingFinder, findsOneWidget);

    final Padding padding = tester.widget(paddingFinder);

    expect(paddingFinder, findsOneWidget);

    expect(padding.child, text);

    expect(padding.padding, EdgeInsets.all(8));
  });
}
