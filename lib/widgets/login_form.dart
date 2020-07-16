import 'package:atrak/blocs/login_bloc.dart';
import 'package:atrak/blocs/models/login_user.dart';
import 'package:atrak/localization.dart';
import 'package:atrak/theme.dart';
import 'package:atrak/utils/form_utils.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  static final loginFormKey = GlobalKey<FormState>();

  static final usernameKey = GlobalKey<FormFieldState<String>>();
  static final passwordKey = GlobalKey<FormFieldState<String>>();

  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  final Sink<LoginUser> login;

  LoginForm({this.login});

  @override
  Widget build(BuildContext context) {
    void _formSubmitted() async {
      final form = loginFormKey.currentState;

      if (form.validate()) {
        print("Form Validated Successfully");

        final loginUser = LoginUser(
            username: usernameKey.currentState.value,
            password: passwordKey.currentState.value);
        login.add(loginUser);
        FormUtils.hideKeyboard(context);
      } else {
        print("Form is not Validated.");
      }
    }

    return Center(
        child: SingleChildScrollView(
      child: Form(
        key: loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                key: usernameKey,
                autofocus: true,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: _usernameFocus,
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(fontSize: 20.0),
                validator: (val) {
                  return FormUtils.validate(value: val, type: TYPES.text);
                },
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.display1.copyWith(
                      color: AtrakTheme.greyTextColor, fontSize: 20.0),
                  labelStyle: Theme.of(context).textTheme.display1.copyWith(
                      color: AtrakTheme.greyTextColor, fontSize: 20.0),
                  hintText: AtrakLocalizations.of(context).usernameHint,
                  labelText: AtrakLocalizations.of(context).usernameLabel,
                ),
                onFieldSubmitted: (term) {
                  _usernameFocus.unfocus();
                  FocusScope.of(context).requestFocus(_passwordFocus);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                key: passwordKey,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                focusNode: _passwordFocus,
                obscureText: true,
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(fontSize: 20.0),
                validator: (val) {
                  return FormUtils.validate(value: val, type: TYPES.text);
                },
                decoration: InputDecoration(
                    hintStyle: Theme.of(context).textTheme.display1.copyWith(
                        color: AtrakTheme.greyTextColor, fontSize: 20.0),
                    labelStyle: Theme.of(context).textTheme.display1.copyWith(
                        color: AtrakTheme.greyTextColor, fontSize: 20.0),
                    labelText: AtrakLocalizations.of(context).passwordLabel),
                onFieldSubmitted: (term) {
                  _formSubmitted();
                },
              ),
              SizedBox(
                height: 50.0,
              ),
              RaisedButton(
                onPressed: () {
                  _formSubmitted();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    AtrakLocalizations.of(context).login,
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(color: Colors.white, fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
