import 'dart:async';

import 'package:atrak/localizations/messages_all.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AtrakLocalizations {
  AtrakLocalizations(this.locale);

  final Locale locale;

  static Future<AtrakLocalizations> load(Locale locale) {
    return initializeMessages(locale.toString()).then((_) {
      return AtrakLocalizations(locale);
    });
  }

  static AtrakLocalizations of(BuildContext context) {
    return Localizations.of<AtrakLocalizations>(
        context, AtrakLocalizations);
  }

  String get logoText => Intl.message(
    'Brand logo',
    name: 'logoText',
    args: [],
    locale: locale.toString(),
  );

  String get login => Intl.message(
        'Login',
        name: 'login',
        args: [],
        locale: locale.toString(),
      );

  String get usernameHint => Intl.message(
    'User ID',
    name: 'usernameHint',
    args: [],
    locale: locale.toString(),
  );

  String get usernameLabel => Intl.message(
    'User ID',
    name: 'usernameLabel',
    args: [],
    locale: locale.toString(),
  );

  String get passwordLabel => Intl.message(
    'Password',
    name: 'passwordLabel',
    args: [],
    locale: locale.toString(),
  );


}

class AtrakLocalizationsDelegate
    extends LocalizationsDelegate<AtrakLocalizations> {
  @override
  Future<AtrakLocalizations> load(Locale locale) =>
      AtrakLocalizations.load(locale);

  @override
  bool shouldReload(AtrakLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains("en");
}
