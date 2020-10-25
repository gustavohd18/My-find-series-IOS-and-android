import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myFindMovies/pages/favorite/favorite.dart';
import 'package:myFindMovies/pages/home/home.dart';
import 'package:myFindMovies/pages/movies/movie.dart';
import 'package:myFindMovies/pages/settings/settings.dart';
import 'package:myFindMovies/stores/share/share_controller.dart';
import 'package:myFindMovies/widgets/home/drawer_menu.dart';
import 'package:myFindMovies/pages/serie/serie.dart';
import 'package:myFindMovies/widgets/share/share_list.dart';

class Share extends StatefulWidget {
  @override
  _ShareState createState() => _ShareState();
}

class _ShareState extends ModularState<Share, ShareController> {
  @override
  void initState() {
    super.initState();
    this.controller.reload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(),
      drawer: DrawerMenu(
          Main(), Favorite(), Series(), Movie(), Settings(), Share(), true),
      appBar: AppBar(
        title: Observer(builder: (_) => Text(this.controller.title)),
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
        Observer(
          builder: (_) => Expanded(
            child: ShareList(
              this.controller.getShareList(),
              true,
              this.controller.empty,
            ),
          ),
        )
      ],
    ));
  }
}
