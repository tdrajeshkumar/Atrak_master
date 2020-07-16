import 'package:atrak/repository/data/beans/employee.dart';
import 'package:atrak/repository/data/beans/token.dart';
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;

class LocalStorage {
  final String tag;
  final Future<String> dbPath;

  LocalStorage({@required this.tag, this.dbPath}) {
    _initTables();
  }

  /// The adapter and been
  SqfliteAdapter _adapter;
  EmployeeBean _employeeBean;
  TokenBean _tokenBean;

  Future<Null> _initTables() async {
    (await _getEmployeeBean())..createTable(ifNotExists: true);
    (await _getTokenBean())..createTable(ifNotExists: true);
  }

  Future<EmployeeBean> _getEmployeeBean() async {
    if (_employeeBean == null) {
      final SqfliteAdapter adapter = await _getAdapter();
      _employeeBean = EmployeeBean(adapter);
    }
    return _employeeBean;
  }

  Future<TokenBean> _getTokenBean() async {
    if (_tokenBean == null) {
      final SqfliteAdapter adapter = await _getAdapter();
      _tokenBean = TokenBean(adapter);
    }
    return _tokenBean;
  }

  Future<SqfliteAdapter> _getAdapter() async {
    if (_adapter == null) {
      _adapter = SqfliteAdapter(path.join(await dbPath, "atrak.db"));
      await _adapter.connect();
    }
    return _adapter;
  }

  Future<Null> saveEmployee(Employee employee) async {
    final EmployeeBean employeeBean = await _getEmployeeBean();

    Employee emp = (await employeeBean.getAll()).first;

    print("Employee details...");
    print(emp.toString());

    int id = await (await _getEmployeeBean()).insert(employee, cascade: true);
    //int id = await _employeeBean.insert(employee);
    print("Inseted ID : $id");
  }

  Future<Token> getToken() async {
    if (_tokenBean != null)
      return (await _tokenBean.getAll()).first;
    else
      return null;
  }

  Future<Employee> getEmployee() async {
    return (await (await _getEmployeeBean()).getAll()).first;
  }


  Future<void> close() async {
    if (_adapter != null) await _adapter.close();
  }

}
