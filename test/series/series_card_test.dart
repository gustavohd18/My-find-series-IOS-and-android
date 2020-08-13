import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/content/dialog_content.dart';
import 'package:myFindMovies/widgets/serie/series_card.dart';
import 'package:myFindMovies/widgets/utils/stars.dart';
import 'package:network_image_mock/network_image_mock.dart';

Widget makeTestableWidget() => MaterialApp(
    home: Image.network(
        'https://image.tmdb.org/t/p/w185/2u1cyQgBpWWypISdbUDCu2hasGV.jpg'));

void main() {
  Future _createWidgetsCards(WidgetTester tester) async {
    final String id = '123',
        title = 'abc',
        information = 'test',
        voteAverage = '1',
        posterPath = '/2u1cyQgBpWWypISdbUDCu2hasGV.jpg';
    final bool isMovie = false;

    await mockNetworkImagesFor(() => tester.pumpWidget(makeTestableWidget()));

    await tester.pumpWidget(
      MaterialApp(
        title: 'My find series and movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SeriesCard(
            id, title, information, voteAverage, posterPath, isMovie, false),
      ),
    );

    await tester.pump();
  }

  testWidgets("Test element present UI", (WidgetTester tester) async {
    await _createWidgetsCards(tester);
    final Finder iconFinder = find.byType(Icon);

    expect(iconFinder, findsNWidgets(2));

    final Icon icon = tester.widget(iconFinder.at(1));

    final Icon icon2 = tester.widget(iconFinder.at(0));

    expect(icon2.color, Colors.yellow);
    expect(icon2.size, 10.0);
    expect(icon2.icon, Icons.star);

    expect(icon.color, Colors.black);
    expect(icon.icon, Icons.slow_motion_video);

    expect(find.text("abc"), findsOneWidget);

    final Finder listFinder = find.byType(ListTile);

    expect(listFinder, findsOneWidget);

    final Finder textFinder = find.byType(Text);

    expect(textFinder, findsOneWidget);

    final Finder starsFinder = find.byType(Stars);

    expect(starsFinder, findsOneWidget);

    final Finder containerFinder = find.byType(Container);

    expect(containerFinder, findsNWidgets(2));

    final Finder cardFinder = find.byType(Card);

    expect(cardFinder, findsOneWidget);

    final Card card = tester.widget(cardFinder);

    final Container container = tester.widget(containerFinder.at(1));

    final Stars stars = tester.widget(starsFinder);

    final Text text = tester.widget(textFinder);

    final ListTile listTile = tester.widget(listFinder);

    expect(listTile.title, text);
    expect(listTile.trailing, icon);
    expect(listTile.subtitle, stars);
    expect(container.child, listTile);
    expect(card.child, container);

    // Tap the list title.
    await tester.tap(find.byType(ListTile));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    final Finder customFinder = find.byType(ContentDialog);

    // Expect to find the item on screen.
    expect(find.text('test'), findsOneWidget);

    expect(customFinder, findsOneWidget);
  });
}
