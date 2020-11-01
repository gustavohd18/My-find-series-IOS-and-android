import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:myFindMovies/app/app_module.dart';
import 'package:myFindMovies/service/content_handle.dart';
import 'package:myFindMovies/service/content_handle_abstract.dart';
import 'package:myFindMovies/stores/favorites/favorites_controller.dart';
import 'package:myFindMovies/widgets/favorite/favorites_list.dart';
import 'package:myFindMovies/pages/favorite/favorite.dart';

class MockContent extends Mock implements ContentHandler {}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    initModule(AppModule(), changeBinds: [
      Bind<ContentHandleAbs>((i) => MockContent()),
      Bind((i) => FavoritesController()),
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
        home: Favorite(),
      ),
    );

    await test.pump();
  }

  testWidgets("Test element present to UI Favorite page",
      (WidgetTester tester) async {
    await _createWidgets(tester);

    final Finder scaffoldFinder = find.byType(Scaffold);

    expect(scaffoldFinder, findsOneWidget);

    final Scaffold scaffold = tester.widget(scaffoldFinder);

    final Finder columnFinder = find.byType(Column);

    expect(columnFinder, findsOneWidget);

    final Column column = tester.widget(columnFinder);

    final Finder expandedFinder = find.byType(Expanded);

    expect(expandedFinder, findsOneWidget);

    final Expanded expanded = tester.widget(expandedFinder);

    expect(column.crossAxisAlignment, CrossAxisAlignment.start);
    expect(column.mainAxisSize, MainAxisSize.max);
    expect(column.children, [expanded]);
  });
}
