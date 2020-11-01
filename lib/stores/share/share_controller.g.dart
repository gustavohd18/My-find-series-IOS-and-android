// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShareController on _ShareControllerBase, Store {
  final _$titleAtom = Atom(name: '_ShareControllerBase.title');

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

  final _$emptyAtom = Atom(name: '_ShareControllerBase.empty');

  @override
  String get empty {
    _$emptyAtom.reportRead();
    return super.empty;
  }

  @override
  set empty(String value) {
    _$emptyAtom.reportWrite(value, super.empty, () {
      super.empty = value;
    });
  }

  @override
  String toString() {
    return '''
title: ${title},
empty: ${empty}
    ''';
  }
}
