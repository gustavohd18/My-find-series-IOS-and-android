import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:myFindMovies/pages/splash/splash.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';

void main() async {
  Future _createScreen(WidgetTester test) async {
    await test.pumpWidget(
      MaterialApp(
        title: 'My find series and movies',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          backgroundColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Splash(),
      ),
    );

    await test.pump();
  }

  testWidgets("Test element present to UI Splash screen",
      (WidgetTester tester) async {
    await _createScreen(tester);

    final Finder scaffoldFinder = find.byType(Scaffold);

    expect(scaffoldFinder, findsOneWidget);

    final Scaffold scaffold = tester.widget(scaffoldFinder);

    final Finder containerFinder = find.byType(Container);

    expect(containerFinder, findsNWidgets(2));

    final Container containerOne = tester.widget(containerFinder.at(0));

    final Container containerTwo = tester.widget(containerFinder.at(1));

    final Finder centerFinder = find.byType(Center);

    expect(centerFinder, findsOneWidget);

    final Center center = tester.widget(centerFinder);

    final Finder columnFinder = find.byType(Column);

    expect(columnFinder, findsOneWidget);

    final Column column = tester.widget(columnFinder);

    expect(find.text("My find Series and Movies"), findsOneWidget);

    final Finder textFinder = find.byType(Text);

    expect(textFinder, findsOneWidget);

    final Text text = tester.widget(textFinder);

    expect(text.style, TextStyle(fontSize: 20, color: Colors.white));

    expect(scaffold.body, containerOne);
    expect(scaffold.backgroundColor, Colors.blue);

    expect(containerOne.child, center);
    expect(containerOne.margin, EdgeInsets.only(left: 20.0, right: 20.0));

    expect(center.child, column);

    expect(column.children, [containerTwo]);
    expect(column.mainAxisAlignment, MainAxisAlignment.center);
    expect(column.crossAxisAlignment, CrossAxisAlignment.stretch);

    expect(containerTwo.child, text);
    expect(containerTwo.alignment, Alignment.center);
    expect(
        containerTwo.margin,
        EdgeInsets.only(
          top: 15.0,
        ));
  });
}
