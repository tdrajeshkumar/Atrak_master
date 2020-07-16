import 'package:atrak/repository/data/api_repository.dart';
import 'package:atrak/repository/data/beans/employee.dart';
import 'package:atrak/repository/data/beans/token.dart';
import 'package:atrak/repository/data/entities/login_user_entity.dart';
import 'package:atrak/repository/data/entities/user_entity.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

abstract class ReactiveRepository {
  //Output Streams
  Stream<UserEntity> get user;

  Stream<Token> get token;

  Stream<Employee> get employee;

  //Input Future
  Future<void> updateEmployee(Employee employee);

  Future<void> logout();

  Future<void> updateUser(UserEntity entity);

  Future<void> login(LoginUserEntity user);

  void close();
}

class Repository implements ReactiveRepository {
  final ApiRepository _repository;
  final BehaviorSubject<UserEntity> _userSubject;
  final BehaviorSubject<Employee> _employeeSubject;
  bool _userLoaded = false;

  Repository({@required ApiRepository repository})
      : this._repository = repository,
        this._userSubject = BehaviorSubject<UserEntity>(),
        this._employeeSubject = BehaviorSubject<Employee>();

  void _loadUser() async {
    _userLoaded = true;
    await _repository.user.then((entity) => _userSubject.add(entity));
  }

  @override
  Stream<UserEntity> get user {
    if (!_userLoaded) {
      _loadUser();
    }
    return _userSubject.stream;
  }

  @override
  Future<void> logout() {
    _repository.logout();
    return null;
  }

  @override
  Future<void> updateUser(UserEntity entity) async {
    await _repository.updateUser(entity);
    _userSubject.add(entity);

    return null;
  }

  @override
  Future<void> login(LoginUserEntity entity) async {
    await _repository.login(entity).then((employee) {
      _employeeSubject.add(employee);
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Stream<Token> get token => _repository.token.asStream();

  @override
  Stream<Employee> get employee => _employeeSubject.stream;

  @override
  Future<void> updateEmployee(Employee employee) async {
    _employeeSubject.add(employee);
  }

  @override
  void close() {}
}
