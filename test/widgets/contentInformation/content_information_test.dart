import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_find_series_and_movies/util/types/content_type.dart';
import 'package:my_find_series_and_movies/widgets/contentInfomation/content_information.dart';
import 'package:network_image_mock/network_image_mock.dart';

Widget makeTestable(Widget widget) => MaterialApp(home: widget);
void main() {
  testWidgets('Content information test', (WidgetTester tester) async {

    ContentInformation contentInformation = ContentInformation(urlImage: "https://lumiere-a.akamaihd.net/v1/images/bigred_ka_vert_brpo_cddc98da.jpeg",title: "WandaVision",type:ContentType.movie, rate: "10",);

    await mockNetworkImagesFor(() => tester.pumpWidget(makeTestable(contentInformation)));

    expect(find.text('Movie'), findsOneWidget);

    ContentInformation contentInformationSeries = ContentInformation(urlImage: "https://lumiere-a.akamaihd.net/v1/images/bigred_ka_vert_brpo_cddc98da.jpeg",title: "WandaVision",type:ContentType.series, rate: "10",);
    await mockNetworkImagesFor(() => tester.pumpWidget(makeTestable(contentInformationSeries)));

    expect(find.text('Series'), findsOneWidget);

  });
}
