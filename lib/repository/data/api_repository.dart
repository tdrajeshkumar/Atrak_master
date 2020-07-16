import 'package:atrak/repository/data/beans/employee.dart';
import 'package:atrak/repository/data/beans/token.dart';
import 'package:atrak/repository/data/entities/login_user_entity.dart';
import 'package:atrak/repository/data/entities/user_entity.dart';

abstract class ApiRepository {
  Future<UserEntity> get user;

  Future<void> updateUser(UserEntity entity);

  Future<void> logout();

  Future<Employee> login(LoginUserEntity entity);

  Future<Token> get token;
}
