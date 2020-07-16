import 'package:atrak/repository/data/api_repository.dart';
import 'package:atrak/repository/data/beans/employee.dart';
import 'package:atrak/repository/data/beans/token.dart';
import 'package:atrak/repository/data/entities/login_user_entity.dart';
import 'package:atrak/repository/data/local_storage.dart';
import 'package:atrak/repository/data/web_client.dart';
import 'package:atrak/repository/data/entities/user_entity.dart';
import 'package:meta/meta.dart';

class ProdDataRepository implements ApiRepository {
  final WebClient _webClient;
  final LocalStorage _localStorage;

  const ProdDataRepository(
      {@required WebClient webClient, @required LocalStorage localStorage})
      : _webClient = webClient,
        _localStorage = localStorage;

  @override
  Future<void> logout() {
    return null;
  }

  @override
  Future<UserEntity> get user => Future.value(UserEntity());

  @override
  Future<void> updateUser(UserEntity entity) async {
    // keyValueStorage.saveUser(entity);
  }

  @override
  Future<Employee> login(LoginUserEntity entity) async {
    Token token = await _webClient.login(entity);
    Employee employee = await _webClient.getEmployeeDetails(token);
    employee.token = token;

    print(employee.toString());
/*
    print("emp details from DB");
    Employee emp = await _localStorage.getEmployee();
    print(emp);
*/
    return employee;
  }

  @override
  Future<Token> get token async {
    Token token = await _localStorage.getToken();
    return token;
  }
}
