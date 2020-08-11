import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/content/dialog_content.dart';
import 'package:myFindMovies/widgets/home/content_card.dart';
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
        home: ContentCard(
            id, title, information, voteAverage, posterPath, isMovie, false),
      ),
    );

    await tester.pump();
  }

  testWidgets("Test element present UI Content card",
      (WidgetTester tester) async {
    await _createWidgetsCards(tester);
    final Finder iconFinder = find.byType(Icon);

    expect(iconFinder, findsOneWidget);

    final Icon icon2 = tester.widget(iconFinder);

    expect(icon2.color, Colors.yellow);
    expect(icon2.size, 10.0);
    expect(icon2.icon, Icons.star);

    expect(find.text("abc"), findsOneWidget);

    final Finder textFinder = find.byType(Text);

    expect(textFinder, findsOneWidget);

    final Finder starsFinder = find.byType(Stars);

    expect(starsFinder, findsOneWidget);

    final Finder flexFinder = find.byType(Flexible);

    expect(flexFinder, findsOneWidget);

    final Finder cardFinder = find.byType(Card);

    expect(cardFinder, findsOneWidget);

    final Card card = tester.widget(cardFinder);

    final Flexible flex = tester.widget(flexFinder);

    final Stars stars = tester.widget(starsFinder);

    final Text text = tester.widget(textFinder);

    final Finder paddingFinder = find.byType(Padding);

    expect(paddingFinder, findsNWidgets(4));

    final Padding padding = tester.widget(paddingFinder.at(2));

    final Padding padding2 = tester.widget(paddingFinder.at(3));

    expect(padding.padding, EdgeInsets.all(8.0));
    expect(padding.child, text);
    expect(text.style, TextStyle(fontWeight: FontWeight.bold, fontSize: 12));
    expect(text.overflow, TextOverflow.ellipsis);

    expect(padding2.padding, EdgeInsets.all(4.0));
    expect(padding2.child, stars);

    final Finder columnFinder = find.byType(Column);

    expect(columnFinder, findsOneWidget);

    final Column column = tester.widget(columnFinder);

    expect(column.children, [flex, padding, padding2]);

    final Finder containerFinder = find.byType(Container);

    expect(containerFinder, findsNWidgets(2));

    final Container container = tester.widget(containerFinder.at(1));

    expect(container.child, column);
    expect(container.padding, EdgeInsets.all(32.0));

    expect(card.child, container);

    final Finder gestureFinder = find.byType(GestureDetector);

    expect(gestureFinder, findsOneWidget);

    final GestureDetector gesture = tester.widget(gestureFinder);

    expect(gesture.child, card);

    // Tap the card.
    await tester.tap(find.byType(GestureDetector));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    final Finder customFinder = find.byType(ContentDialog);

    // Expect to find the item on screen.
    expect(find.text('test'), findsOneWidget);

    expect(customFinder, findsOneWidget);
  });
}
