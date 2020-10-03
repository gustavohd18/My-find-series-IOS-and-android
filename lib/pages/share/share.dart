import 'package:flutter/material.dart';
import 'package:myFindMovies/model/shareContent.dart';
import 'package:myFindMovies/pages/favorite/favorite.dart';
import 'package:myFindMovies/pages/home/home.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';
import 'package:myFindMovies/service/content_handle.dart';
import 'package:myFindMovies/service/translator/traslator.dart';
import 'package:myFindMovies/service/database/favoriteDatabase.dart';
import 'package:myFindMovies/pages/movies/movie.dart';
import 'package:myFindMovies/pages/settings/settings.dart';
import 'package:myFindMovies/widgets/home/drawer_menu.dart';
import 'package:myFindMovies/pages/serie/serie.dart';
import 'package:myFindMovies/widgets/share/share_list.dart';

class Share extends StatefulWidget {
  @override
  _ShareState createState() => _ShareState();
}

class _ShareState extends State<Share> {
  final dbHelper = FavoriteDatabase.instance;
  final AuthenticationService authenticationService = AuthenticationService();

  Stream<List<ShareContent>> _shareList;
  bool _isPortugues = true;
  String _text = " ";

  String _myHandler = "";

  @override
  void initState() {
    super.initState();
    getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(),
      drawer: DrawerMenu(Main(), Favorite(), Series(), Movie(), Settings(),
          Share(), _isPortugues),
      appBar: AppBar(
        title: Text(_myHandler),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
    );
  }

  Widget _buildScreen() {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: ShareList(_shareList, _isPortugues, _text),
        ),
      ],
    ));
  }

  void _reloadTab() {
    setState(() {
      getLanguage();
    });
  }

  Future<Null> getLanguage() async {
    bool isPortuguese = await Traslator().isPortuguese();
    setState(() {
      _isPortugues = isPortuguese;
      _text = (isPortuguese == false)
          ? "Nenhum conteúdo compartilhado na lista"
          : "No have content shared";

      _myHandler = (isPortuguese == false) ? "Compartilhados" : "Shared";

      _shareList = ContentHandler().getShareList(
          authenticationService.getFirebaseAuth().currentUser.email);
    });
  }
}
