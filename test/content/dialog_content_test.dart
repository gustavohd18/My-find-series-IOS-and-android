import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/content/circle_image.dart';
import 'package:myFindMovies/widgets/content/dialog_content.dart';
import 'package:network_image_mock/network_image_mock.dart';

Widget makeTestableWidget() => MaterialApp(
    home: Image.network(
        'https://image.tmdb.org/t/p/w185/2u1cyQgBpWWypISdbUDCu2hasGV.jpg'));

void main() {
  Future _createWidgets(WidgetTester tester) async {
    final String id = '123',
        title = 'abc',
        information = 'test',
        voteAverage = '1',
        posterPath = '/2u1cyQgBpWWypISdbUDCu2hasGV.jpg';
    final bool isMovie = true;
    final bool isFavorite = false;
    Function() _f;
    await mockNetworkImagesFor(() => tester.pumpWidget(makeTestableWidget()));

    await tester.pumpWidget(
      MaterialApp(
        title: 'My find series and movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ContentDialog(
            id: id,
            title: title,
            information: information,
            voteAverage: voteAverage,
            posterPath: posterPath,
            isMovie: isMovie,
            isFavorite: isFavorite,
            f: _f),
      ),
    );

    await tester.pump();
  }

  testWidgets("Test element present UI Dialog content",
      (WidgetTester tester) async {
    await _createWidgets(tester);
    final Finder dialogFinder = find.byType(Dialog);

    expect(dialogFinder, findsOneWidget);

    final Dialog dialog = tester.widget(dialogFinder);

    expect(find.text("abc"), findsOneWidget);

    expect(find.text("test"), findsOneWidget);

    final Finder stackFinder = find.byType(Stack);

    final Stack stack = tester.widget(stackFinder);

    expect(stackFinder, findsOneWidget);

    final Finder poFinder = find.byType(Positioned);

    expect(poFinder, findsOneWidget);

    final Positioned po = tester.widget(poFinder);

    final Finder circleFinder = find.byType(CircleImage);

    final CircleImage circle = tester.widget(circleFinder);

    final Finder containerFinder = find.byType(Container);

    final Container container = tester.widget(containerFinder.at(0));

    expect(containerFinder, findsNWidgets(5));

    expect(po.left, 16.0);
    expect(po.right, 16.0);
    expect(po.child, circle);

    expect(stack.children, [container, po]);

    expect(dialog.elevation, 0.0);
    expect(dialog.backgroundColor, Colors.transparent);

    // Tap the list title.
    //  await tester.tap(find.byType(ListTile));

    // Rebuild the widget after the state has changed.
    //  await tester.pump();

    //  final Finder customFinder = find.byType(ContentDialog);

    // Expect to find the item on screen.
    //  expect(find.text('test'), findsOneWidget);

    //  expect(customFinder, findsOneWidget);
  });
}
