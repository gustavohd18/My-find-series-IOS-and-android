import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:myFindMovies/service/authentication/authenticationBloc.dart';

class AuthenticationBlocProvider extends InheritedWidget {
  final AuthenticationBloc authenticationBloc;
  const AuthenticationBlocProvider(
      {Key key, Widget child, this.authenticationBloc})
      : super(key: key, child: child);
  static AuthenticationBlocProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType()
        as AuthenticationBlocProvider);
  }

  @override
  bool updateShouldNotify(AuthenticationBlocProvider old) =>
      authenticationBloc != old.authenticationBloc;
}
