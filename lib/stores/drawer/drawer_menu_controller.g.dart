// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_menu_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DrawerMenuController on _DrawerMenuControllerBase, Store {
  final _$homeAtom = Atom(name: '_DrawerMenuControllerBase.home');

  @override
  String get home {
    _$homeAtom.reportRead();
    return super.home;
  }

  @override
  set home(String value) {
    _$homeAtom.reportWrite(value, super.home, () {
      super.home = value;
    });
  }

  final _$favoriteAtom = Atom(name: '_DrawerMenuControllerBase.favorite');

  @override
  String get favorite {
    _$favoriteAtom.reportRead();
    return super.favorite;
  }

  @override
  set favorite(String value) {
    _$favoriteAtom.reportWrite(value, super.favorite, () {
      super.favorite = value;
    });
  }

  final _$moviesAtom = Atom(name: '_DrawerMenuControllerBase.movies');

  @override
  String get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(String value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  final _$seriesAtom = Atom(name: '_DrawerMenuControllerBase.series');

  @override
  String get series {
    _$seriesAtom.reportRead();
    return super.series;
  }

  @override
  set series(String value) {
    _$seriesAtom.reportWrite(value, super.series, () {
      super.series = value;
    });
  }

  final _$settingsAtom = Atom(name: '_DrawerMenuControllerBase.settings');

  @override
  String get settings {
    _$settingsAtom.reportRead();
    return super.settings;
  }

  @override
  set settings(String value) {
    _$settingsAtom.reportWrite(value, super.settings, () {
      super.settings = value;
    });
  }

  final _$logoutAtom = Atom(name: '_DrawerMenuControllerBase.logout');

  @override
  String get logout {
    _$logoutAtom.reportRead();
    return super.logout;
  }

  @override
  set logout(String value) {
    _$logoutAtom.reportWrite(value, super.logout, () {
      super.logout = value;
    });
  }

  final _$sharedAtom = Atom(name: '_DrawerMenuControllerBase.shared');

  @override
  String get shared {
    _$sharedAtom.reportRead();
    return super.shared;
  }

  @override
  set shared(String value) {
    _$sharedAtom.reportWrite(value, super.shared, () {
      super.shared = value;
    });
  }

  @override
  String toString() {
    return '''
home: ${home},
favorite: ${favorite},
movies: ${movies},
series: ${series},
settings: ${settings},
logout: ${logout},
shared: ${shared}
    ''';
  }
}
