// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'package:atrak/repository/data/entities/user_entity.dart';
import 'package:atrak/utils/mmkv_keys.dart';
import 'package:meta/meta.dart';
import 'package:mmkv_plugin/mmkv_plugin.dart';

/// Loads and saves a List of Todos using a text file stored on the device.
///
/// Note: This class has no direct dependencies on any Flutter dependencies.
/// Instead, the `getDirectory` method should be injected. This allows for
/// testing.
class KeyValueStorage {
  final String tag;
  final Future<Mmkv> keyValue;

  const KeyValueStorage({@required this.tag, this.keyValue});

  Future<String> _getKeyStoreValue(String key) async {
    return await (await keyValue).getString(key);
  }

  Future<void> _storeKeyValue(String key, String value) async {
    return await (await keyValue).putString(key, value);
  }

  Future<void> _deleteKey(String key) async {
    (await keyValue).remove(key);
  }

  Future<UserEntity> get user async {
    final String user = await _getKeyStoreValue(MmkvKeys.loggedUser);
    final json = user == null
        ? null
        : user.isNotEmpty ? JsonDecoder().convert(user) : null;
    return json != null ? UserEntity.fromJson(json) : UserEntity();
  }

  Future<String> getLastLoggedUserName() {
    return Future.value(_getKeyStoreValue(MmkvKeys.lastLoggedUserName));
  }

  Future<void> saveUser(UserEntity entity) => _storeKeyValue(
      MmkvKeys.loggedUser, JsonEncoder().convert(entity.toJson()));

}
