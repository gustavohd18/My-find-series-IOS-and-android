import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myFindMovies/stores/login/login_controller.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ModularState<Login, LoginController> {
  bool isPortugues;

  final myController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // this should not be done in build method.
    this.controller.reload();
  }

  @override
  Widget build(BuildContext context) {
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
              Observer(
                  builder: (_) => TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            icon: Icon(Icons.mail_outline),
                            errorText: this.controller.emailPlaceholder),
                        onChanged: (text) {
                          this.controller.setEmail(text);
                        },
                      )),
              Observer(
                  builder: (_) => TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: this.controller.passwordWord,
                            icon: Icon(Icons.security),
                            errorText: this.controller.passwordPlaceholder),
                        onChanged: (text) {
                          this.controller.setPassword(text);
                        },
                      )),
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
    super.dispose();
  }

  Widget _buildLoginAndCreateButtons() {
    return Observer(builder: (_) {
      if (this.controller.type == 'Login') {
        return _buttonsLogin();
      } else if (this.controller.type == 'Create Account') {
        return _buttonsCreateAccount();
      }
    });
  }

  Column _buttonsLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Observer(
            builder: (_) => RaisedButton(
                elevation: 16.0,
                child: Text('Login'),
                color: Colors.blue.shade200,
                disabledColor: Colors.transparent,
                onPressed: this.controller.enableButton
                    ? () async {
                        await this.controller.logIn();

                        if (!this.controller.isLogin) {
                          showAlertDialogError(context);
                        } else {
                          Modular.to.pushReplacementNamed('/home');
                        }
                      }
                    : null)),
        FlatButton(
          child: Observer(
            builder: (_) => Text(this.controller.createAccountText),
          ),
          onPressed: () {
            this.controller.setType('Create Account');
          },
        ),
      ],
    );
  }

  Column _buttonsCreateAccount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Observer(
            builder: (_) => RaisedButton(
                elevation: 16.0,
                child: Observer(
                  builder: (_) => Text(this.controller.createAccountText),
                ),
                color: Colors.blue.shade200,
                disabledColor: Colors.transparent,
                onPressed: this.controller.enableButton
                    ? () async {
                        await this.controller.createAccount();

                        if (!this.controller.isLogin) {
                          showAlertDialogError(context);
                        } else {
                          Modular.to.pushReplacementNamed('/home');
                        }
                      }
                    : null)),
        FlatButton(
          child: Text('Login'),
          onPressed: () {
            this.controller.setType('Login');
          },
        ),
      ],
    );
  }

  Column _buttonResetPassword() {
    Widget cancelButton = FlatButton(
      child: Observer(
        builder: (_) => Text(this.controller.cancelButton),
      ),
      onPressed: () {
        Navigator.of(context).pop(true);
      },
    );

    Widget confirmButton = FlatButton(
      child: Observer(
        builder: (_) => Text(this.controller.sendButton),
      ),
      onPressed: () async {
        if (myController.text != '') {
          await this.controller.resetPassword(myController.text);
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                Future.delayed(Duration(milliseconds: 300), () {
                  Navigator.of(context).pop(true);
                });
                return AlertDialog(
                  title: Icon(Icons.check),
                  content: Observer(
                    builder: (_) => Text(this.controller.sendButtonOk),
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
                    content: Observer(
                      builder: (_) => Text(
                        this.controller.errorSendReset,
                        textAlign: TextAlign.center,
                      ),
                    ));
              });
        }
      },
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        RaisedButton(
          elevation: 16.0,
          child: Observer(
            builder: (_) => Text(this.controller.resetPasswordTitle),
          ),
          color: Colors.blue.shade200,
          onPressed: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: Observer(
                      builder: (_) => Text(
                        this.controller.resetPasswordTitle,
                        textAlign: TextAlign.center,
                      ),
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
          Observer(
              builder: (_) => Text(
                    this.controller.resetPasswordMessage,
                    textAlign: TextAlign.center,
                  )),
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
      content:
          Observer(builder: (_) => Text(this.controller.errorLoginMessage)),
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
