import 'package:flutter/material.dart';
import 'package:myFindMovies/service/traslator.dart';

class Settings extends StatefulWidget {
  Settings();
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> _languageList = List();
  String _selectedLanguage;
  int _radioGroupValue;

  bool isPortugues;

  void _radioOnChanged(int index) async {
    await Traslator().setLanguage(_selectedLanguage);

    // _portuguese =  Traslator().portuguese();
    //  _english = await Traslator().english();

    setState(() {
      _radioGroupValue = index;
      _selectedLanguage = _languageList[index];
      getLanguage();
      print('_selectedRadioValue $_selectedLanguage');
    });
  }

  @override
  void initState() {
    super.initState();
    _languageList..add('English')..add('Portuguese');
    _radioGroupValue = 0;
    getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Radio(
                value: 0,
                groupValue: _radioGroupValue,
                onChanged: (index) async => {
                  _radioOnChanged(index),
                },
              ),
              Text((isPortugues == false) ? "Inglês" : "English"),
              Radio(
                value: 1,
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index),
              ),
              Text((isPortugues == false) ? "Português" : "Portuguese"),
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> getLanguage() async {
    bool isPortuguese = await Traslator().isPortuguese();
    setState(() {
      isPortugues = isPortuguese;
    });
  }
}
