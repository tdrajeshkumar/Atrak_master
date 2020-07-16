import 'package:atrak/blocs/models/login_user.dart';
import 'package:atrak/blocs/models/user.dart';
import 'package:atrak/repository/data/beans/employee.dart';
import 'package:atrak/repository/data/beans/token.dart';
import 'package:atrak/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class Interactor {
  final ReactiveRepository repository;

  Interactor(this.repository);

  Stream<User> get user => repository.user
      .where((entity) => entity != null)
      .map((entity) => User.fromEntity(entity));

  Stream<DateTime> get currentTime => Observable.periodic(Duration(seconds: 1)).map((_) => DateTime.now());

  Stream<Employee> get employee => repository.employee;


  Future<void> login(LoginUser user) => repository.login(user.toEntity());

  Stream<Token> get token => repository.token;

  // Clean the Resources and freeup memory.
  void close() {
    repository.close();
  }

  Future<void> updateUser(User user) => repository.updateUser(user.toEntity());

}
