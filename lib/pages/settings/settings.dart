import 'package:flutter/material.dart';
import 'package:myFindMovies/pages/movies/movie.dart';
import 'package:myFindMovies/pages/share/share.dart';
import 'package:myFindMovies/service/traslator.dart';
import 'package:myFindMovies/widgets/home/drawer_menu.dart';
import 'package:myFindMovies/pages/serie/serie.dart';
import 'package:myFindMovies/pages/home/home.dart';
import 'package:myFindMovies/pages/favorite/favorite.dart';

class Settings extends StatefulWidget {
  final Function() func;

  Settings(this.func);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> _languageList = List();
  String _selectedLanguage;
  int _radioGroupValue;
  String _portuguese, _english;

  bool isPortugues;

  String _myHandler;

  void _radioOnChanged(int index) async {
    _selectedLanguage = _languageList[index];
    await Traslator().setLanguage(_selectedLanguage);

    setState(() {
      getLanguage();
      _radioGroupValue = index;
      _selectedLanguage = _languageList[index];
    });
  }

  @override
  void initState() {
    super.initState();
    _languageList..add('Portuguese')..add('English');
    getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(Main(), Favorite(), Series(), Movie(),
          Settings(_reloadTab), Share(), isPortugues),
      appBar: AppBar(
        title: Text(_myHandler),
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
          child: Row(
            children: <Widget>[
              Radio(
                value: 0,
                groupValue: _radioGroupValue,
                onChanged: (index) => {
                  _radioOnChanged(index),
                },
              ),
              Text(_english),
              Radio(
                value: 1,
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index),
              ),
              Text(_portuguese),
            ],
          ),
        ),
      ),
    );
  }

  void _reloadTab() {
    setState(() {
      getLanguage();
    });
  }

  Future<Null> getLanguage() async {
    bool isPortuguese = await Traslator().isPortuguese();
    setState(() {
      isPortugues = isPortuguese;
      _english = (isPortuguese == false) ? "Inglês" : "English";
      _portuguese = (isPortuguese == false) ? "Português" : "Portuguese";
      _myHandler = (isPortuguese == false) ? "Configurações" : "Settings";

      widget.func();
    });
  }
}
