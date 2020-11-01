import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myFindMovies/app/app_module.dart';
import 'package:myFindMovies/pages/settings/settings.dart';
import 'package:myFindMovies/service/translator/translator_abstract.dart';
import 'package:myFindMovies/stores/settings/settings_controller.dart';

import '../splash/splash_test.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    initModule(AppModule(), changeBinds: [
      Bind<ITranslator>((i) => MockTranslator()),
      Bind((i) => SettingsController()),
    ]);
  });
  Future _createWidgets(WidgetTester test) async {
    await test.pumpWidget(
      MaterialApp(
        title: 'My find series and movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Settings(),
      ),
    );

    await test.pump();
  }

  testWidgets("Test element present to UI Settings page",
      (WidgetTester tester) async {
    await _createWidgets(tester);

    final Finder appBarFinder = find.byType(AppBar);

    expect(appBarFinder, findsOneWidget);

    final Finder scaffoldFinder = find.byType(Scaffold);

    expect(scaffoldFinder, findsOneWidget);

    final Finder columnFinder = find.byType(Column);

    expect(columnFinder, findsOneWidget);

    final Finder rowFinder = find.byType(Row);

    expect(rowFinder, findsOneWidget);

    final Finder safeAreaFinder = find.byType(SafeArea);

    expect(safeAreaFinder, findsNWidgets(2));
  });
}
