import 'dart:async';

import 'package:atrak/blocs/interactor.dart';
import 'package:atrak/blocs/models/login_user.dart';
import 'package:atrak/screens/login_screen.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final Interactor _interactor;
  final List<StreamSubscription<dynamic>> _subscriptions;

  static final loadingController = StreamController<bool>(sync: true);

  //Output
  Stream<bool> get loading => loadingController.stream;

  //Input
  final Sink<LoginUser> loginUser;

  LoginBloc._(
      this.loginUser, this._interactor, this._subscriptions);

  factory LoginBloc(Interactor interactor, LoginDelegate delegate) {
    final loginUserController = StreamController<LoginUser>(sync: true);

    final subscriptions = <StreamSubscription<dynamic>>[
      loginUserController.stream.listen((user) {
        loadingController.add(true);
        interactor.login(user).then((_) {
          loadingController.add(false);
          delegate.gotoHomeScreen();
        }).catchError((error) {
          loadingController.add(false);
          delegate.loginError("error occurred");
        });
      }),
    ];

    return LoginBloc._(loginUserController, interactor, subscriptions);
  }

  void close() {
    loginUser.close();
    _subscriptions.forEach((subscription) {
      subscription.cancel();
    });
  }
}
