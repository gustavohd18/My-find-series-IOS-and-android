import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myFindMovies/model/FavoriteList.dart';
import 'package:myFindMovies/widgets/favorite/favorites_list.dart';

void main() {
  Future _createWidgetsWithoutElement(WidgetTester test) async {
    Future<List<FavoriteList>> _future;
    Function() _f;
    await test.pumpWidget(
      MaterialApp(
        title: 'My find series and movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FavoritesList(_future, _f, false, "No have Favorite"),
      ),
    );

    await test.pump();
  }

  testWidgets("Test element present to UI without element Favorite",
      (WidgetTester tester) async {
    await _createWidgetsWithoutElement(tester);

    final Finder textFinder = find.byType(Text);

    expect(textFinder, findsOneWidget);

    final Text text = tester.widget(textFinder);

    expect(find.text("No have Favorite"), findsOneWidget);

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
