import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('Can Create Preferences', () async {
    SharedPreferences.setMockInitialValues({}); //set values here
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool working = false;
    String name = 'john';
    pref.setBool('working', working);
    pref.setString('name', name);

    expect(pref.getBool('working'), false);
    expect(pref.getString('name'), 'john');
  });
}
