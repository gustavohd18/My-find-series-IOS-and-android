import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myFindMovies/widgets/content/circle_image.dart';
import 'package:network_image_mock/network_image_mock.dart';

Widget makeTestableWidget() => MaterialApp(
    home: Image.network(
        'https://image.tmdb.org/t/p/w185/2u1cyQgBpWWypISdbUDCu2hasGV.jpg'));

void main() {
  Future _createWidgets(WidgetTester tester) async {
    final posterPath = '/2u1cyQgBpWWypISdbUDCu2hasGV.jpg';
    await mockNetworkImagesFor(() => tester.pumpWidget(makeTestableWidget()));

    await tester.pumpWidget(
      MaterialApp(
          title: 'My find series and movies',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: CircleImage(image: posterPath)),
    );

    await tester.pump();
  }

  testWidgets("Test element present UI Circle avatar",
      (WidgetTester tester) async {
    await _createWidgets(tester);
    final Finder containerFinder = find.byType(Container);

    expect(containerFinder, findsOneWidget);

    final Finder centerFinder = find.byType(Center);

    expect(centerFinder, findsOneWidget);
  });
}
