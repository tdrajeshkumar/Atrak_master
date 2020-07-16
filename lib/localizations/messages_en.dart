// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'en';

  static m0(task) => "Deleted \"$task\"";

  final messages = _notInlinedMessages(_notInlinedMessages);

  static _notInlinedMessages(_) => {
        "logoText": MessageLookupByLibrary.simpleMessage("Brand Logo"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "usernameHint": MessageLookupByLibrary.simpleMessage("User ID"),
        "usernameLabel": MessageLookupByLibrary.simpleMessage("User ID"),
        "passwordLabel": MessageLookupByLibrary.simpleMessage("Password"),
      };
}
