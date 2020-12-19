import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myFindMovies/stores/settings/settings_controller.dart';
import 'package:myFindMovies/widgets/home/drawer_menu.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends ModularState<Settings, SettingsController> {
  List<String> _languageList = List();
  int _radioGroupValue;

  void _radioOnChanged(int index) async {
    this.controller.setTranslator(index);

    setState(() {
      _radioGroupValue = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _languageList..add('Portuguese')..add('English')..add('Spanish');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(this.controller.title),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: <Widget>[
          Observer(
            builder: (_) => Text(
              this.controller.subTitle,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontStyle: FontStyle.normal),
            ),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: _radioGroupValue,
                  onChanged: (index) => {
                    _radioOnChanged(index),
                  },
                ),
                Observer(
                  builder: (_) => Text(this.controller.english),
                ),
                Radio(
                  value: 1,
                  groupValue: _radioGroupValue,
                  onChanged: (index) => _radioOnChanged(index),
                ),
                Observer(
                  builder: (_) => Text(this.controller.portuguese),
                ),
                Radio(
                  value: 2,
                  groupValue: _radioGroupValue,
                  onChanged: (index) => _radioOnChanged(index),
                ),
                Observer(
                  builder: (_) => Text(
                    this.controller.spanish,
                  ),
                ),
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
