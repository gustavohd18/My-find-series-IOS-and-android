import 'package:flutter/material.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';
import 'package:myFindMovies/service/authentication/login_bloc.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginBloc _loginBloc;

  AuthenticationService authenticationService = AuthenticationService();

  final myController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(authenticationService);
  }

  @override
  Widget build(BuildContext context) {
    _loginBloc.loginOrCreateError.listen((event) {
      if (event) {
        showAlertDialogError(context);
      }
    });
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            child: Icon(
              Icons.account_circle,
              size: 88.0,
              color: Colors.white,
            ),
            preferredSize: Size.fromHeight(40.0)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              StreamBuilder(
                stream: _loginBloc.email,
                builder: (BuildContext context, AsyncSnapshot snapshot) =>
                    TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email Address',
                      icon: Icon(Icons.mail_outline),
                      errorText: snapshot.error),
                  onChanged: _loginBloc.emailChanged.add,
                ),
              ),
              StreamBuilder(
                stream: _loginBloc.password,
                builder: (BuildContext context, AsyncSnapshot snapshot) =>
                    TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      icon: Icon(Icons.security),
                      errorText: snapshot.error),
                  onChanged: _loginBloc.passwordChanged.add,
                ),
              ),
              SizedBox(height: 48.0),
              _buildLoginAndCreateButtons(),
              _buttonResetPassword(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  Widget _buildLoginAndCreateButtons() {
    return StreamBuilder(
      initialData: 'Login',
      stream: _loginBloc.loginOrCreateButton,
      builder: ((BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == 'Login') {
          return _buttonsLogin();
        } else if (snapshot.data == 'Create Account') {
          return _buttonsCreateAccount();
        }
      }),
    );
  }

  Column _buttonsLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        StreamBuilder(
          initialData: false,
          stream: _loginBloc.enableLoginCreateButton,
          builder: (BuildContext context, AsyncSnapshot snapshot) =>
              RaisedButton(
            elevation: 16.0,
            child: Text('Login'),
            color: Colors.blue.shade200,
            disabledColor: Colors.transparent,
            onPressed: snapshot.data
                ? () => {
                      _loginBloc.loginOrCreateChanged.add('Login'),
                    }
                : null,
          ),
        ),
        FlatButton(
          child: Text('Create Account'),
          onPressed: () {
            _loginBloc.loginOrCreateButtonChanged.add('Create Account');
          },
        ),
      ],
    );
  }

  Column _buttonsCreateAccount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        StreamBuilder(
          initialData: false,
          stream: _loginBloc.enableLoginCreateButton,
          builder: (BuildContext context, AsyncSnapshot snapshot) =>
              RaisedButton(
            elevation: 16.0,
            child: Text('Create Account'),
            color: Colors.blue.shade200,
            disabledColor: Colors.transparent,
            onPressed: snapshot.data
                ? () => {
                      _loginBloc.loginOrCreateChanged.add('Create Account'),
                    }
                : null,
          ),
        ),
        FlatButton(
          child: Text('Login'),
          onPressed: () {
            _loginBloc.loginOrCreateButtonChanged.add('Login');
          },
        ),
      ],
    );
  }

  Column _buttonResetPassword() {
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop(true);
      },
    );

    Widget confirmButton = FlatButton(
      child: Text("Send"),
      onPressed: () {
        if (myController.text != '') {
          authenticationService.resetPassword(myController.text);
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                Future.delayed(Duration(milliseconds: 300), () {
                  Navigator.of(context).pop(true);
                  //x  Navigator.of(context).
                });
                return AlertDialog(
                  title: Icon(Icons.check),
                  content: Text(
                    "Email sended",
                    textAlign: TextAlign.center,
                  ),
                );
              });
        } else {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                Future.delayed(Duration(milliseconds: 300), () {
                  Navigator.of(context).pop(true);
                  //x  Navigator.of(context).
                });
                return AlertDialog(
                  title: Icon(Icons.error),
                  content: Text(
                    "Email not send try again",
                    textAlign: TextAlign.center,
                  ),
                );
              });
        }
      },
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        RaisedButton(
          elevation: 16.0,
          child: Text('Reset password'),
          color: Colors.blue.shade200,
          onPressed: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      "Reset password",
                      textAlign: TextAlign.center,
                    ),
                    content: _dialogReset(),
                    actions: [confirmButton, cancelButton],
                  );
                });
          },
        ),
      ],
    );
  }

  Container _dialogReset() {
    return Container(
      width: 300,
      height: 150,
      child: Column(
        children: [
          Text(
            "To reset password please, type your email and follow instruction send to  email",
            textAlign: TextAlign.center,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email Address',
              icon: Icon(Icons.mail_outline),
            ),
            controller: myController,
          ),
        ],
      ),
    );
  }

  showAlertDialogError(BuildContext context) {
    Widget cancelaButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop(true);
      },
    );

    AlertDialog alert = AlertDialog(
      content: Text("Error with login"),
      actions: [
        cancelaButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
