// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:atrak/repository/data/beans/employee.dart';
import 'package:atrak/repository/data/beans/token.dart';
import 'package:atrak/repository/data/entities/login_user_entity.dart';
import 'package:atrak/utils/url_paths.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

/// A class that is meant to represent a Client that would be used to call a Web
/// Service. It is responsible for fetching and persisting Todos to and from the
/// cloud.
///
/// Since we're trying to keep this example simple, it doesn't communicate with
/// a real server but simply emulates the functionality.
///
class WebClient {
  //"http://192.168.1.4:8081"; //"http://farm-mojo-1.ap-south-1.elasticbeanstalk.com";

  Dio _dio = new Dio(Options(
      connectTimeout: 20000,
      receiveTimeout: 20000,
      contentType: ContentType.json,
      responseType: ResponseType.JSON));

  WebClient() {
    _dio.options.baseUrl = UrlPaths.endPointURL;
    _setCookie();
  }

  Future<void> _setCookie() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    _dio.cookieJar = new PersistCookieJar(tempPath);
  }

  Future<Token> login(LoginUserEntity entity) async {
    final Response response =
        await _dio.post(UrlPaths.login, data: entity.toJson(), options: Options(contentType: ContentType.parse("application/x-www-form-urlencoded")));
    return Token.fromJson(response.data);
  }

  Future<Employee> getEmployeeDetails(Token token) async {
    final Response response =
        await _dio.get(UrlPaths.userDetails, options: Options(headers: FormData.from(token.toJson())));
    return Employee.fromJson(response.data, token);
  }
}
