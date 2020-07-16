import 'package:atrak/blocs/login_bloc.dart';
import 'package:atrak/dependency_injection.dart';
import 'package:atrak/localization.dart';
import 'package:atrak/routes.dart';
import 'package:atrak/theme.dart';
import 'package:atrak/widgets/loading.dart';
import 'package:atrak/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginDelegate {
  LoginBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (_bloc != null) {
      _bloc.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = LoginBloc(Injector.of(context).interactor, this);

    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Scaffold(
            appBar: AppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: AtrakTheme.greyTextColor,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        AtrakLocalizations.of(context).logoText,
                        style: Theme.of(context).textTheme.display3.copyWith(
                            color: AtrakTheme.greyTextColor,
                            fontWeight: FontWeight.w700,
                            fontSize:
                                Theme.of(context).textTheme.headline.fontSize),
                      ),
                    ],
                  ),
                  Expanded(
                    child: LoginForm(login: _bloc.loginUser),
                  ),
                ],
              ),
            ),
          ),
        ),
        StreamBuilder<bool>(
          stream: _bloc.loading,
          builder: (context, loadingSnapshot) {
            return loadingSnapshot.hasData && loadingSnapshot.data
                ? Container(
                    child: LoadingSpinner(),
                  )
                : Container();
          },
        ),
      ],
    );
  }

  @override
  void gotoHomeScreen() {
    Navigator.of(context).pushReplacementNamed(Routes.home);
  }

  @override
  void loginError(String msg) {
    print("Error Message : $msg");
  }
}

abstract class LoginDelegate {
  void gotoHomeScreen();

  void loginError(String msg);
}
