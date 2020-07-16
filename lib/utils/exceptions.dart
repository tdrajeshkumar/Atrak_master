import 'package:meta/meta.dart';

class UserDoesNotExists implements Exception {
}

class FetchDataException implements Exception {
  final String _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "$_message";
  }
}
