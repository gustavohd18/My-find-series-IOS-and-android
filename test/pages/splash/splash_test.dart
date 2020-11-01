import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:myFindMovies/app/app_module.dart';
import 'package:myFindMovies/pages/splash/splash.dart';
import 'package:myFindMovies/service/authentication/authentification_abstract.dart';
import 'package:myFindMovies/service/translator/languages.dart';
import 'package:myFindMovies/service/translator/translator.dart';
import 'package:myFindMovies/stores/splash/splash_controller.dart';

class MockAuthentification extends Mock implements Authentication {}

class MockTranslator extends Mock implements Translator {}

class MockSplashController extends Mock implements SplashController {}

void main() async {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    initModule(AppModule(), changeBinds: [
      Bind<Authentication>((i) => MockAuthentification()),
      Bind<Translator>((i) => MockTranslator()),
      Bind((i) => MockSplashController()),
    ]);
  });
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

    MockTranslator mock = MockTranslator();
    mock.setLanguage(Languages.english);

    MockSplashController mock2 = MockSplashController();
    mock2.builtDescription = "Built with";

    final Finder scaffoldFinder = find.byType(Scaffold);

    expect(scaffoldFinder, findsOneWidget);

    final Scaffold scaffold = tester.widget(scaffoldFinder);

    final Finder containerFinder = find.byType(Container);

    expect(containerFinder, findsNWidgets(3));

    final Container containerOne = tester.widget(containerFinder.at(0));

    final Container containerTwo = tester.widget(containerFinder.at(1));

    final Finder centerFinder = find.byType(Center);

    expect(centerFinder, findsOneWidget);

    final Center center = tester.widget(centerFinder);

    final Finder columnFinder = find.byType(Column);

    expect(columnFinder, findsOneWidget);

    final Column column = tester.widget(columnFinder);

    expect(find.text("My find Series Movies"), findsOneWidget);

    expect(find.text("Built with"), findsOneWidget);

    final Finder textFinder = find.byType(Text);

    expect(textFinder, findsNWidgets(2));

    final Text text = tester.widget(textFinder.at(0));

    expect(text.style, TextStyle(fontSize: 20, color: Colors.white));

    final Text text2 = tester.widget(textFinder.at(1));

    expect(text2.style, TextStyle(fontSize: 12, color: Colors.white));

    expect(scaffold.body, containerOne);
    expect(scaffold.backgroundColor, Colors.blue);

    expect(containerOne.child, center);
    expect(containerOne.margin, EdgeInsets.only(left: 20.0, right: 20.0));

    expect(center.child, column);

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
