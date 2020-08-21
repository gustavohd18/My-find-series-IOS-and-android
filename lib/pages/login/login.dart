import 'package:flutter/material.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';
import 'package:myFindMovies/service/authentication/login_bloc.dart';

class Login extends StatefulWidget {
  final bool isPortuguese;

  const Login(this.isPortuguese);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginBloc _loginBloc;

  bool isPortugues;

  String _password = '',
      _errorLoginMessage = '',
      _resetPasswordMessage = '',
      _resetPasswordTitle = '',
      _createAccount = '',
      _sendButton = '',
      _errorSendReset = '',
      _cancelButton = '',
      _sendButtonOk = '';

  AuthenticationService authenticationService = AuthenticationService();

  final myController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(authenticationService);
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isPortuguese) {
      _password = "Senha";
      _errorLoginMessage = "Erro com o login: Senha ou Email invalido";
      _resetPasswordMessage =
          "Para redefinir a senha, por favor digite seu email e siga as instruções enviadas para o Email";
      _resetPasswordTitle = "Redefinir a senha";
      _createAccount = "Criar uma conta";
      _sendButton = "Enviar";
      _cancelButton = "Cancelar";
      _sendButtonOk = "Email enviado";
      _errorSendReset = "Email not send try again";
    } else {
      _password = "Password";
      _cancelButton = "Cancel";
      _errorLoginMessage = "Error with login: Password or email invalid";
      _resetPasswordMessage =
          "To reset password, please type your email and follow instruction sent to email";
      _resetPasswordTitle = "Reset password";
      _createAccount = "Create Account";
      _sendButton = "Send";
      _sendButtonOk = "Email sent";
      _errorSendReset = "Email não enviado, tente novamente";
    }

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
                      labelText: 'Email',
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
                      labelText: _password,
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
                      _loginBloc.loginOrCreateError.listen((event) {
                        if (event) {
                          showAlertDialogError(context);
                        }
                      })
                    }
                : null,
          ),
        ),
        FlatButton(
          child: Text(_createAccount),
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
            child: Text(_createAccount),
            color: Colors.blue.shade200,
            disabledColor: Colors.transparent,
            onPressed: snapshot.data
                ? () => {
                      _loginBloc.loginOrCreateChanged.add('Create Account'),
                      _loginBloc.loginOrCreateError.listen((event) {
                        if (event) {
                          showAlertDialogError(context);
                        }
                      })
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
      child: Text(_cancelButton),
      onPressed: () {
        Navigator.of(context).pop(true);
      },
    );

    Widget confirmButton = FlatButton(
      child: Text(_sendButton),
      onPressed: () {
        if (myController.text != '') {
          authenticationService.resetPassword(myController.text);
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                Future.delayed(Duration(milliseconds: 300), () {
                  Navigator.of(context).pop(true);
                });
                return AlertDialog(
                  title: Icon(Icons.check),
                  content: Text(
                    _sendButtonOk,
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
                });
                return AlertDialog(
                  title: Icon(Icons.error),
                  content: Text(
                    _errorSendReset,
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
          child: Text(_resetPasswordTitle),
          color: Colors.blue.shade200,
          onPressed: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      _resetPasswordTitle,
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
            _resetPasswordMessage,
            textAlign: TextAlign.center,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              icon: Icon(Icons.mail_outline),
            ),
            controller: myController,
          ),
        ],
      ),
    );
  }

  showAlertDialogError(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop(true);
      },
    );

    AlertDialog alert = AlertDialog(
      content: Text(_errorLoginMessage),
      actions: [
        cancelButton,
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
