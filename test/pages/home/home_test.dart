import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:myFindMovies/app/app_module.dart';
import 'package:myFindMovies/pages/home/home.dart';
import 'package:myFindMovies/service/content_handle.dart';
import 'package:myFindMovies/service/content_handle_abstract.dart';
import 'package:myFindMovies/stores/home/home_controller.dart';

class MockContent extends Mock implements ContentHandler {}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    initModule(AppModule(), changeBinds: [
      Bind<ContentHandleAbs>((i) => MockContent()),
      Bind((i) => HomeController()),
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
        home: Main(),
      ),
    );

    await test.pump();
  }

  testWidgets("Test element present to UI Home page",
      (WidgetTester tester) async {
    await _createWidgets(tester);

    final Finder scaffoldFinder = find.byType(Scaffold);

    expect(scaffoldFinder, findsOneWidget);

    final Scaffold scaffold = tester.widget(scaffoldFinder);

    final Finder columnFinder = find.byType(Column);

    expect(columnFinder, findsOneWidget);

    final Finder safeAreaFinder = find.byType(SafeArea);

    expect(safeAreaFinder, findsNWidgets(3));

    final SafeArea safe = tester.widget(safeAreaFinder.at(1));

    expect(scaffold.body, safe);
  });
}
