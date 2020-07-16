import 'package:atrak/repository/data/entities/login_user_entity.dart';
import 'package:meta/meta.dart';

@immutable
class LoginUser {
  final String username;
  final String password;

  LoginUser({this.username, this.password});

  LoginUser copyWith({String username, String password}) {
    return LoginUser(
        username: username ?? this.username,
        password: password ?? this.password);
  }

  LoginUser fromEntity(LoginUserEntity entity) {
    return LoginUser(username: entity.username, password: entity.password);
  }

  LoginUserEntity toEntity() {
    return LoginUserEntity(username: this.username, password: this.password);
  }

  @override
  String toString() {
    return 'LoginUser{username: $username, password: $password}';
  }
}
