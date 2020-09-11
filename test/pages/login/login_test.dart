import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myFindMovies/app/app_module.dart';
import 'package:myFindMovies/pages/login/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myFindMovies/service/authentication/authentification_abstract.dart';
import 'package:myFindMovies/stores/login/login_controller.dart';

class MockAuthentification extends Mock implements Authentication {}

void main() async {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    initModule(AppModule(), changeBinds: [
      Bind<Authentication>((i) => MockAuthentification()),
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
  });
}
