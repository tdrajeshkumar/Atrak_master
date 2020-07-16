import 'package:atrak/blocs/atrak_bloc.dart';
import 'package:atrak/blocs/interactor.dart';
import 'package:atrak/blocs/localization.dart';
import 'package:atrak/dependency_injection.dart';
import 'package:atrak/localization.dart';
import 'package:atrak/routes.dart';
import 'package:atrak/screens/home_screen.dart';
import 'package:atrak/screens/login_screen.dart';
import 'package:atrak/theme.dart';
import 'package:atrak/widgets/block_provider.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

void main({@required Interactor interactor}) {
  runApp(Injector(
    interactor: interactor,
    child: BlocProvider(
      bloc: AtrakBloc(interactor),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: BlocLocalizations().appTitle,
        theme: AtrakTheme.theme,
        localizationsDelegates: [
          AtrakLocalizationsDelegate(),
          InheritedWidgetLocalizationsDelegate(),
        ],
        routes: {
          Routes.init: (context) => LoginScreen(),
          Routes.home: (context) => HomeScreen(),
        },
      ),
    ),
  ));
}
