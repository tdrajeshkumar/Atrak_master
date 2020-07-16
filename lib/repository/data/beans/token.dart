import 'dart:async';

import 'package:atrak/repository/data/beans/employee.dart';
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query/jaguar_query.dart';

part 'token.jorm.dart';

// The model
class Token {
  Token();

  Token.make(
    this.accessToken,
    this.tokenType,
    this.expiredIn,
    this.refreshToken,
  );

  static Token fromJson(Map<String, Object> json) {
    return Token.make(
        json["access_token"] as String,
        json["token_type"] as String,
        DateTime.now().add(Duration(seconds: json["expires_in"] as int)),
        json["refresh_token"] as String);
  }

  toJson()=>{"Authorization": "$tokenType $accessToken"};

  @PrimaryKey()
  String accessToken;

  @Column(isNullable: true)
  String tokenType;

  @Column(isNullable: true)
  DateTime expiredIn;

  @Column(isNullable: true)
  String refreshToken;

  @BelongsTo(EmployeeBean, name: "id", isNullable: true)
  int employeeId;

  String toString() =>
      'Token{accessToken: $accessToken, tokenType: $tokenType, expiredIn: $expiredIn, refreshToken: $refreshToken}';
}

@GenBean()
class TokenBean extends Bean<Token> with _TokenBean {
  EmployeeBean _employeeBean;

  EmployeeBean get employeeBean => _employeeBean ??= new EmployeeBean(adapter);

  TokenBean(Adapter adapter) : super(adapter);

  final String tableName = 'items';
}
