// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$emailAtom = Atom(name: '_LoginControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$emailPlaceholderAtom =
      Atom(name: '_LoginControllerBase.emailPlaceholder');

  @override
  String get emailPlaceholder {
    _$emailPlaceholderAtom.reportRead();
    return super.emailPlaceholder;
  }

  @override
  set emailPlaceholder(String value) {
    _$emailPlaceholderAtom.reportWrite(value, super.emailPlaceholder, () {
      super.emailPlaceholder = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$passwordPlaceholderAtom =
      Atom(name: '_LoginControllerBase.passwordPlaceholder');

  @override
  String get passwordPlaceholder {
    _$passwordPlaceholderAtom.reportRead();
    return super.passwordPlaceholder;
  }

  @override
  set passwordPlaceholder(String value) {
    _$passwordPlaceholderAtom.reportWrite(value, super.passwordPlaceholder, () {
      super.passwordPlaceholder = value;
    });
  }

  final _$typeAtom = Atom(name: '_LoginControllerBase.type');

  @override
  String get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$isLoginAtom = Atom(name: '_LoginControllerBase.isLogin');

  @override
  bool get isLogin {
    _$isLoginAtom.reportRead();
    return super.isLogin;
  }

  @override
  set isLogin(bool value) {
    _$isLoginAtom.reportWrite(value, super.isLogin, () {
      super.isLogin = value;
    });
  }

  final _$enableButtonAtom = Atom(name: '_LoginControllerBase.enableButton');

  @override
  bool get enableButton {
    _$enableButtonAtom.reportRead();
    return super.enableButton;
  }

  @override
  set enableButton(bool value) {
    _$enableButtonAtom.reportWrite(value, super.enableButton, () {
      super.enableButton = value;
    });
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  bool isEnableButton() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.isEnableButton');
    try {
      return super.isEnableButton();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
emailPlaceholder: ${emailPlaceholder},
password: ${password},
passwordPlaceholder: ${passwordPlaceholder},
type: ${type},
isLogin: ${isLogin},
enableButton: ${enableButton}
    ''';
  }
}
