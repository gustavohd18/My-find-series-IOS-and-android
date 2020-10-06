import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myFindMovies/app/app_module.dart';
import 'package:myFindMovies/pages/login/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myFindMovies/service/authentication/authentification_abstract.dart';
import 'package:myFindMovies/service/translator/translator_abstract.dart';
import 'package:myFindMovies/stores/login/login_controller.dart';

import '../splash/splash_test.dart';

class MockAuthentification extends Mock implements Authentication {}

void main() async {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    initModule(AppModule(), changeBinds: [
      Bind<Authentication>((i) => MockAuthentification()),
      Bind<ITranslator>((i) => MockTranslator()),
      Bind((i) => LoginController()),
    ]);
  });

  testWidgets("Test element present to UI Login screen",
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(Login(true)));

    final Finder scaffoldFinder = find.byType(Scaffold);

    expect(scaffoldFinder, findsOneWidget);

    final Scaffold scaffold = tester.widget(scaffoldFinder);

    final Finder appBarFinder = find.byType(AppBar);

    expect(appBarFinder, findsOneWidget);

    final AppBar appBar = tester.widget(appBarFinder);

    final Finder preferredSizeFinder = find.byType(PreferredSize);

    expect(preferredSizeFinder, findsOneWidget);

    final PreferredSize preferredSize = tester.widget(preferredSizeFinder);

    final Finder iconFinder = find.byType(Icon);

    expect(iconFinder, findsNWidgets(3));

    final Icon icon = tester.widget(iconFinder.at(2));

    expect(icon.size, 88.0);
    expect(icon.color, Colors.white);

    expect(preferredSize.child, icon);
    expect(preferredSize.preferredSize, Size.fromHeight(40.0));

    expect(appBar.bottom, preferredSize);

    expect(scaffold.appBar, appBar);

    final Finder safeAreaFinder = find.byType(SafeArea);

    expect(safeAreaFinder, findsNWidgets(2));

    final SafeArea safeArea = tester.widget(safeAreaFinder.at(0));

    final Finder singleChildScrollViewFinder =
        find.byType(SingleChildScrollView);

    expect(singleChildScrollViewFinder, findsOneWidget);

    final SingleChildScrollView singleChildScrollView =
        tester.widget(singleChildScrollViewFinder);

    final Finder sizedBoxFinder = find.byType(SizedBox);

    expect(sizedBoxFinder, findsNWidgets(6));

    final SizedBox sizedBox = tester.widget(sizedBoxFinder.at(4));

    final Finder columnFinder = find.byType(Column);

    expect(columnFinder, findsNWidgets(4));

    final Column column = tester.widget(columnFinder.at(0));

    final Column column2 = tester.widget(columnFinder.at(2));

    final Finder obsFinder = find.byType(Observer);

    expect(obsFinder, findsNWidgets(6));

    final Observer text0 = tester.widget(obsFinder.at(0));

    final Observer text1 = tester.widget(obsFinder.at(1));

    final Observer text2 = tester.widget(obsFinder.at(2));

    expect(column.children, [text0, text1, sizedBox, text2, column2]);

    expect(column.crossAxisAlignment, CrossAxisAlignment.stretch);

    expect(singleChildScrollView.child, column);

    expect(singleChildScrollView.padding, EdgeInsets.all(16.0));

    expect(safeArea.child, singleChildScrollView);

    expect(scaffold.body, safeArea);
  });
}
