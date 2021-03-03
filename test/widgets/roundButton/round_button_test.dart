import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_find_series_and_movies/widgets/roundButton/round_button.dart';

Widget makeTestable(Widget widget) => MaterialApp(home: widget);
void main() {
  testWidgets('Round button test', (WidgetTester tester) async {

    String text = "Pressed here";
    Function changeName = () => {
      text = "Button Pressed"
    };

    RoundedButton roundedButton = RoundedButton(title: "test",onPressed: changeName, colour: Colors.blue);

    await tester.pumpWidget(makeTestable(roundedButton));

    final Finder materialButtonFinder = find.byType(MaterialButton);

    expect(materialButtonFinder, findsOneWidget);

    expect(text, "Pressed here");

    await tester.tap(materialButtonFinder);

    await tester.pumpAndSettle();

    expect(text, "Button Pressed");
  });
}
