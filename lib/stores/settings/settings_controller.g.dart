// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsController on _SettingsControllerBase, Store {
  final _$englishAtom = Atom(name: '_SettingsControllerBase.english');

  @override
  String get english {
    _$englishAtom.reportRead();
    return super.english;
  }

  @override
  set english(String value) {
    _$englishAtom.reportWrite(value, super.english, () {
      super.english = value;
    });
  }

  final _$portugueseAtom = Atom(name: '_SettingsControllerBase.portuguese');

  @override
  String get portuguese {
    _$portugueseAtom.reportRead();
    return super.portuguese;
  }

  @override
  set portuguese(String value) {
    _$portugueseAtom.reportWrite(value, super.portuguese, () {
      super.portuguese = value;
    });
  }

  final _$spanishAtom = Atom(name: '_SettingsControllerBase.spanish');

  @override
  String get spanish {
    _$spanishAtom.reportRead();
    return super.spanish;
  }

  @override
  set spanish(String value) {
    _$spanishAtom.reportWrite(value, super.spanish, () {
      super.spanish = value;
    });
  }

  final _$titleAtom = Atom(name: '_SettingsControllerBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$subTitleAtom = Atom(name: '_SettingsControllerBase.subTitle');

  @override
  String get subTitle {
    _$subTitleAtom.reportRead();
    return super.subTitle;
  }

  @override
  set subTitle(String value) {
    _$subTitleAtom.reportWrite(value, super.subTitle, () {
      super.subTitle = value;
    });
  }

  @override
  String toString() {
    return '''
english: ${english},
portuguese: ${portuguese},
spanish: ${spanish},
title: ${title},
subTitle: ${subTitle}
    ''';
  }
}
